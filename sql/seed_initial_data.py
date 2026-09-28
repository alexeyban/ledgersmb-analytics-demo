"""Emit LedgerSMB's seed data as SQL, the way its installer loads it.

``LedgerSMB::Database::load_base_schema`` runs ``Pg-database.sql`` and then, before any schema
change, loads ``locale/initial-data.xml``: contact classes, countries, languages and salutations.
This prints the same INSERTs (``_load_contact_classes`` / ``_load_countries`` /
``_load_languages`` / ``_load_salutations`` in ``lib/LedgerSMB/Database.pm``) for psql.

Usage: python3 sql/seed_initial_data.py <LedgerSMB checkout> | psql ...
"""

import sys
import xml.etree.ElementTree as ET
from pathlib import Path

NS = "{http://ledgersmb.org/xml-schemas/initial-data}"


def q(s: str) -> str:
    return "'" + s.replace("'", "''") + "'"


root = ET.parse(Path(sys.argv[1]) / "locale" / "initial-data.xml").getroot()
print("BEGIN;")
for c in root.iter(f"{NS}class"):
    print(f"INSERT INTO contact_class (class) VALUES ({q(c.get('name'))}) ON CONFLICT DO NOTHING;")
for c in root.iter(f"{NS}country"):
    print(f"INSERT INTO country (short_name, name) VALUES ({q(c.get('code'))}, {q(c.get('description'))});")
for lang in root.iter(f"{NS}language"):
    print(f"INSERT INTO language (code, description) VALUES ({q(lang.get('code'))}, {q(lang.get('description'))});")
for s in root.iter(f"{NS}salutation"):
    print(f"INSERT INTO salutation (salutation) VALUES ({q(s.get('text'))}) ON CONFLICT DO NOTHING;")
print("COMMIT;")
