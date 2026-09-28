"""Deterministic SYNTHETIC business data, written into LedgerSMB's REAL schema.

LedgerSMB ships a schema and no ledger data. So that the analytical layer has something to
report on, this generator simulates 18 months of a fictional distributor, **Harbor Mill Supply
Co.**, which buys industrial components and materials and sells them to 60 customers.
Everything it writes is synthetic and says so (entity notes and ``defaults.demo_data``).

Fidelity choices, all made so that downstream numbers come from LedgerSMB's logic rather than
ours:

* **Master data goes through LedgerSMB's own stored procedures**: ``account_heading_save``,
  ``account__save`` (the real US chart of accounts, ``locale/coa/us/General.xml``),
  ``company__save``, ``eca__save`` and ``eca__location_save``. Countries come from LedgerSMB's
  seed file ``locale/initial-data.xml``.
* **COGS is computed by LedgerSMB**: after each sales-invoice line,
  ``cogs__add_for_ar_line(invoice_id)`` runs LedgerSMB's FIFO allocation and posts the
  COGS/inventory journal lines itself. Purchases run ``cogs__add_for_ap_line``.
* **Payments are posted by LedgerSMB**: ``payment_post(...)`` settles AR/AP open items.
* **Sign convention** (verified in ``sql/modules/trial_balance.sql``): in ``acc_trans.amount_bc``
  a negative amount is a debit and a positive amount is a credit.
* Events are processed in date order, so purchases precede the sales that consume them (FIFO).

Run:  .venv/bin/python data_generator/generate.py [--seed 20250101]
"""

from __future__ import annotations

import argparse
import datetime as dt
import random
import xml.etree.ElementTree as ET
from collections import defaultdict
from dataclasses import dataclass, field
from decimal import ROUND_HALF_UP, Decimal
from pathlib import Path

import psycopg

LSMB = Path("/home/legion/PycharmProjects/LedgerSMB")
DSN = "host=127.0.0.1 port=55432 user=ekos password=ekos-local-only dbname=ledgersmb"
START = dt.date(2025, 1, 1)
END = dt.date(2026, 6, 30)
CURR = "USD"
TAX_RATE = Decimal("0.07")
NS = {"c": "http://ledgersmb.org/xml-schemas/configuration"}
CATEGORY = {"Asset": "A", "Liability": "L", "Equity": "Q", "Income": "I", "Expense": "E"}


def money(x: float | Decimal) -> Decimal:
    return Decimal(str(x)).quantize(Decimal("0.01"), rounding=ROUND_HALF_UP)


@dataclass
class Part:
    id: int
    number: str
    group: str
    is_service: bool
    cost: Decimal
    price: Decimal
    rop: int
    onhand: Decimal = Decimal(0)
    popularity: float = 1.0


@dataclass
class Counterparty:
    eca_id: int
    entity_id: int
    name: str
    segment: str
    terms: int
    pay_delay: int  # habitual days late (customers) / early (vendors)
    weight: float = 1.0


@dataclass
class OpenInvoice:
    trans_id: int
    open_item_id: int
    eca: Counterparty
    amount: Decimal
    due: dt.date
    pay_on: dt.date


@dataclass
class State:
    acct: dict[str, int] = field(default_factory=dict)  # accno -> account.id
    parts: list[Part] = field(default_factory=list)
    customers: list[Counterparty] = field(default_factory=list)
    vendors: list[Counterparty] = field(default_factory=list)
    open_ar: list[OpenInvoice] = field(default_factory=list)
    open_ap: list[OpenInvoice] = field(default_factory=list)
    inv_no: int = 1000
    po_no: int = 5000
    so_no: int = 8000
    counts: dict[str, int] = field(default_factory=lambda: defaultdict(int))


# ── reference data ──────────────────────────────────────────────────────────


def us_country_id(cur: psycopg.Cursor) -> int:
    """Countries are LedgerSMB seed data (sql/seed_initial_data.py, run by the schema loader)."""
    cur.execute("SELECT min(id) FROM country WHERE short_name = 'US'")
    return cur.fetchone()[0]


def load_chart(cur: psycopg.Cursor, st: State) -> None:
    """The real LedgerSMB US General chart, through LedgerSMB's own save procedures."""
    root = ET.parse(LSMB / "locale" / "coa" / "us" / "General.xml").getroot()
    for heading in root.find("c:coa", NS).findall("c:account-heading", NS):
        cur.execute(
            "SELECT account_heading_save(NULL, %s, %s, NULL)",
            (heading.get("code"), heading.get("description")),
        )
        hid = cur.fetchone()[0]
        for acc in heading.findall("c:account", NS):
            links = [lk.get("code") for lk in acc.findall("c:link", NS)]
            cur.execute(
                "SELECT account__save(NULL, %s, %s, %s, NULL, %s, NULL, %s, %s, %s::text[], %s,"
                " false, false)",
                (
                    acc.get("code"),
                    acc.get("description"),
                    CATEGORY[acc.get("category")],
                    hid,
                    acc.get("contra") == "true",
                    acc.get("tax") == "true",
                    links,
                    # AR/AP are open-item managed: every line on them carries its open item.
                    bool({"AR", "AP"} & set(links)),
                ),
            )
            st.acct[acc.get("code")] = cur.fetchone()[0]


#: Every account this generator posts to, by its number in LedgerSMB's US General chart
#: (locale/coa/us/General.xml). Checked against the loaded chart at startup — a wrong number is a
#: hard error, never a silent mis-posting.
ACC = {
    "cash": "1060",          # Checking Account            AR_paid, AP_paid
    "ar": "1200",            # Accounts Receivables        AR (open-item managed)
    "inventory": "1510",     # Inventory                   IC
    "equipment": "1820",     # Office Furniture & Equipment
    "accum_dep": "1825",     # Accum. Amort. -Furn. & Equip. (contra)
    "ap": "2100",            # Accounts Payable            AP (open-item managed)
    "sales_tax": "2150",     # Sales Tax                   AR_tax, IC_taxpart
    "capital": "3350",       # Common Shares
    "sales": "4010",         # Sales                       AR_amount, IC_sale, IC_income
    "fx_gain": "4450",       # Foreign Exchange Gain
    "cogs": "5010",          # Purchases                   IC_cogs, IC_expense
    "wages": "5410",         # Wages & Salaries
    "payroll_tax": "5440",   # Benefits - Payroll Taxes
    "depreciation": "5660",  # Amortization Expense
    "insurance": "5685",     # Insurance
    "rent": "5760",          # Rent
    "telephone": "5780",     # Telephone
    "utilities": "5790",     # Utilities
    "fx_loss": "5810",       # Foreign Exchange Loss
}


def acct(st: State, key: str) -> int:
    """account.id for a key of :data:`ACC`."""
    return st.acct[ACC[key]]


# ── master data ─────────────────────────────────────────────────────────────

PART_GROUPS = {
    # group: (count, cost range, markup range, is_service)
    "Fasteners": (22, (0.05, 2.5), (1.9, 2.8), False),
    "Bearings & Seals": (16, (3, 45), (1.6, 2.2), False),
    "Hydraulics": (14, (25, 380), (1.4, 1.8), False),
    "Electrical Components": (18, (1.5, 60), (1.5, 2.1), False),
    "Raw Materials — Steel": (12, (18, 240), (1.2, 1.45), False),
    "Raw Materials — Polymers": (10, (6, 90), (1.25, 1.5), False),
    "Tools & Consumables": (16, (4, 120), (1.5, 2.0), False),
    "Services": (6, (40, 90), (1.8, 2.4), True),
}
SEGMENTS = {"OEM Manufacturer": 0.35, "Maintenance & Repair": 0.3, "Distributor": 0.2,
            "Government": 0.15}
CITIES = [("Portland", "OR"), ("Seattle", "WA"), ("Boise", "ID"), ("Sacramento", "CA"),
          ("Reno", "NV"), ("Denver", "CO"), ("Salt Lake City", "UT"), ("Phoenix", "AZ")]
WORDS = ["Cascade", "Summit", "Ridge", "Harbor", "Pioneer", "Granite", "Evergreen", "Falcon",
         "Northstar", "Redwood", "Keystone", "Silverline", "Ironwood", "Bluewater", "Beacon",
         "Timberline", "Copper", "Lakeside", "Frontier", "Anchor", "Sterling", "Orchard", "Delta",
         "Meridian", "Quarry", "Canyon", "Horizon", "Vantage", "Crescent", "Alder"]
SUFFIX = ["Manufacturing", "Industries", "Fabrication", "Machine Works", "Services", "Supply",
          "Systems", "Engineering", "Maintenance", "Group"]


def make_parts(cur: psycopg.Cursor, st: State, rng: random.Random) -> None:
    group_ids = {}
    for g in PART_GROUPS:
        cur.execute("INSERT INTO partsgroup (partsgroup) VALUES (%s) RETURNING id", (g,))
        group_ids[g] = cur.fetchone()[0]
    n = 0
    for g, (count, (clo, chi), (mlo, mhi), service) in PART_GROUPS.items():
        for i in range(count):
            n += 1
            cost = money(rng.uniform(clo, chi))
            price = money(cost * Decimal(str(rng.uniform(mlo, mhi))))
            number = f"{g[:3].upper()}-{1000 + n}"
            desc = f"{g.split(' — ')[-1].rstrip('s')} item {i + 1:02d}"
            cur.execute(
                """INSERT INTO parts (partnumber, description, unit, listprice, sellprice,
                     lastcost, weight, onhand, rop, inventory_accno_id, income_accno_id,
                     expense_accno_id, partsgroup_id, obsolete, notes)
                   VALUES (%s,%s,%s,%s,%s,%s,%s,0,%s,%s,%s,%s,%s,false,'synthetic demo data')
                   RETURNING id""",
                (
                    number, desc, "hr" if service else "ea", price, price, cost,
                    None if service else money(rng.uniform(0.01, 12)),
                    0 if service else rng.randint(20, 200),
                    None if service else acct(st, "inventory"),
                    acct(st, "sales") if service else acct(st, "sales"),
                    acct(st, "cogs") if service else acct(st, "cogs"),
                    group_ids[g],
                ),
            )
            pid = cur.fetchone()[0]
            cur.execute(
                "INSERT INTO partstax (parts_id, chart_id) VALUES (%s, %s)", (pid, acct(st, "sales_tax"))
            )
            st.parts.append(Part(pid, number, g, service, cost, price,
                                 0 if service else rng.randint(20, 200),
                                 popularity=rng.paretovariate(1.6)))
    st.counts["parts"] = n


def make_counterparties(
    cur: psycopg.Cursor, st: State, rng: random.Random, us: int
) -> None:
    for label in SEGMENTS:
        cur.execute("INSERT INTO business (description, discount) VALUES (%s, 0)", (label,))
    cur.execute("SELECT id, description FROM business")
    business = {d: i for i, d in cur.fetchall()}
    used: set[str] = set()

    def name() -> str:
        while True:
            n = f"{rng.choice(WORDS)} {rng.choice(SUFFIX)}"
            if n not in used:
                used.add(n)
                return n

    for kind, count in (("customer", 60), ("vendor", 25)):
        for i in range(count):
            nm = name() + (" Inc." if kind == "customer" else " Ltd.")
            cur.execute(
                # company__save returns the company row; its entity_id is what the ECA hangs off.
                "SELECT (company__save(%s, %s, %s, NULL, NULL, %s, NULL, NULL)).entity_id",
                (f"{kind[0].upper()}-{i + 1:04d}", nm, f"{rng.randint(10, 99)}-{rng.randint(1000000, 9999999)}", us),
            )
            entity_id = cur.fetchone()[0]
            segment = rng.choices(list(SEGMENTS), weights=list(SEGMENTS.values()))[0]
            terms = rng.choice([30, 30, 30, 45, 60]) if kind == "customer" else rng.choice([30, 45])
            cur.execute(
                """SELECT eca__save(NULL, %s, %s, %s, 0, false, %s, 0, %s, %s, %s, 'en', NULL,
                     %s, %s, NULL, 0, %s, %s, %s, NULL, NULL)""",
                (
                    2 if kind == "customer" else 1, entity_id, f"{nm} ({kind})",
                    money(rng.choice([5000, 10000, 25000, 50000])), terms,
                    f"{kind[:4].upper()}{i + 1:04d}",
                    business[segment] if kind == "customer" else None,
                    CURR, START,
                    acct(st, "ar") if kind == "customer" else acct(st, "ap"),
                    acct(st, "cash"), nm,
                ),
            )
            eca_id = cur.fetchone()[0]
            city, state = rng.choice(CITIES)
            cur.execute(
                "SELECT eca__location_save(%s, NULL, 1, %s, NULL, NULL, %s, %s, %s, %s, NULL)",
                (eca_id, f"{rng.randint(100, 9999)} {rng.choice(WORDS)} Rd", city, state,
                 f"{rng.randint(80000, 99999)}", us),
            )
            cp = Counterparty(
                eca_id, entity_id, nm, segment if kind == "customer" else "Supplier", terms,
                # a minority of customers pay habitually late — gives aging something to show
                rng.choice([0, 0, 0, 2, 5, 12, 25, 45]) if kind == "customer" else rng.choice([-5, 0, 0]),
                weight=rng.paretovariate(1.3),
            )
            (st.customers if kind == "customer" else st.vendors).append(cp)
    st.counts["customers"], st.counts["vendors"] = 60, 25


# ── postings ────────────────────────────────────────────────────────────────


def new_txn(cur: psycopg.Cursor, date: dt.date, code: str, ref: str, desc: str) -> int:
    # transactions.id is an identity column since LedgerSMB 1.12 (changes/1.12/migrate_to_identity.sql);
    # the shared `id` sequence older code used no longer exists.
    cur.execute(
        """INSERT INTO transactions (transdate, approved, trans_type_code, reference, description)
           VALUES (%s, true, %s, %s, %s) RETURNING id""",
        (date, code, ref, desc),
    )
    return cur.fetchone()[0]


def line(cur, tid, chart, amount, date, invoice_id=None, open_item=None, memo=None):
    """One journal line. Negative = debit, positive = credit (LedgerSMB convention)."""
    cur.execute(
        """INSERT INTO acc_trans (trans_id, chart_id, amount_bc, amount_tc, curr, transdate,
             approved, invoice_id, open_item_id, memo)
           VALUES (%s,%s,%s,%s,%s,%s,true,%s,%s,%s)""",
        (tid, chart, amount, amount, CURR, date, invoice_id, open_item, memo),
    )


def open_item(cur, number: str, kind: str, account_id: int) -> int:
    cur.execute(
        "INSERT INTO open_item (item_number, item_type, account_id) VALUES (%s,%s,%s) RETURNING id",
        (number, kind, account_id),
    )
    return cur.fetchone()[0]


def post_purchase(cur, st: State, rng, date: dt.date, vendor: Counterparty, items) -> None:
    st.po_no += 1
    number = f"VI-{st.po_no}"
    tid = new_txn(cur, date, "ap", number, f"Vendor invoice {number}")
    total = money(sum(q * p.cost for p, q in items))
    oi = open_item(cur, number, "ap", acct(st, "ap"))
    cur.execute(
        """INSERT INTO ap (trans_id, invnumber, invoice, duedate, entity_credit_account, curr,
             amount_bc, amount_tc, netamount_bc, netamount_tc, taxincluded, crdate, open_item_id)
           VALUES (%s,%s,true,%s,%s,%s,%s,%s,%s,%s,false,%s,%s)""",
        (tid, number, date + dt.timedelta(days=vendor.terms), vendor.eca_id, CURR,
         total, total, total, total, date, oi),
    )
    for p, q in items:
        cur.execute(
            """INSERT INTO invoice (trans_id, parts_id, description, qty, allocated, sellprice,
                 fxsellprice, precision, discount, unit, deliverydate)
               VALUES (%s,%s,%s,%s,0,%s,%s,2,0,'ea',%s) RETURNING id""",
            (tid, p.id, p.number, -q, p.cost, p.cost, date),  # AP lines: negative qty
        )
        inv_id = cur.fetchone()[0]
        line(cur, tid, acct(st, "inventory"), -money(q * p.cost), date, invoice_id=inv_id)  # Dr inventory
        cur.execute("SELECT cogs__add_for_ap_line(%s, %s)", (inv_id, date))
        p.onhand += q
        cur.execute("UPDATE parts SET onhand = %s, lastcost = %s WHERE id = %s", (p.onhand, p.cost, p.id))
    line(cur, tid, acct(st, "ap"), total, date, open_item=oi)  # Cr AP
    pay_on = date + dt.timedelta(days=vendor.terms + vendor.pay_delay)
    st.open_ap.append(OpenInvoice(tid, oi, vendor, total, date + dt.timedelta(days=vendor.terms), pay_on))
    st.counts["ap_invoices"] += 1


def post_sale(cur, st: State, rng, date: dt.date, customer: Counterparty, items) -> None:
    st.inv_no += 1
    number = f"INV-{st.inv_no}"
    tid = new_txn(cur, date, "ar", number, f"Sales invoice {number}")
    net = money(sum(q * p.price for p, q in items))
    exempt = customer.segment == "Government"
    tax = Decimal(0) if exempt else money(net * TAX_RATE)
    total = net + tax
    oi = open_item(cur, number, "ar", acct(st, "ar"))
    cur.execute(
        """INSERT INTO ar (trans_id, invnumber, invoice, duedate, entity_credit_account, curr,
             amount_bc, amount_tc, netamount_bc, netamount_tc, taxincluded, crdate, open_item_id)
           VALUES (%s,%s,true,%s,%s,%s,%s,%s,%s,%s,false,%s,%s)""",
        (tid, number, date + dt.timedelta(days=customer.terms), customer.eca_id, CURR,
         total, total, net, net, date, oi),
    )
    for p, q in items:
        cur.execute(
            """INSERT INTO invoice (trans_id, parts_id, description, qty, allocated, sellprice,
                 fxsellprice, precision, discount, unit, deliverydate)
               VALUES (%s,%s,%s,%s,0,%s,%s,2,0,%s,%s) RETURNING id""",
            (tid, p.id, p.number, q, p.price, p.price, "hr" if p.is_service else "ea", date),
        )
        inv_id = cur.fetchone()[0]
        income = acct(st, "sales") if p.is_service else acct(st, "sales")
        line(cur, tid, income, money(q * p.price), date, invoice_id=inv_id)  # Cr sales
        if not p.is_service:
            # LedgerSMB's FIFO COGS: allocates against purchases and posts Dr COGS / Cr inventory.
            cur.execute("SELECT cogs__add_for_ar_line(%s)", (inv_id,))
            p.onhand -= q
            cur.execute("UPDATE parts SET onhand = %s WHERE id = %s", (p.onhand, p.id))
    if tax:
        line(cur, tid, acct(st, "sales_tax"), tax, date)  # Cr sales tax payable
    line(cur, tid, acct(st, "ar"), -total, date, open_item=oi)  # Dr AR
    pay_on = date + dt.timedelta(days=customer.terms + customer.pay_delay + rng.randint(-5, 10))
    st.open_ar.append(OpenInvoice(tid, oi, customer, total, date + dt.timedelta(days=customer.terms), pay_on))
    st.counts["ar_invoices"] += 1
    st.counts["invoice_lines"] += len(items)


def pay(cur, st: State, date: dt.date, inv: OpenInvoice, account_class: int) -> None:
    """LedgerSMB's own payment_post: settles the open item, posts cash + AR/AP."""
    cur.execute(
        """SELECT payment_post(%s, %s, %s, %s, 1, %s, %s, ARRAY[%s]::int[], ARRAY[%s]::numeric[],
             ARRAY[%s]::text[], ARRAY[NULL]::text[], ARRAY[%s]::int[], ARRAY[%s]::int[],
             NULL, NULL, NULL, NULL, NULL, NULL, true)""",
        (date, account_class, inv.eca.eca_id, CURR, "synthetic demo payment",
         f"Payment {inv.trans_id}", acct(st, "cash"), inv.amount, f"PMT-{inv.trans_id}",
         inv.trans_id, inv.open_item_id),
    )
    st.counts["payments_ar" if account_class == 2 else "payments_ap"] += 1


def post_gl(cur, st: State, date: dt.date, ref: str, desc: str, lines: list[tuple[str, Decimal]]) -> None:
    assert sum(a for _, a in lines) == 0, f"unbalanced journal {ref}"
    tid = new_txn(cur, date, "gl", ref, desc)
    cur.execute("INSERT INTO gl (id) VALUES (%s)", (tid,))
    for key, amount in lines:
        line(cur, tid, acct(st, key), amount, date)
    st.counts["gl_journals"] += 1


def stock_count(cur, st: State, rng, date: dt.date) -> None:
    """Quarterly physical count: a small shrinkage variance on some parts, adjusted to expense."""
    tid = new_txn(cur, date, "ia", f"COUNT-{date:%Y%m}", "Quarterly inventory count adjustment")
    cur.execute("INSERT INTO gl (id) VALUES (%s)", (tid,))
    cur.execute(
        "INSERT INTO inventory_report (report_date, source, trans_id) VALUES (%s,%s,%s) RETURNING id",
        (date, f"Quarterly count {date:%Y-%m}", tid),
    )
    rid = cur.fetchone()[0]
    shrink_value = Decimal(0)
    for p in st.parts:
        if p.is_service or p.onhand <= 0:
            continue
        variance = -min(p.onhand, Decimal(rng.choice([0] * 12 + [1, 1, 2, 3])))
        counted = p.onhand + variance
        cur.execute(
            """INSERT INTO inventory_report_line (adjust_id, parts_id, counted, expected, variance)
               VALUES (%s,%s,%s,%s,%s)""",
            (rid, p.id, counted, p.onhand, variance),
        )
        if variance:
            shrink_value += money(-variance * p.cost)
            p.onhand = counted
            cur.execute("UPDATE parts SET onhand = %s WHERE id = %s", (p.onhand, p.id))
    if shrink_value:
        line(cur, tid, acct(st, "cogs"), -shrink_value, date, memo="inventory shrinkage")  # Dr COGS
        line(cur, tid, acct(st, "inventory"), shrink_value, date, memo="inventory shrinkage")  # Cr inventory
    st.counts["stock_counts"] += 1


def sales_order(cur, st: State, rng, date: dt.date, customer: Counterparty, items, closed: bool):
    st.so_no += 1
    net = money(sum(q * p.price for p, q in items))
    cur.execute(
        """INSERT INTO oe (ordnumber, transdate, entity_credit_account, amount_tc, netamount_tc,
             reqdate, curr, closed, quotation, oe_class_id, taxincluded)
           VALUES (%s,%s,%s,%s,%s,%s,%s,%s,false,1,false) RETURNING id""",
        (f"SO-{st.so_no}", date, customer.eca_id, net, net, date + dt.timedelta(days=14), CURR, closed),
    )
    oid = cur.fetchone()[0]
    for p, q in items:
        cur.execute(
            """INSERT INTO orderitems (trans_id, parts_id, description, qty, sellprice, precision,
                 discount, unit, reqdate, ship) VALUES (%s,%s,%s,%s,%s,2,0,%s,%s,%s)""",
            (oid, p.id, p.number, q, p.price, "hr" if p.is_service else "ea",
             date + dt.timedelta(days=14), q if closed else 0),
        )
    st.counts["sales_orders"] += 1


# ── the simulation ──────────────────────────────────────────────────────────


def daily_demand(day: dt.date) -> float:
    """Seasonality × growth: a Q1 slump, an autumn peak, ~18%/yr growth, quiet weekends."""
    if day.weekday() >= 5:
        return 0.15
    season = {1: 0.8, 2: 0.85, 3: 0.95, 4: 1.0, 5: 1.05, 6: 1.0, 7: 0.9, 8: 0.95,
              9: 1.15, 10: 1.25, 11: 1.2, 12: 0.85}[day.month]
    growth = 1 + 0.18 * ((day - START).days / 365)
    return 7.5 * season * growth


def pick(rng, items, weights, k=1):
    return rng.choices(items, weights=weights, k=k)


def simulate(conn: psycopg.Connection, st: State, rng: random.Random) -> None:
    goods = [p for p in st.parts if not p.is_service]
    services = [p for p in st.parts if p.is_service]
    cust_w = [c.weight for c in st.customers]
    goods_w = [p.popularity for p in goods]

    with conn.cursor() as cur:
        # Opening balances on day 0: owner's capital funds the bank account.
        post_gl(cur, st, START, "OPEN-2025", "Opening balances: share capital",
                [("cash", money(-450000)), ("capital", money(450000))])
        post_gl(cur, st, START, "EQUIP-2025", "Warehouse racking and forklifts",
                [("equipment", money(-120000)), ("cash", money(120000))])
        # Opening stock: two to three weeks of demand per stocked part.
        for vendor_chunk in range(0, len(goods), 8):
            chunk = goods[vendor_chunk:vendor_chunk + 8]
            post_purchase(cur, st, rng, START, st.vendors[vendor_chunk // 8 % len(st.vendors)],
                          [(p, Decimal(max(p.rop * 2, 40))) for p in chunk])
    conn.commit()

    day = START
    while day <= END:
        with conn.cursor() as cur:
            # 1) replenish anything below its reorder point (purchases precede sales: FIFO)
            low = [p for p in goods if p.onhand < p.rop]
            for i in range(0, len(low), 6):
                vendor = rng.choice(st.vendors)
                post_purchase(cur, st, rng, day, vendor,
                              [(p, Decimal(p.rop * rng.randint(2, 4))) for p in low[i:i + 6]])

            # 2) sales
            for _ in range(_poisson(rng, daily_demand(day))):
                customer = pick(rng, st.customers, cust_w)[0]
                n_lines = rng.randint(1, 5)
                chosen = {p.id: p for p in pick(rng, goods, goods_w, n_lines)}
                items = []
                for p in chosen.values():
                    q = Decimal(rng.randint(1, 25 if p.cost < 20 else 6))
                    if p.onhand >= q:
                        items.append((p, q))
                if rng.random() < 0.12:
                    items.append((rng.choice(services), Decimal(rng.randint(1, 8))))
                if items:
                    post_sale(cur, st, rng, day, customer, items)
                    if rng.random() < 0.6:
                        sales_order(cur, st, rng, day - dt.timedelta(days=rng.randint(1, 10)),
                                    customer, items, closed=True)

            # 3) open (unshipped) orders — the backlog
            if day.weekday() < 5 and rng.random() < 0.35:
                customer = pick(rng, st.customers, cust_w)[0]
                items = [(p, Decimal(rng.randint(1, 10))) for p in pick(rng, goods, goods_w, 2)]
                sales_order(cur, st, rng, day, customer, items, closed=day < END - dt.timedelta(days=21))

            # 4) collections and vendor payments due today
            for inv in [i for i in st.open_ar if i.pay_on <= day]:
                pay(cur, st, day, inv, 2)
                st.open_ar.remove(inv)
            for inv in [i for i in st.open_ap if i.pay_on <= day]:
                pay(cur, st, day, inv, 1)
                st.open_ap.remove(inv)

            # 5) month-end journals
            month_end = (day + dt.timedelta(days=1)).month != day.month
            if month_end:
                growth = Decimal(str(round(1 + 0.12 * ((day - START).days / 365), 4)))
                wages = money(38000 * growth)
                ptax = money(wages * Decimal("0.0765"))
                post_gl(cur, st, day, f"PAY-{day:%Y%m}", "Monthly payroll",
                        [("wages", -wages), ("payroll_tax", -ptax), ("cash", wages + ptax)])
                post_gl(cur, st, day, f"RENT-{day:%Y%m}", "Warehouse rent",
                        [("rent", money(-9500)), ("cash", money(9500))])
                post_gl(cur, st, day, f"INS-{day:%Y%m}", "Insurance",
                        [("insurance", money(-1150)), ("cash", money(1150))])
                post_gl(cur, st, day, f"TEL-{day:%Y%m}", "Telephone & internet",
                        [("telephone", money(-640)), ("cash", money(640))])
                util = money(rng.uniform(1400, 2600))
                post_gl(cur, st, day, f"UTIL-{day:%Y%m}", "Utilities",
                        [("utilities", -util), ("cash", util)])
                post_gl(cur, st, day, f"DEP-{day:%Y%m}", "Depreciation, equipment",
                        [("depreciation", money(-2000)), ("accum_dep", money(2000))])
                if day.month in (3, 6, 9, 12):
                    stock_count(cur, st, rng, day)
        conn.commit()
        day += dt.timedelta(days=1)


def _poisson(rng: random.Random, lam: float) -> int:
    """Knuth's Poisson sampler (random.Random has none)."""
    import math

    limit, k, prod = math.exp(-lam), 0, rng.random()
    while prod > limit:
        k += 1
        prod *= rng.random()
    return k


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--seed", type=int, default=20250101)
    args = ap.parse_args()
    rng = random.Random(args.seed)
    st = State()
    with psycopg.connect(DSN) as conn:
        with conn.cursor() as cur:
            cur.execute("INSERT INTO currency (curr, description) VALUES ('USD', 'US Dollar')")
            cur.execute("SELECT setting__set('curr', 'USD')")
            cur.execute("SELECT setting__set('demo_data', 'SYNTHETIC — ledgersmb-analytics-demo generator, seed %s')" % args.seed)
            us = us_country_id(cur)
            load_chart(cur, st)
            missing = sorted(k for k, no in ACC.items() if no not in st.acct)
            if missing:
                raise SystemExit(f"accounts not in the loaded chart: {missing}")
            for key, which in (("inventory_accno_id", "inventory"), ("income_accno_id", "sales"),
                               ("expense_accno_id", "cogs"), ("fxgain_accno_id", "fx_gain"),
                               ("fxloss_accno_id", "fx_loss")):
                cur.execute("SELECT setting__set(%s, %s)", (key, str(acct(st, which))))
            cur.execute(
                "INSERT INTO tax (chart_id, rate, taxnumber) VALUES (%s, %s, 'US-STATE-SALES')",
                (acct(st, "sales_tax"), TAX_RATE),
            )
            make_parts(cur, st, rng)
            make_counterparties(cur, st, rng, us)
        conn.commit()
        simulate(conn, st, rng)
    print({k: v for k, v in sorted(st.counts.items())},
          "open AR:", len(st.open_ar), "open AP:", len(st.open_ap))


if __name__ == "__main__":
    main()
