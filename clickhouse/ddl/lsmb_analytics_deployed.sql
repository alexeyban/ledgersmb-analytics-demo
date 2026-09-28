-- ClickHouse DDL deployed in database lsmb_analytics, dumped 2026-09-28T17:02:58Z by clickhouse/dump_ddl.sh

CREATE TABLE lsmb_analytics.dim_account
(
    `account_id` Int32,
    `account_number` String,
    `account_name` String,
    `account_category` String,
    `account_category_name` String,
    `is_contra` Bool,
    `heading_id` Int32,
    `heading_number` String,
    `heading_name` String,
    `link_roles` Array(String),
    `is_debit_normal` UInt8,
    `is_obsolete` Bool
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.dim_counterparty
(
    `counterparty_id` Int32,
    `account_code` String,
    `counterparty_name` String,
    `counterparty_type` String,
    `segment` Nullable(String),
    `payment_terms_days` Int16,
    `credit_limit` Decimal(18, 2),
    `currency` String,
    `start_date` Date32,
    `city` LowCardinality(Nullable(String)),
    `state` LowCardinality(Nullable(String))
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.dim_date
(
    `date_day` Date,
    `month_start` Date,
    `month_end` Date,
    `year` UInt16,
    `quarter` UInt8,
    `month` UInt8,
    `year_month` String,
    `is_weekend` UInt8
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.dim_part
(
    `part_id` Int32,
    `part_number` String,
    `part_name` String,
    `part_group` Nullable(String),
    `unit` LowCardinality(String),
    `list_price` Decimal(18, 2),
    `sell_price` Decimal(18, 2),
    `last_cost` Decimal(18, 2),
    `on_hand_quantity` Decimal(18, 4),
    `reorder_point` Decimal(18, 4),
    `is_stocked` UInt8,
    `inventory_account_id` Nullable(Int32),
    `income_account_id` Int32,
    `expense_account_id` Int32,
    `is_obsolete` Bool
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.fct_journal_lines
(
    `journal_line_id` Int32,
    `transaction_id` Int32,
    `posting_date` Date32,
    `posting_month` Date,
    `account_id` Int32,
    `account_number` String,
    `account_name` String,
    `account_category` String,
    `account_category_name` String,
    `heading_number` String,
    `heading_name` String,
    `is_contra` Bool,
    `transaction_type_code` String,
    `transaction_type` Nullable(String),
    `transaction_reference` String,
    `debit_amount` Decimal(18, 2),
    `credit_amount` Decimal(18, 2),
    `amount_signed` Decimal(18, 2),
    `natural_amount` Decimal(18, 2),
    `invoice_line_id` Nullable(Int32),
    `open_item_id` Nullable(Int32),
    `is_approved` Bool
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.fct_purchase_lines
(
    `invoice_line_id` Int32,
    `transaction_id` Int32,
    `invoice_number` String,
    `invoice_date` Date32,
    `invoice_month` Date,
    `vendor_id` Int32,
    `vendor_name` Nullable(String),
    `part_id` Int32,
    `part_number` Nullable(String),
    `part_group` Nullable(String),
    `received_quantity` Decimal(18, 4),
    `unit_cost` Decimal(18, 4),
    `purchase_amount` Decimal(18, 2)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.fct_sales_lines
(
    `invoice_line_id` Int32,
    `transaction_id` Int32,
    `invoice_number` String,
    `invoice_date` Date32,
    `invoice_month` Date,
    `customer_id` Int32,
    `customer_name` Nullable(String),
    `customer_segment` Nullable(String),
    `part_id` Int32,
    `part_number` Nullable(String),
    `part_group` Nullable(String),
    `is_stocked` Nullable(UInt8),
    `quantity` Decimal(18, 4),
    `unit_price` Decimal(18, 4),
    `revenue` Decimal(18, 2),
    `cogs` Decimal(18, 2),
    `gross_margin` Decimal(18, 2),
    `has_cogs` UInt8
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.int_journal_lines_enriched
(
    `journal_line_id` Int32,
    `transaction_id` Int32,
    `posting_date` Date32,
    `posting_month` Date,
    `account_id` Int32,
    `account_number` String,
    `account_name` String,
    `account_category` String,
    `account_category_name` String,
    `heading_number` String,
    `heading_name` String,
    `is_contra` Bool,
    `transaction_type_code` String,
    `transaction_type` Nullable(String),
    `transaction_reference` String,
    `debit_amount` Decimal(18, 2),
    `credit_amount` Decimal(18, 2),
    `amount_signed` Decimal(18, 2),
    `natural_amount` Decimal(18, 2),
    `invoice_line_id` Nullable(Int32),
    `open_item_id` Nullable(Int32),
    `is_approved` Bool
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.int_open_item_balances
(
    `open_item_id` Int32,
    `ledger` String,
    `transaction_id` Int32,
    `invoice_number` String,
    `invoice_date` Date32,
    `due_date` Date32,
    `counterparty_id` Int32,
    `gross_amount` Decimal(18, 2),
    `open_balance` Decimal(18, 2),
    `as_of_date` Date,
    `days_past_due` Int64
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.int_purchase_lines
(
    `invoice_line_id` Int32,
    `transaction_id` Int32,
    `invoice_number` String,
    `invoice_date` Date32,
    `invoice_month` Date,
    `vendor_id` Int32,
    `part_id` Int32,
    `received_quantity` Decimal(18, 4),
    `unit_cost` Decimal(18, 4),
    `purchase_amount` Decimal(18, 2)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.int_sales_lines
(
    `invoice_line_id` Int32,
    `transaction_id` Int32,
    `invoice_number` String,
    `invoice_date` Date32,
    `invoice_month` Date,
    `customer_id` Int32,
    `part_id` Int32,
    `quantity` Decimal(18, 4),
    `unit_price` Decimal(18, 4),
    `revenue` Decimal(18, 2),
    `cogs` Decimal(18, 2),
    `gross_margin` Decimal(18, 2),
    `has_cogs` UInt8
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.mart_abc_analysis
(
    `part_id` Int32,
    `part_number` Nullable(String),
    `part_group` Nullable(String),
    `revenue_12m` Decimal(18, 2),
    `gross_margin_12m` Decimal(18, 2),
    `cumulative_revenue_pct` Decimal(38, 2),
    `abc_class` String
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.mart_ap_aging
(
    `as_of_date` Date,
    `vendor_id` Int32,
    `vendor_name` Nullable(String),
    `open_invoices` UInt64,
    `total_open` Decimal(18, 2),
    `not_yet_due` Decimal(18, 2),
    `past_due_1_30` Decimal(18, 2),
    `past_due_over_30` Decimal(18, 2)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.mart_ar_aging
(
    `as_of_date` Date,
    `customer_id` Int32,
    `customer_name` Nullable(String),
    `segment` Nullable(String),
    `open_invoices` UInt64,
    `total_open` Decimal(18, 2),
    `not_yet_due` Decimal(18, 2),
    `past_due_1_30` Decimal(18, 2),
    `past_due_31_60` Decimal(18, 2),
    `past_due_61_90` Decimal(18, 2),
    `past_due_over_90` Decimal(18, 2),
    `oldest_days_past_due` Int64
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.mart_balance_sheet_monthly
(
    `month_end` Date,
    `total_assets` Decimal(18, 2),
    `total_liabilities` Decimal(18, 2),
    `contributed_equity` Decimal(18, 2),
    `retained_earnings_to_date` Decimal(18, 2),
    `total_liabilities_and_equity` Decimal(18, 2)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.mart_cash_flow_monthly
(
    `month_start` Date,
    `receipts_from_customers` Decimal(18, 2),
    `payments_to_suppliers` Decimal(18, 2),
    `payroll_paid` Decimal(18, 2),
    `capital_expenditure` Decimal(18, 2),
    `financing` Decimal(18, 2),
    `other_operating` Decimal(18, 2),
    `net_cash_flow` Decimal(18, 2)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.mart_customer_profitability
(
    `customer_id` Int32,
    `customer_name` Nullable(String),
    `segment` Nullable(String),
    `invoices` UInt64,
    `revenue` Decimal(18, 2),
    `gross_margin` Decimal(18, 2),
    `gross_margin_pct` Decimal(38, 2),
    `avg_days_to_pay` Nullable(Float64),
    `open_receivables` Decimal(18, 2),
    `first_invoice` Date32,
    `last_invoice` Date32,
    `revenue_rank` UInt64
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.mart_income_statement_monthly
(
    `month_start` Date,
    `revenue` Decimal(18, 2),
    `cost_of_goods_sold` Decimal(18, 2),
    `gross_profit` Decimal(18, 2),
    `gross_margin_pct` Decimal(38, 2),
    `payroll_expense` Decimal(18, 2),
    `general_admin_expense` Decimal(18, 2),
    `other_expense` Decimal(18, 2),
    `net_income` Decimal(18, 2),
    `net_margin_pct` Decimal(38, 2)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.mart_inventory_movements_monthly
(
    `month_start` Date,
    `part_id` Int32,
    `part_number` String,
    `part_group` Nullable(String),
    `received_quantity` Decimal(18, 4),
    `sold_quantity` Decimal(18, 4),
    `adjusted_quantity` Decimal(18, 4),
    `closing_on_hand` Decimal(18, 4)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.mart_inventory_position
(
    `part_id` Int32,
    `part_number` String,
    `part_name` String,
    `part_group` Nullable(String),
    `on_hand_quantity` Decimal(18, 4),
    `last_cost` Decimal(18, 2),
    `inventory_value` Decimal(18, 2),
    `avg_daily_usage` Decimal(38, 4),
    `days_of_supply` Nullable(Decimal(38, 4)),
    `reorder_point` Decimal(18, 4),
    `below_reorder_point` UInt8
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.mart_order_backlog
(
    `order_id` Int32,
    `order_number` String,
    `order_date` Date32,
    `required_date` Date32,
    `customer_id` Int32,
    `customer_name` Nullable(String),
    `net_amount` Decimal(18, 2),
    `order_lines` UInt64,
    `age_days` Int64,
    `is_late` UInt8
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.mart_sales_by_part_group_monthly
(
    `month_start` Date,
    `part_group` Nullable(String),
    `invoice_lines` UInt64,
    `invoices` UInt64,
    `quantity_sold` Decimal(18, 4),
    `revenue` Decimal(18, 2),
    `cogs` Decimal(18, 2),
    `gross_margin` Decimal(18, 2),
    `gross_margin_pct` Decimal(38, 2)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.mart_stock_count_variance
(
    `count_date` Date32,
    `part_group` Nullable(String),
    `parts_counted` UInt64,
    `parts_with_variance` UInt64,
    `expected_quantity` Decimal(18, 4),
    `counted_quantity` Decimal(18, 4),
    `variance_quantity` Decimal(18, 4),
    `variance_value` Decimal(18, 2)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.mart_supplier_spend_monthly
(
    `month_start` Date,
    `vendor_id` Int32,
    `vendor_name` Nullable(String),
    `purchase_invoices` UInt64,
    `spend` Decimal(18, 2),
    `distinct_parts` UInt64
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.mart_trial_balance_monthly
(
    `month_start` Date,
    `month_end` Date,
    `account_id` Int32,
    `account_number` String,
    `account_name` String,
    `account_category` String,
    `account_category_name` String,
    `heading_name` String,
    `opening_balance` Decimal(18, 2),
    `period_debits` Decimal(18, 2),
    `period_credits` Decimal(18, 2),
    `closing_balance` Decimal(18, 2)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE TABLE lsmb_analytics.mart_working_capital_monthly
(
    `month_start` Date,
    `accounts_receivable` Decimal(18, 2),
    `accounts_payable` Decimal(18, 2),
    `inventory` Decimal(18, 2),
    `dso_days` Nullable(Decimal(38, 2)),
    `dpo_days` Nullable(Decimal(38, 2)),
    `dio_days` Nullable(Decimal(38, 2))
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replicated_deduplication_window = '0', index_granularity = 8192
;

CREATE VIEW lsmb_analytics.stg_lsmb__accounts
(
    `account_id` Int32,
    `account_number` String,
    `account_name` String,
    `account_category` String,
    `account_category_name` String,
    `is_contra` Bool,
    `heading_id` Int32,
    `heading_number` String,
    `heading_name` String,
    `link_roles` Array(String),
    `is_debit_normal` UInt8,
    `is_obsolete` Bool
)
AS WITH links AS
    (
        SELECT
            account_id,
            arraySort(groupArray(description)) AS link_roles
        FROM lsmb_raw.account_link
        GROUP BY account_id
    )
SELECT
    a.id AS account_id,
    a.accno AS account_number,
    a.description AS account_name,
    a.category AS account_category,
    multiIf(a.category = 'A', 'Asset', a.category = 'L', 'Liability', a.category = 'Q', 'Equity', a.category = 'I', 'Income', 'Expense') AS account_category_name,
    a.contra AS is_contra,
    a.heading AS heading_id,
    h.accno AS heading_number,
    h.description AS heading_name,
    coalesce(l.link_roles, []) AS link_roles,
    a.category IN ('A', 'E') AS is_debit_normal,
    a.obsolete AS is_obsolete
FROM lsmb_raw.account AS a
INNER JOIN lsmb_raw.account_heading AS h ON h.id = a.heading
LEFT JOIN links AS l ON l.account_id = a.id
;

CREATE VIEW lsmb_analytics.stg_lsmb__ap_invoices
(
    `transaction_id` Int32,
    `invoice_number` String,
    `invoice_date` Date32,
    `due_date` Date32,
    `counterparty_id` Int32,
    `open_item_id` Int32,
    `is_item_invoice` Bool,
    `currency` String,
    `net_amount` Decimal(18, 2),
    `gross_amount` Decimal(18, 2),
    `is_return` Bool
)
AS SELECT
    ap.trans_id AS transaction_id,
    ap.invnumber AS invoice_number,
    t.transdate AS invoice_date,
    ap.duedate AS due_date,
    ap.entity_credit_account AS counterparty_id,
    ap.open_item_id AS open_item_id,
    ap.invoice AS is_item_invoice,
    ap.curr AS currency,
    toDecimal64(ap.netamount_bc, 2) AS net_amount,
    toDecimal64(ap.amount_bc, 2) AS gross_amount,
    ap.is_return AS is_return
FROM lsmb_raw.ap AS ap
INNER JOIN lsmb_raw.transactions AS t ON t.id = ap.trans_id
;

CREATE VIEW lsmb_analytics.stg_lsmb__ar_invoices
(
    `transaction_id` Int32,
    `invoice_number` String,
    `invoice_date` Date32,
    `due_date` Date32,
    `counterparty_id` Int32,
    `open_item_id` Int32,
    `is_item_invoice` Bool,
    `currency` String,
    `net_amount` Decimal(18, 2),
    `gross_amount` Decimal(18, 2),
    `tax_amount` Decimal(18, 2),
    `is_return` Bool
)
AS SELECT
    ar.trans_id AS transaction_id,
    ar.invnumber AS invoice_number,
    t.transdate AS invoice_date,
    ar.duedate AS due_date,
    ar.entity_credit_account AS counterparty_id,
    ar.open_item_id AS open_item_id,
    ar.invoice AS is_item_invoice,
    ar.curr AS currency,
    toDecimal64(ar.netamount_bc, 2) AS net_amount,
    toDecimal64(ar.amount_bc, 2) AS gross_amount,
    toDecimal64(ar.amount_bc - ar.netamount_bc, 2) AS tax_amount,
    ar.is_return AS is_return
FROM lsmb_raw.ar AS ar
INNER JOIN lsmb_raw.transactions AS t ON t.id = ar.trans_id
;

CREATE VIEW lsmb_analytics.stg_lsmb__counterparties
(
    `counterparty_id` Int32,
    `account_code` String,
    `counterparty_name` String,
    `counterparty_type` String,
    `segment` Nullable(String),
    `payment_terms_days` Int16,
    `credit_limit` Decimal(18, 2),
    `currency` String,
    `start_date` Date32,
    `city` LowCardinality(Nullable(String)),
    `state` LowCardinality(Nullable(String))
)
AS SELECT
    eca.id AS counterparty_id,
    eca.meta_number AS account_code,
    c.legal_name AS counterparty_name,
    if(eca.entity_class = 1, 'vendor', 'customer') AS counterparty_type,
    b.description AS segment,
    eca.terms AS payment_terms_days,
    toDecimal64(coalesce(eca.creditlimit, 0), 2) AS credit_limit,
    eca.curr AS currency,
    eca.startdate AS start_date,
    loc.city AS city,
    loc.state AS state
FROM lsmb_raw.entity_credit_account AS eca
INNER JOIN lsmb_raw.company AS c ON c.entity_id = eca.entity_id
LEFT JOIN lsmb_raw.business AS b ON b.id = eca.business_id
LEFT JOIN lsmb_raw.eca_to_location AS el ON (el.credit_id = eca.id) AND (el.location_class = 1)
LEFT JOIN lsmb_raw.location AS loc ON loc.id = el.location_id
;

CREATE VIEW lsmb_analytics.stg_lsmb__inventory_counts
(
    `count_id` Int32,
    `count_date` Date32,
    `adjustment_transaction_id` Int32,
    `part_id` Int32,
    `expected_quantity` Decimal(18, 4),
    `counted_quantity` Decimal(18, 4),
    `variance_quantity` Decimal(18, 4)
)
AS SELECT
    r.id AS count_id,
    r.report_date AS count_date,
    r.trans_id AS adjustment_transaction_id,
    l.parts_id AS part_id,
    toDecimal64(l.expected, 4) AS expected_quantity,
    toDecimal64(l.counted, 4) AS counted_quantity,
    toDecimal64(l.variance, 4) AS variance_quantity
FROM lsmb_raw.inventory_report AS r
INNER JOIN lsmb_raw.inventory_report_line AS l ON l.adjust_id = r.id
;

CREATE VIEW lsmb_analytics.stg_lsmb__invoice_lines
(
    `invoice_line_id` Int32,
    `transaction_id` Int32,
    `part_id` Int32,
    `description` LowCardinality(String),
    `quantity_signed` Decimal(18, 4),
    `quantity` Decimal(18, 4),
    `unit_price` Decimal(18, 4),
    `line_amount` Decimal(18, 2),
    `discount` Decimal(18, 4),
    `allocated_quantity` Decimal(18, 4),
    `unit` LowCardinality(String),
    `delivery_date` Date32
)
AS SELECT
    id AS invoice_line_id,
    trans_id AS transaction_id,
    parts_id AS part_id,
    description,
    toDecimal64(qty, 4) AS quantity_signed,
    toDecimal64(abs(qty), 4) AS quantity,
    toDecimal64(sellprice, 4) AS unit_price,
    toDecimal64(abs(qty) * sellprice, 2) AS line_amount,
    toDecimal64(coalesce(discount, 0), 4) AS discount,
    toDecimal64(allocated, 4) AS allocated_quantity,
    unit,
    deliverydate AS delivery_date
FROM lsmb_raw.invoice
;

CREATE VIEW lsmb_analytics.stg_lsmb__journal_lines
(
    `journal_line_id` Int32,
    `transaction_id` Int32,
    `account_id` Int32,
    `posting_date` Date32,
    `amount_signed` Decimal(18, 2),
    `debit_amount` Decimal(18, 2),
    `credit_amount` Decimal(18, 2),
    `currency` String,
    `invoice_line_id` Nullable(Int32),
    `open_item_id` Nullable(Int32),
    `is_approved` Bool,
    `source_reference` LowCardinality(Nullable(String)),
    `memo` LowCardinality(Nullable(String))
)
AS SELECT
    entry_id AS journal_line_id,
    trans_id AS transaction_id,
    chart_id AS account_id,
    transdate AS posting_date,
    toDecimal64(amount_bc, 2) AS amount_signed,
    toDecimal64(if(amount_bc < 0, -amount_bc, 0), 2) AS debit_amount,
    toDecimal64(if(amount_bc > 0, amount_bc, 0), 2) AS credit_amount,
    curr AS currency,
    invoice_id AS invoice_line_id,
    open_item_id,
    approved AS is_approved,
    source AS source_reference,
    memo
FROM lsmb_raw.acc_trans
;

CREATE VIEW lsmb_analytics.stg_lsmb__order_lines
(
    `order_line_id` Int32,
    `order_id` Int32,
    `part_id` Int32,
    `ordered_quantity` Decimal(18, 4),
    `shipped_quantity` Decimal(18, 4),
    `unit_price` Decimal(18, 4),
    `line_amount` Decimal(18, 2),
    `required_date` Date32
)
AS SELECT
    id AS order_line_id,
    trans_id AS order_id,
    parts_id AS part_id,
    toDecimal64(qty, 4) AS ordered_quantity,
    toDecimal64(coalesce(ship, 0), 4) AS shipped_quantity,
    toDecimal64(sellprice, 4) AS unit_price,
    toDecimal64(qty * sellprice, 2) AS line_amount,
    reqdate AS required_date
FROM lsmb_raw.orderitems
;

CREATE VIEW lsmb_analytics.stg_lsmb__parts
(
    `part_id` Int32,
    `part_number` String,
    `part_name` String,
    `part_group` Nullable(String),
    `unit` LowCardinality(String),
    `list_price` Decimal(18, 2),
    `sell_price` Decimal(18, 2),
    `last_cost` Decimal(18, 2),
    `on_hand_quantity` Decimal(18, 4),
    `reorder_point` Decimal(18, 4),
    `is_stocked` UInt8,
    `inventory_account_id` Nullable(Int32),
    `income_account_id` Int32,
    `expense_account_id` Int32,
    `is_obsolete` Bool
)
AS SELECT
    p.id AS part_id,
    p.partnumber AS part_number,
    p.description AS part_name,
    pg.partsgroup AS part_group,
    p.unit AS unit,
    toDecimal64(p.listprice, 2) AS list_price,
    toDecimal64(p.sellprice, 2) AS sell_price,
    toDecimal64(p.lastcost, 2) AS last_cost,
    toDecimal64(p.onhand, 4) AS on_hand_quantity,
    toDecimal64(coalesce(p.rop, 0), 4) AS reorder_point,
    p.inventory_accno_id IS NOT NULL AS is_stocked,
    p.inventory_accno_id AS inventory_account_id,
    p.income_accno_id AS income_account_id,
    p.expense_accno_id AS expense_account_id,
    p.obsolete AS is_obsolete
FROM lsmb_raw.parts AS p
LEFT JOIN lsmb_raw.partsgroup AS pg ON pg.id = p.partsgroup_id
;

CREATE VIEW lsmb_analytics.stg_lsmb__payments
(
    `payment_id` Int32,
    `transaction_id` Int32,
    `reference` String,
    `payment_date` Date32,
    `payment_direction` String,
    `counterparty_id` Int32,
    `cash_account_id` Int32,
    `currency` String
)
AS SELECT
    id AS payment_id,
    trans_id AS transaction_id,
    reference,
    payment_date,
    if(payment_class = 2, 'receipt', 'disbursement') AS payment_direction,
    entity_credit_id AS counterparty_id,
    account_id AS cash_account_id,
    currency
FROM lsmb_raw.payment
;

CREATE VIEW lsmb_analytics.stg_lsmb__sales_orders
(
    `order_id` Int32,
    `order_number` String,
    `order_date` Date32,
    `required_date` Date32,
    `counterparty_id` Int32,
    `is_closed` Bool,
    `net_amount` Decimal(18, 2),
    `order_class` String
)
AS SELECT
    o.id AS order_id,
    o.ordnumber AS order_number,
    o.transdate AS order_date,
    o.reqdate AS required_date,
    o.entity_credit_account AS counterparty_id,
    o.closed AS is_closed,
    toDecimal64(o.netamount_tc, 2) AS net_amount,
    oc.oe_class AS order_class
FROM lsmb_raw.oe AS o
INNER JOIN lsmb_raw.oe_class AS oc ON oc.id = o.oe_class_id
WHERE o.oe_class_id = 1
;

CREATE VIEW lsmb_analytics.stg_lsmb__transactions
(
    `transaction_id` Int32,
    `transaction_date` Date32,
    `transaction_type_code` String,
    `transaction_type` Nullable(String),
    `reference` String,
    `description` Nullable(String),
    `is_approved` Bool,
    `reverses_transaction_id` Nullable(Int32)
)
AS SELECT
    t.id AS transaction_id,
    t.transdate AS transaction_date,
    t.trans_type_code AS transaction_type_code,
    tt.description AS transaction_type,
    t.reference AS reference,
    t.description AS description,
    t.approved AS is_approved,
    t.reversing AS reverses_transaction_id
FROM lsmb_raw.transactions AS t
LEFT JOIN lsmb_raw.trans_type AS tt ON tt.code = t.trans_type_code
;
