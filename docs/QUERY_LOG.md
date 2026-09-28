# Every EKOS query and answer

> Rendered from `logs/ekos_queries.jsonl` (the complete record, including full structured answers). Structural answers are shortened here to 1,500 characters; `ekos ask` answers are shown in full.

### 1. `ekos_status` — 2-discovery

**Why:** Size and freshness of the compiled LedgerSMB model  
**Arguments:** `{}`  
**Result:** ok, 229 ms

```json
{"entries": 39140, "ledger_path": "/home/legion/PycharmProjects/LedgerSMB/.ekos/ledger/facts", "objects": 11084, "relationships": 9228}
```

### 2. `ekos_ekl` — 2-discovery

**Why:** Inventory of what EKOS recovered from LedgerSMB, by object kind  
**Arguments:** `{"query": "FIND Object COUNT GROUP BY kind"}`  
**Result:** ok, 347 ms

```json
{"count": 14, "rows": [{"count": 167, "kind": "Document"}, {"count": 1522, "kind": "File"}, {"count": 91, "kind": "JsModule"}, {"count": 88, "kind": "JsSymbol"}, {"count": 591, "kind": "PerlPackage"}, {"count": 1988, "kind": "PerlSymbol"}, {"count": 65, "kind": "Person"}, {"count": 4, "kind": "Pipeline"}, {"count": 127, "kind": "Risk"}, {"count": 68, "kind": "Rollup"}, {"count": 700, "kind": "Section"}, {"count": 185, "kind": "Table"}, {"count": 87, "kind": "Technology"}, {"count": 5401, "kind": "TransformNode"}]}
```

### 3. `ekos_ekl` — 2-discovery

**Why:** How many database tables were recovered from sql/  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' COUNT"}`  
**Result:** ok, 324 ms

```json
{"count": 1, "rows": [{"count": 185}]}
```

### 4. `ekos_ekl` — 2-discovery

**Why:** Locate table `acc_trans` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'acc_trans'"}`  
**Result:** ok, 318 ms

```json
{"count": 1, "rows": [{"id": "c74280fe-7b9a-5c74-b97c-afcc35f7f318", "kind": "Table", "name": "acc_trans"}]}
```

### 5. `ekos_ekl` — 2-discovery

**Why:** Locate table `account` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'account'"}`  
**Result:** ok, 316 ms

```json
{"count": 1, "rows": [{"id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa", "kind": "Table", "name": "account"}]}
```

### 6. `ekos_ekl` — 2-discovery

**Why:** Locate table `account_heading` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'account_heading'"}`  
**Result:** ok, 311 ms

```json
{"count": 1, "rows": [{"id": "e7b1a9be-ac14-54f9-8cc3-7e92de186c6f", "kind": "Table", "name": "account_heading"}]}
```

### 7. `ekos_ekl` — 2-discovery

**Why:** Locate table `account_link` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'account_link'"}`  
**Result:** ok, 321 ms

```json
{"count": 1, "rows": [{"id": "f0b041a2-2a84-5909-805f-07a146cf963a", "kind": "Table", "name": "account_link"}]}
```

### 8. `ekos_ekl` — 2-discovery

**Why:** Locate table `transactions` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'transactions'"}`  
**Result:** ok, 318 ms

```json
{"count": 1, "rows": [{"id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38", "kind": "Table", "name": "transactions"}]}
```

### 9. `ekos_ekl` — 2-discovery

**Why:** Locate table `gl` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'gl'"}`  
**Result:** ok, 316 ms

```json
{"count": 1, "rows": [{"id": "411f9c4b-8946-54f1-8783-0b6c3adfcee7", "kind": "Table", "name": "gl"}]}
```

### 10. `ekos_ekl` — 2-discovery

**Why:** Locate table `ar` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'ar'"}`  
**Result:** ok, 336 ms

```json
{"count": 1, "rows": [{"id": "ccdf16c2-236c-55c2-a135-1a00c662c231", "kind": "Table", "name": "ar"}]}
```

### 11. `ekos_ekl` — 2-discovery

**Why:** Locate table `ap` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'ap'"}`  
**Result:** ok, 312 ms

```json
{"count": 1, "rows": [{"id": "a337a7d7-e368-58e4-9c45-cba719c6046b", "kind": "Table", "name": "ap"}]}
```

### 12. `ekos_ekl` — 2-discovery

**Why:** Locate table `invoice` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'invoice'"}`  
**Result:** ok, 319 ms

```json
{"count": 1, "rows": [{"id": "007811f7-d983-545d-9927-998a016f81da", "kind": "Table", "name": "invoice"}]}
```

### 13. `ekos_ekl` — 2-discovery

**Why:** Locate table `parts` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'parts'"}`  
**Result:** ok, 333 ms

```json
{"count": 1, "rows": [{"id": "13575f92-6f74-5533-8a33-04ceabd3b710", "kind": "Table", "name": "parts"}]}
```

### 14. `ekos_ekl` — 2-discovery

**Why:** Locate table `partsgroup` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'partsgroup'"}`  
**Result:** ok, 322 ms

```json
{"count": 1, "rows": [{"id": "1feb9c21-7673-59d0-9266-ba8cf1c065ab", "kind": "Table", "name": "partsgroup"}]}
```

### 15. `ekos_ekl` — 2-discovery

**Why:** Locate table `entity` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'entity'"}`  
**Result:** ok, 314 ms

```json
{"count": 1, "rows": [{"id": "3993d440-1c22-52d8-8367-30854bbe7119", "kind": "Table", "name": "entity"}]}
```

### 16. `ekos_ekl` — 2-discovery

**Why:** Locate table `company` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'company'"}`  
**Result:** ok, 320 ms

```json
{"count": 1, "rows": [{"id": "ebaa9398-3b6a-597f-8b54-b5cecf3acec5", "kind": "Table", "name": "company"}]}
```

### 17. `ekos_ekl` — 2-discovery

**Why:** Locate table `entity_credit_account` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'entity_credit_account'"}`  
**Result:** ok, 331 ms

```json
{"count": 1, "rows": [{"id": "dd5393ba-4a3d-54cb-a816-be338e0cc992", "kind": "Table", "name": "entity_credit_account"}]}
```

### 18. `ekos_ekl` — 2-discovery

**Why:** Locate table `payment` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'payment'"}`  
**Result:** ok, 316 ms

```json
{"count": 1, "rows": [{"id": "c600e4f4-f88b-5d21-94ac-7d918d48dcf3", "kind": "Table", "name": "payment"}]}
```

### 19. `ekos_ekl` — 2-discovery

**Why:** Locate table `open_item` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'open_item'"}`  
**Result:** ok, 319 ms

```json
{"count": 1, "rows": [{"id": "4050340b-d85d-5da8-960c-74d76fc458a6", "kind": "Table", "name": "open_item"}]}
```

### 20. `ekos_ekl` — 2-discovery

**Why:** Locate table `oe` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'oe'"}`  
**Result:** ok, 318 ms

```json
{"count": 1, "rows": [{"id": "d1b46d64-5445-5e88-ae13-d18e0e8fbb23", "kind": "Table", "name": "oe"}]}
```

### 21. `ekos_ekl` — 2-discovery

**Why:** Locate table `orderitems` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'orderitems'"}`  
**Result:** ok, 312 ms

```json
{"count": 1, "rows": [{"id": "cd6546c8-7658-5a84-ab3a-1f557f383cd2", "kind": "Table", "name": "orderitems"}]}
```

### 22. `ekos_ekl` — 2-discovery

**Why:** Locate table `warehouse` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'warehouse'"}`  
**Result:** ok, 311 ms

```json
{"count": 1, "rows": [{"id": "cb63feeb-3d78-5175-8948-db542ce600da", "kind": "Table", "name": "warehouse"}]}
```

### 23. `ekos_ekl` — 2-discovery

**Why:** Locate table `inventory_report` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'inventory_report'"}`  
**Result:** ok, 322 ms

```json
{"count": 1, "rows": [{"id": "6b9e7416-2185-5be6-86c8-783c3aee5207", "kind": "Table", "name": "inventory_report"}]}
```

### 24. `ekos_ekl` — 2-discovery

**Why:** Locate table `inventory_report_line` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'inventory_report_line'"}`  
**Result:** ok, 314 ms

```json
{"count": 1, "rows": [{"id": "0f8e2bad-af2f-5d34-921c-14e60709a98b", "kind": "Table", "name": "inventory_report_line"}]}
```

### 25. `ekos_ekl` — 2-discovery

**Why:** Locate table `tax` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'tax'"}`  
**Result:** ok, 315 ms

```json
{"count": 1, "rows": [{"id": "1ae6e156-42d7-5a40-abda-6c86b441ef29", "kind": "Table", "name": "tax"}]}
```

### 26. `ekos_ekl` — 2-discovery

**Why:** Locate table `business_unit` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'business_unit'"}`  
**Result:** ok, 315 ms

```json
{"count": 1, "rows": [{"id": "136bcdb7-7178-5c08-a328-e4d5bba04107", "kind": "Table", "name": "business_unit"}]}
```

### 27. `ekos_ekl` — 2-discovery

**Why:** Locate table `currency` in the compiled model  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'currency'"}`  
**Result:** ok, 329 ms

```json
{"count": 1, "rows": [{"id": "9bcf0658-bb38-5118-9a5c-68d807745540", "kind": "Table", "name": "currency"}]}
```

### 28. `ekos_state` — 2-discovery

**Why:** Columns, keys and author comments of `acc_trans` — the source contract for staging  
**Arguments:** `{"id": "c74280fe-7b9a-5c74-b97c-afcc35f7f318"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:53.874571127Z", "fragment": "CREATE TABLE acc_trans", "id": "d8bfc9e6-52b0-44ac-9fd6-1ca27ef229dd", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:03.787189683Z", "fragment": "COMMENT ON TABLE acc_trans IS This table stores line items for financial transactions.  Please note that\npayments in 1.3 are not full-fledged transactions.", "id": "1d395fba-3b15-48fd-9442-23911b9e65e6", "location": {"column": null, "line": 1142, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.758000537Z", "fragment": "COMMENT ON COLUMN acc_trans.source IS Document Source identifier for individual line items, usually used\nfor payments.", "id": "6654131a-eeae-4b30-9c34-8b5acbc14412", "location": {"column": null, "line": 1146, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:00.930183454Z", "fragment": "COMMENT ON COLUMN acc_trans.fx_transaction IS When 'f', indicates that the amount column states the amount in the currency\nas specified in the associated ar, ap, payment or gl record.\n\nWhen 't', indicates that the amount column states the difference between\nthe foreighn currency amount and the base amount so that their sum equals the\nbase amount.", "id": "91dc78f4-32c7-461a-abf7-481e008b94a9", "location": {"column": null, "line": 1150, "path": "sql/Pg-database.sql"}}], "object": { …
```

### 29. `ekos_neighborhood` — 2-discovery

**Why:** Direct relationships of `acc_trans` (foreign keys, referencing code) — join paths  
**Arguments:** `{"id": "c74280fe-7b9a-5c74-b97c-afcc35f7f318", "depth": 1, "max_objects": 200}`  
**Result:** ok, 13 ms

```json
{"events": [], "evidence": [], "max_objects": 200, "objects": [{"created_at": "2026-09-28T14:38:47.520679271Z", "evidence": ["d8bfc9e6-52b0-44ac-9fd6-1ca27ef229dd", "1d395fba-3b15-48fd-9442-23911b9e65e6", "6654131a-eeae-4b30-9c34-8b5acbc14412", "91dc78f4-32c7-461a-abf7-481e008b94a9"], "id": "c74280fe-7b9a-5c74-b97c-afcc35f7f318", "kind": "Table", "name": "acc_trans", "properties": {"columns": [{"data_type": "INT", "name": "trans_id"}, {"data_type": "INT", "name": "chart_id"}, {"data_type": "NUMERIC", "name": "amount"}, {"data_type": "DATE", "name": "transdate"}, {"data_type": "TEXT", "description": "Document Source identifier for individual line items, usually used\nfor payments.", "name": "source"}, {"data_type": "BOOL", "name": "cleared"}, {"data_type": "BOOL", "description": "When 'f', indicates that the amount column states the amount in the currency\nas specified in the associated ar, ap, payment or gl record.\n\nWhen 't', indicates that the amount column states the difference between\nthe foreighn currency amount and the base amount so that their sum equals the\nbase amount.", "name": "fx_transaction"}, {"data_type": "TEXT", "name": "memo"}, {"data_type": "INT", "name": "invoice_id"}, {"data_type": "BOOL", "name": "approved"}, {"data_type": "DATE", "name": "cleared_on"}, {"data_type": "DATE", "name": "reconciled_on"}, {"data_type": "INT", "name": "voucher_id"}, {"data_type": "SERIAL", "name": "entry_id"}], "description": "This table stores line items for financial trans …
```

### 30. `ekos_state` — 2-discovery

**Why:** Columns, keys and author comments of `invoice` — the source contract for staging  
**Arguments:** `{"id": "007811f7-d983-545d-9927-998a016f81da"}`  
**Result:** ok, 3 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:10.287927477Z", "fragment": "CREATE TABLE invoice", "id": "55e8d31e-b7a0-43b0-8c4d-68f8f5eab0e5", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:14.875694948Z", "fragment": "COMMENT ON TABLE invoice IS Line items of invoices with goods/services attached.", "id": "e4b7a9cb-c277-439f-ae07-e95d4a483d0d", "location": {"column": null, "line": 1264, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:11.714116803Z", "fragment": "COMMENT ON COLUMN invoice.allocated IS Number of allocated items, negative relative to qty.\nWhen qty + allocated = 0, then the item is fully used for purposes of COGS\ncalculations.", "id": "9fbe2725-5e47-4db2-bc0a-925bf40d9a73", "location": {"column": null, "line": 1267, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:06.013662549Z", "fragment": "COMMENT ON COLUMN invoice.qty IS Positive is normal for sales invoices, negative for vendor invoices.", "id": "71a975b1-def0-4221-9cf4-9ad7af2a36b3", "location": {"column": null, "line": 1272, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.562350256Z", "evidence": ["55e8d31e-b7a0-43b0-8c4d-68f8f5eab0e5", "e4b7a9cb-c277-439f-ae07-e95d4a483d0d", "9fbe2725-5e47-4db2-bc0a-925bf40d9a73", "71a975b1-def0-4221-9cf4-9ad7af2a36b3"], "id": "007811f7-d983-545d-9927-998a016f81da", …
```

### 31. `ekos_neighborhood` — 2-discovery

**Why:** Direct relationships of `invoice` (foreign keys, referencing code) — join paths  
**Arguments:** `{"id": "007811f7-d983-545d-9927-998a016f81da", "depth": 1, "max_objects": 200}`  
**Result:** ok, 4 ms

```json
{"events": [], "evidence": [], "max_objects": 200, "objects": [{"created_at": "2026-09-28T14:38:47.562350256Z", "evidence": ["55e8d31e-b7a0-43b0-8c4d-68f8f5eab0e5", "e4b7a9cb-c277-439f-ae07-e95d4a483d0d", "9fbe2725-5e47-4db2-bc0a-925bf40d9a73", "71a975b1-def0-4221-9cf4-9ad7af2a36b3"], "id": "007811f7-d983-545d-9927-998a016f81da", "kind": "Table", "name": "invoice", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "INT", "name": "trans_id"}, {"data_type": "INT", "name": "parts_id"}, {"data_type": "TEXT", "name": "description"}, {"data_type": "NUMERIC", "description": "Positive is normal for sales invoices, negative for vendor invoices.", "name": "qty"}, {"data_type": "NUMERIC", "description": "Number of allocated items, negative relative to qty.\nWhen qty + allocated = 0, then the item is fully used for purposes of COGS\ncalculations.", "name": "allocated"}, {"data_type": "NUMERIC", "name": "sellprice"}, {"data_type": "INT", "name": "precision"}, {"data_type": "NUMERIC", "name": "fxsellprice"}, {"data_type": "NUMERIC", "name": "discount"}, {"data_type": "BOOL", "name": "assemblyitem"}, {"data_type": "VARCHAR", "name": "unit"}, {"data_type": "DATE", "name": "deliverydate"}, {"data_type": "TEXT", "name": "serialnumber"}, {"data_type": "TEXT", "name": "vendor_sku"}, {"data_type": "TEXT", "name": "notes"}], "description": "Line items of invoices with goods/services attached.", "sql_comment": "Line items of invoices with goods/services attached."}}, { …
```

### 32. `ekos_state` — 2-discovery

**Why:** Columns, keys and author comments of `parts` — the source contract for staging  
**Arguments:** `{"id": "13575f92-6f74-5533-8a33-04ceabd3b710"}`  
**Result:** ok, 8 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:58.210491963Z", "fragment": "CREATE TABLE parts", "id": "a2332429-4a27-4cf6-b3b5-cc148b8e9562", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:59.758154187Z", "fragment": "COMMENT ON TABLE parts IS This stores detail information about goods and services.  The type of part\nis currently defined according to the following rules:\n* If assembly is true, then an assembly\n* If inventory_accno_id, income_accno_id, and expense_accno_id are not null then\n  a part.\n* If inventory_accno_id is null but the other two are not, then a service.\n* Otherwise, a labor/overhead entry.", "id": "b44c7fc0-1beb-49d1-8a11-1ba36e6977e1", "location": {"column": null, "line": 1195, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.797982446Z", "fragment": "COMMENT ON COLUMN parts.rop IS Re-order point.  Used to select parts for short inventory report.", "id": "96ee23a5-a002-4bd3-893a-93ffe0cb8691", "location": {"column": null, "line": 1205, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:15.986640429Z", "fragment": "COMMENT ON COLUMN parts.bin IS Text identifier for where a part is stored.", "id": "7e097481-3f74-4b2f-b2a5-d98ca4795070", "location": {"column": null, "line": 1208, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:16.071517373Z", "f …
```

### 33. `ekos_neighborhood` — 2-discovery

**Why:** Direct relationships of `parts` (foreign keys, referencing code) — join paths  
**Arguments:** `{"id": "13575f92-6f74-5533-8a33-04ceabd3b710", "depth": 1, "max_objects": 200}`  
**Result:** ok, 11 ms

```json
{"events": [], "evidence": [], "max_objects": 200, "objects": [{"created_at": "2026-09-28T14:38:47.529411580Z", "evidence": ["a2332429-4a27-4cf6-b3b5-cc148b8e9562", "b44c7fc0-1beb-49d1-8a11-1ba36e6977e1", "96ee23a5-a002-4bd3-893a-93ffe0cb8691", "7e097481-3f74-4b2f-b2a5-d98ca4795070", "7c738c9d-b191-4dcd-8320-94f561c2a2b7", "e038c0ca-5d5d-4211-9517-82cdaa4602ba"], "id": "13575f92-6f74-5533-8a33-04ceabd3b710", "kind": "Table", "name": "parts", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "partnumber"}, {"data_type": "TEXT", "name": "description"}, {"data_type": "VARCHAR(5)", "name": "unit"}, {"data_type": "NUMERIC", "name": "listprice"}, {"data_type": "NUMERIC", "name": "sellprice"}, {"data_type": "NUMERIC", "name": "lastcost"}, {"data_type": "DATE", "name": "priceupdate"}, {"data_type": "NUMERIC", "name": "weight"}, {"data_type": "NUMERIC", "name": "onhand"}, {"data_type": "TEXT", "name": "notes"}, {"data_type": "BOOL", "name": "makemodel"}, {"data_type": "BOOL", "name": "assembly"}, {"data_type": "BOOL", "name": "alternate"}, {"data_type": "NUMERIC", "description": "Re-order point.  Used to select parts for short inventory report.", "name": "rop"}, {"data_type": "INT", "name": "inventory_accno_id"}, {"data_type": "INT", "name": "income_accno_id"}, {"data_type": "INT", "name": "expense_accno_id"}, {"data_type": "INT", "name": "returns_accno_id"}, {"data_type": "TEXT", "description": "Text identifier for where a part is stored. …
```

### 34. `ekos_state` — 2-discovery

**Why:** Columns, keys and author comments of `ar` — the source contract for staging  
**Arguments:** `{"id": "ccdf16c2-236c-55c2-a135-1a00c662c231"}`  
**Result:** ok, 5 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:00.450396543Z", "fragment": "CREATE TABLE ar", "id": "cae5a52c-3d6e-46c4-b8f1-55faa6ed992e", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.760613987Z", "fragment": "COMMENT ON TABLE ar IS Summary/header information for AR transactions and sales invoices.\nNote that some constraints here are hard to enforce because we haven not gotten\nto rewriting the relevant code here.\nHV TODO drop entity_id", "id": "f765cd21-8bfe-4baf-9898-c2ad7454bdfb", "location": {"column": null, "line": 1355, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:08.578808031Z", "fragment": "COMMENT ON COLUMN ar.invnumber IS Text identifier for the invoice.  Must be unique.", "id": "d9c09ae5-39e6-46a6-b3c4-724f601398f5", "location": {"column": null, "line": 1362, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.193153685Z", "fragment": "COMMENT ON COLUMN ar.invoice IS True if the transaction tracks goods/services purchase using the invoice\ntable.  False otherwise.", "id": "4b825c90-b380-4e2e-a6b6-ad49234d91a6", "location": {"column": null, "line": 1365, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:03.171018272Z", "fragment": "COMMENT ON COLUMN ar.amount IS This stores the total amount (including taxes) for the transaction.", "id": "9fe2bb45-7970 …
```

### 35. `ekos_neighborhood` — 2-discovery

**Why:** Direct relationships of `ar` (foreign keys, referencing code) — join paths  
**Arguments:** `{"id": "ccdf16c2-236c-55c2-a135-1a00c662c231", "depth": 1, "max_objects": 200}`  
**Result:** ok, 3 ms

```json
{"events": [], "evidence": [], "max_objects": 200, "objects": [{"created_at": "2026-09-28T14:38:47.601086283Z", "evidence": ["cae5a52c-3d6e-46c4-b8f1-55faa6ed992e", "f765cd21-8bfe-4baf-9898-c2ad7454bdfb", "d9c09ae5-39e6-46a6-b3c4-724f601398f5", "4b825c90-b380-4e2e-a6b6-ad49234d91a6", "9fe2bb45-7970-418a-aa66-09cb43ae5750", "02c9bbd9-d685-413e-b98e-db6072514701", "514c31af-2c2b-42f5-b865-2ccc2a943f1b", "130aa06c-4c70-4be6-8794-6628d64642c3", "e29a6a04-8c50-49bc-955d-8db389c8117f", "67c4d18a-8899-4315-9cd3-1dd83872ef5f", "90d3426f-d69e-4c69-ba80-4955bdcf67e0", "1fb68a81-fcc0-4ea8-9f0b-b859b9059e73", "2d8a8d99-400a-497b-bafc-9219064b27c4", "28f12723-63ec-48ec-b633-072e49a13069", "f7092528-4213-4586-a26f-1f460b1097f5", "7efcc803-4435-4600-aba2-e15a64c49e0b", "94aedfb1-ac15-46ec-a8fd-a2f0a98afbcd"], "id": "ccdf16c2-236c-55c2-a135-1a00c662c231", "kind": "Table", "name": "ar", "properties": {"columns": [{"data_type": "INT", "name": "id"}, {"data_type": "TEXT", "description": "Text identifier for the invoice.  Must be unique.", "name": "invnumber"}, {"data_type": "DATE", "name": "transdate"}, {"data_type": "INT", "name": "entity_id"}, {"data_type": "BOOL", "name": "taxincluded"}, {"data_type": "NUMERIC", "description": "This stores the total amount (including taxes) for the transaction.", "name": "amount"}, {"data_type": "NUMERIC", "description": "Total amount excluding taxes for the transaction.", "name": "netamount"}, {"data_type": "NUMERIC", "name": "paid"}, {"data_type": "DATE",  …
```

### 36. `ekos_state` — 2-discovery

**Why:** Columns, keys and author comments of `ap` — the source contract for staging  
**Arguments:** `{"id": "a337a7d7-e368-58e4-9c45-cba719c6046b"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:59.394273628Z", "fragment": "CREATE TABLE ap", "id": "e95d7643-1d8c-4fb4-9f61-33fed4e7fe49", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:07.647647051Z", "fragment": "COMMENT ON TABLE ap IS Summary/header information for AP transactions and vendor invoices.\nNote that some constraints here are hard to enforce because we haven not gotten\nto rewriting the relevant code here.\nHV TODO drop entity_id", "id": "67fc1400-30ff-4ec3-9567-09231551d480", "location": {"column": null, "line": 1442, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:53.944796256Z", "fragment": "COMMENT ON COLUMN ap.invnumber IS Text identifier for the invoice.  Must be unique.", "id": "36f36baa-6ace-4993-8ecf-b19d3fe715ef", "location": {"column": null, "line": 1449, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:56.007033168Z", "fragment": "COMMENT ON COLUMN ap.invoice IS True if the transaction tracks goods/services purchase using the invoice\ntable.  False otherwise.", "id": "c0cea321-485b-4dce-866c-f53e9b0f761d", "location": {"column": null, "line": 1452, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:02.182336869Z", "fragment": "COMMENT ON COLUMN ap.amount IS This stores the total amount (including taxes) for the transaction.", "id": "08077b22-22c …
```

### 37. `ekos_neighborhood` — 2-discovery

**Why:** Direct relationships of `ap` (foreign keys, referencing code) — join paths  
**Arguments:** `{"id": "a337a7d7-e368-58e4-9c45-cba719c6046b", "depth": 1, "max_objects": 200}`  
**Result:** ok, 3 ms

```json
{"events": [], "evidence": [], "max_objects": 200, "objects": [{"created_at": "2026-09-28T14:38:47.616012014Z", "evidence": ["e95d7643-1d8c-4fb4-9f61-33fed4e7fe49", "67fc1400-30ff-4ec3-9567-09231551d480", "36f36baa-6ace-4993-8ecf-b19d3fe715ef", "c0cea321-485b-4dce-866c-f53e9b0f761d", "08077b22-22cb-48b2-8c91-5787bdd02899", "c638976c-a0e5-4b0f-9115-d24910fd5617", "0f73ffca-895b-4ec4-822e-a00a85cdbc65", "b585cfac-7d0e-4a61-aa35-5c9826fab4a2", "8be86a3e-b66c-464f-870c-01fa33685402", "0e6c0b8b-9245-496c-901c-9d3d4c7f6714", "2a53e9cf-a6a6-4fcf-8d0e-48de276878af", "88cdb5db-950c-4536-9a7b-826985db1292", "05a190e9-4965-4c73-85ac-87055b7de113", "815c9a54-ec1d-4e69-a2ff-1fb1b698392d", "a5973545-2b6a-41f7-b02b-97013d583dff", "0bfd0f2c-dcca-4ffa-8807-59820608700f", "8461f216-f690-40c1-9d2d-7e621b3e2680"], "id": "a337a7d7-e368-58e4-9c45-cba719c6046b", "kind": "Table", "name": "ap", "properties": {"columns": [{"data_type": "INT", "name": "id"}, {"data_type": "TEXT", "description": "Text identifier for the invoice.  Must be unique.", "name": "invnumber"}, {"data_type": "DATE", "name": "transdate"}, {"data_type": "INT", "name": "entity_id"}, {"data_type": "BOOL", "name": "taxincluded"}, {"data_type": "NUMERIC", "description": "This stores the total amount (including taxes) for the transaction.", "name": "amount"}, {"data_type": "NUMERIC", "description": "Total amount excluding taxes for the transaction.", "name": "netamount"}, {"data_type": "NUMERIC", "name": "paid"}, {"data_type": "DATE",  …
```

### 38. `ekos_state` — 2-discovery

**Why:** Columns, keys and author comments of `transactions` — the source contract for staging  
**Arguments:** `{"id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38"}`  
**Result:** ok, 7 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:12.691082215Z", "fragment": "CREATE TABLE transactions", "id": "971e753e-1515-4cd4-b0cb-9e45ba93bfef", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:12.686200978Z", "fragment": "COMMENT ON TABLE transactions IS This table provides referential integrity between AR, AP, GL tables on one\nhand and acc_trans on the other, pending the refactoring of those tables.  It\nalso is used to provide discretionary locking of financial transactions across\ndatabase connections, for example in batch payment workflows.", "id": "7caa0c59-3c1e-440b-852b-9e02132a0ef3", "location": {"column": null, "line": 308, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.189559073Z", "fragment": "COMMENT ON COLUMN transactions.locked_by IS This should only be used in pessimistic locking measures as required by large\nbatch work flows.", "id": "58d32d2d-3afe-44f1-9201-eea476bc1d20", "location": {"column": null, "line": 338, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.908817167Z", "evidence": ["971e753e-1515-4cd4-b0cb-9e45ba93bfef", "7caa0c59-3c1e-440b-852b-9e02132a0ef3", "58d32d2d-3afe-44f1-9201-eea476bc1d20"], "id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38", "kind": "Table", "name": "transactions", "properties": {"columns": [{"data_type": "INT", "name": "id"}, {"data_type": "TEXT", "name": "t …
```

### 39. `ekos_neighborhood` — 2-discovery

**Why:** Direct relationships of `transactions` (foreign keys, referencing code) — join paths  
**Arguments:** `{"id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38", "depth": 1, "max_objects": 200}`  
**Result:** ok, 12 ms

```json
{"events": [], "evidence": [], "max_objects": 200, "objects": [{"created_at": "2026-09-28T14:38:46.908817167Z", "evidence": ["971e753e-1515-4cd4-b0cb-9e45ba93bfef", "7caa0c59-3c1e-440b-852b-9e02132a0ef3", "58d32d2d-3afe-44f1-9201-eea476bc1d20"], "id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38", "kind": "Table", "name": "transactions", "properties": {"columns": [{"data_type": "INT", "name": "id"}, {"data_type": "TEXT", "name": "table_name"}, {"data_type": "INT", "description": "This should only be used in pessimistic locking measures as required by large\nbatch work flows.", "name": "locked_by"}, {"data_type": "BOOL", "name": "approved"}, {"data_type": "INT", "name": "approved_by"}, {"data_type": "TIMESTAMP", "name": "approved_at"}], "description": "This table provides referential integrity between AR, AP, GL tables on one\nhand and acc_trans on the other, pending the refactoring of those tables.  It\nalso is used to provide discretionary locking of financial transactions across\ndatabase connections, for example in batch payment workflows.", "sql_comment": "This table provides referential integrity between AR, AP, GL tables on one\nhand and acc_trans on the other, pending the refactoring of those tables.  It\nalso is used to provide discretionary locking of financial transactions across\ndatabase connections, for example in batch payment workflows."}}, {"created_at": "2026-09-28T14:38:47.513199085Z", "evidence": ["496d787a-c12c-4424-bbbf-2920a815a7d9", "90d717c0-727e-4d9b-9432-65 …
```

### 40. `ekos_state` — 2-discovery

**Why:** Columns, keys and author comments of `account` — the source contract for staging  
**Arguments:** `{"id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa"}`  
**Result:** ok, 9 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:17.843615978Z", "fragment": "CREATE TABLE account", "id": "901296b9-bd47-4976-981a-a0d92e7bfbda", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.580145553Z", "fragment": "COMMENT ON COLUMN account.category IS A=asset,L=liability,Q=Equity,I=Income,E=expense", "id": "bf2686c6-466b-426e-9aa6-cb5f4c25ae2e", "location": {"column": null, "line": 72, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:14.799204876Z", "fragment": "COMMENT ON COLUMN account.is_temp IS Only affects equity accounts.  If set, close at end of year.", "id": "f49924ae-234d-4cff-ab6c-447de1cfafab", "location": {"column": null, "line": 75, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:02.735122815Z", "fragment": "COMMENT ON TABLE account IS This table stores the main account info.", "id": "d148b37b-edcc-41c4-bf85-a0623e991c85", "location": {"column": null, "line": 78, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.779480732Z", "evidence": ["901296b9-bd47-4976-981a-a0d92e7bfbda", "bf2686c6-466b-426e-9aa6-cb5f4c25ae2e", "f49924ae-234d-4cff-ab6c-447de1cfafab", "d148b37b-edcc-41c4-bf85-a0623e991c85"], "id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa", "kind": "Table", "name": "account", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "T …
```

### 41. `ekos_neighborhood` — 2-discovery

**Why:** Direct relationships of `account` (foreign keys, referencing code) — join paths  
**Arguments:** `{"id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa", "depth": 1, "max_objects": 200}`  
**Result:** ok, 15 ms

```json
{"events": [], "evidence": [], "max_objects": 200, "objects": [{"created_at": "2026-09-28T14:38:46.779480732Z", "evidence": ["901296b9-bd47-4976-981a-a0d92e7bfbda", "bf2686c6-466b-426e-9aa6-cb5f4c25ae2e", "f49924ae-234d-4cff-ab6c-447de1cfafab", "d148b37b-edcc-41c4-bf85-a0623e991c85"], "id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa", "kind": "Table", "name": "account", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "accno"}, {"data_type": "TEXT", "name": "description"}, {"data_type": "BOOL", "description": "Only affects equity accounts.  If set, close at end of year.", "name": "is_temp"}, {"data_type": "CHAR(1)", "description": "A=asset,L=liability,Q=Equity,I=Income,E=expense", "name": "category"}, {"data_type": "TEXT", "name": "gifi_accno"}, {"data_type": "INT", "name": "heading"}, {"data_type": "BOOL", "name": "contra"}, {"data_type": "BOOL", "name": "tax"}, {"data_type": "BOOL", "name": "obsolete"}], "description": "This table stores the main account info.", "sql_comment": "This table stores the main account info."}}, {"created_at": "2026-09-16T14:57:19.508717796Z", "evidence": ["5c5d3caa-594a-5f2d-9aae-ddd9636cbd1e"], "id": "496363eb-35ec-5731-b13d-d010efacc88c", "kind": "TransformNode", "name": "sql/modules/Account.sql#7:0", "properties": {"columns": [], "node_type": "Source", "object_name": "account"}}, {"created_at": "2026-09-16T14:57:16.411837694Z", "evidence": ["41d2d9a9-3a0c-5574-b3be-f50c8a7ff145"], "id": "b95bc70a-3745- …
```

### 42. `ekos_dependents` — 2-discovery

**Why:** What depends on `acc_trans` — blast radius for the migration unit  
**Arguments:** `{"id": "c74280fe-7b9a-5c74-b97c-afcc35f7f318"}`  
**Result:** ok, 6 ms

```json
{"dependencies": [{"id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa", "kind": "Table", "name": "account", "properties": {"fk_desc": "acc_trans.chart_id → account.id"}, "relationship": "ForeignKey"}, {"id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38", "kind": "Table", "name": "transactions", "properties": {"fk_desc": "acc_trans.trans_id → transactions.id"}, "relationship": "ForeignKey"}, {"id": "0e6ea1d8-d6a6-5675-bedd-9c78651fb835", "kind": "Table", "name": "voucher", "properties": {"fk_desc": "acc_trans.voucher_id → voucher.id"}, "relationship": "ForeignKey"}], "dependencies_count": 3, "dependents": [{"id": "54be8a75-3276-53ed-ad49-9dc59c080e4a", "kind": "TransformNode", "name": "sql/modules/EndOfYear.sql#4:8", "properties": {}, "relationship": "ReadsFrom"}, {"id": "fe296cd7-c00f-57aa-94b3-093ede4e6048", "kind": "TransformNode", "name": "sql/upgrade/sl3.0.sql#297:0", "properties": {}, "relationship": "ReadsFrom"}, {"id": "350bcdb1-14a8-5659-8737-eea48eff1951", "kind": "Table", "name": "ac_tax_form", "properties": {"fk_desc": "ac_tax_form.entry_id → acc_trans.entry_id"}, "relationship": "ForeignKey"}, {"id": "74455cd2-08f7-5487-a097-819f972ceed9", "kind": "Table", "name": "payment_links", "properties": {"fk_desc": "payment_links.entry_id → acc_trans.entry_id"}, "relationship": "ForeignKey"}, {"id": "63249f10-5c6a-5fd5-a951-cd7443ba3a20", "kind": "TransformNode", "name": "sql/modules/EndOfYear.sql#3:5", "properties": {}, "relationship": "ReadsFrom"}, {"id": "ee0acb32-2b01-50af-8dd0-0b4a …
```

### 43. `ekos_impact` — 2-discovery

**Why:** Multi-hop impact of changing `acc_trans`  
**Arguments:** `{"id": "c74280fe-7b9a-5c74-b97c-afcc35f7f318", "direction": "dependents", "max_hops": 3}`  
**Result:** ok, 16 ms

```json
{"count": 11, "direction": "dependents", "hops": [{"hop": 1, "id": "54be8a75-3276-53ed-ad49-9dc59c080e4a", "kind": "TransformNode", "name": "sql/modules/EndOfYear.sql#4:8", "via": "ReadsFrom"}, {"hop": 1, "id": "fe296cd7-c00f-57aa-94b3-093ede4e6048", "kind": "TransformNode", "name": "sql/upgrade/sl3.0.sql#297:0", "via": "ReadsFrom"}, {"hop": 1, "id": "350bcdb1-14a8-5659-8737-eea48eff1951", "kind": "Table", "name": "ac_tax_form", "via": "ForeignKey"}, {"hop": 1, "id": "74455cd2-08f7-5487-a097-819f972ceed9", "kind": "Table", "name": "payment_links", "via": "ForeignKey"}, {"hop": 1, "id": "63249f10-5c6a-5fd5-a951-cd7443ba3a20", "kind": "TransformNode", "name": "sql/modules/EndOfYear.sql#3:5", "via": "ReadsFrom"}, {"hop": 1, "id": "ee0acb32-2b01-50af-8dd0-0b4af8481979", "kind": "TransformNode", "name": "sql/upgrade/1.2-1.5.sql#96:0", "via": "ReadsFrom"}, {"hop": 1, "id": "7ab340ad-56f1-561a-a122-fa5578dd0646", "kind": "TransformNode", "name": "sql/modules/Batch.sql#17:7", "via": "ReadsFrom"}, {"hop": 1, "id": "778a0717-be99-5e4b-bf34-04ddd83e4774", "kind": "Table", "name": "business_unit_ac", "via": "ForeignKey"}, {"hop": 1, "id": "648504e6-65a3-5309-9782-2d9aa43a1f8c", "kind": "TransformNode", "name": "sql/upgrade/1.3-1.5.sql#369:0", "via": "ReadsFrom"}, {"hop": 1, "id": "5a532072-a82b-582e-a8df-b80b9dd6b486", "kind": "Table", "name": "tax_extended", "via": "ForeignKey"}, {"hop": 1, "id": "9fd3359f-2a0c-5693-a2cb-57ab535fffb2", "kind": "TransformNode", "name": "sql/modules/Recon …
```

### 44. `ekos_dependents` — 2-discovery

**Why:** What depends on `parts` — blast radius for the migration unit  
**Arguments:** `{"id": "13575f92-6f74-5533-8a33-04ceabd3b710"}`  
**Result:** ok, 11 ms

```json
{"dependencies": [{"id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa", "kind": "Table", "name": "account", "properties": {"fk_desc": "parts.inventory_accno_id → account.id"}, "relationship": "ForeignKey"}], "dependencies_count": 1, "dependents": [{"id": "e3a7c55c-84ae-5d78-a035-82e9c9aa183a", "kind": "Table", "name": "mfg_lot", "properties": {"fk_desc": "mfg_lot.parts_id → parts.id"}, "relationship": "ForeignKey"}, {"id": "6d054b79-2c4b-5ad6-b6c1-e9381c1d18a6", "kind": "TransformNode", "name": "sql/modules/Company.sql#229:1", "properties": {}, "relationship": "ReadsFrom"}, {"id": "aa34a159-72eb-553e-9f5d-e4bb8260cf19", "kind": "Table", "name": "mfg_lot_item", "properties": {"fk_desc": "mfg_lot_item.parts_id → parts.id"}, "relationship": "ForeignKey"}, {"id": "ec168d64-85d8-5a0b-b93b-5e012c4ae170", "kind": "TransformNode", "name": "sql/modules/Company.sql#199:1", "properties": {}, "relationship": "ReadsFrom"}, {"id": "54227a10-3019-5b0a-98c3-3a3bf045ab6e", "kind": "TransformNode", "name": "sql/modules/Company.sql#207:1", "properties": {}, "relationship": "ReadsFrom"}, {"id": "7d62046a-e73c-5920-ba72-1c5917faabf7", "kind": "Table", "name": "assembly", "properties": {"fk_desc": "assembly.id → parts.id"}, "relationship": "ForeignKey"}, {"id": "b6713072-9468-534b-bc21-7db8a229a960", "kind": "TransformNode", "name": "sql/upgrade/sl3.0.sql#330:0", "properties": {}, "relationship": "ReadsFrom"}, {"id": "8054daf3-7d5a-5a82-b31b-91ffff28d1d7", "kind": "TransformNode", "name": "sql/upgrade/1. …
```

### 45. `ekos_impact` — 2-discovery

**Why:** Multi-hop impact of changing `parts`  
**Arguments:** `{"id": "13575f92-6f74-5533-8a33-04ceabd3b710", "direction": "dependents", "max_hops": 3}`  
**Result:** ok, 34 ms

```json
{"count": 35, "direction": "dependents", "hops": [{"hop": 1, "id": "e3a7c55c-84ae-5d78-a035-82e9c9aa183a", "kind": "Table", "name": "mfg_lot", "via": "ForeignKey"}, {"hop": 1, "id": "6d054b79-2c4b-5ad6-b6c1-e9381c1d18a6", "kind": "TransformNode", "name": "sql/modules/Company.sql#229:1", "via": "ReadsFrom"}, {"hop": 1, "id": "aa34a159-72eb-553e-9f5d-e4bb8260cf19", "kind": "Table", "name": "mfg_lot_item", "via": "ForeignKey"}, {"hop": 1, "id": "ec168d64-85d8-5a0b-b93b-5e012c4ae170", "kind": "TransformNode", "name": "sql/modules/Company.sql#199:1", "via": "ReadsFrom"}, {"hop": 1, "id": "54227a10-3019-5b0a-98c3-3a3bf045ab6e", "kind": "TransformNode", "name": "sql/modules/Company.sql#207:1", "via": "ReadsFrom"}, {"hop": 1, "id": "7d62046a-e73c-5920-ba72-1c5917faabf7", "kind": "Table", "name": "assembly", "via": "ForeignKey"}, {"hop": 1, "id": "b6713072-9468-534b-bc21-7db8a229a960", "kind": "TransformNode", "name": "sql/upgrade/sl3.0.sql#330:0", "via": "ReadsFrom"}, {"hop": 1, "id": "8054daf3-7d5a-5a82-b31b-91ffff28d1d7", "kind": "TransformNode", "name": "sql/upgrade/1.3-1.5.sql#403:0", "via": "ReadsFrom"}, {"hop": 1, "id": "55ae5de7-c058-5d4e-9051-191d9d9a1354", "kind": "Table", "name": "file_part", "via": "ForeignKey"}, {"hop": 1, "id": "7cf94e1a-8401-5a70-9c9c-1b2803a8ba71", "kind": "TransformNode", "name": "sql/modules/COGS.sql#6:7", "via": "ReadsFrom"}, {"hop": 1, "id": "2ea7f176-56d7-5564-831c-2bb5449d91d4", "kind": "Table", "name": "partstax", "via": "ForeignKey"}, {"hop": 1 …
```

### 46. `ekos_dependents` — 2-discovery

**Why:** What depends on `invoice` — blast radius for the migration unit  
**Arguments:** `{"id": "007811f7-d983-545d-9927-998a016f81da"}`  
**Result:** ok, 4 ms

```json
{"dependencies": [{"id": "13575f92-6f74-5533-8a33-04ceabd3b710", "kind": "Table", "name": "parts", "properties": {"fk_desc": "invoice.parts_id → parts.id"}, "relationship": "ForeignKey"}, {"id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38", "kind": "Table", "name": "transactions", "properties": {"fk_desc": "invoice.trans_id → transactions.id"}, "relationship": "ForeignKey"}], "dependencies_count": 2, "dependents": [{"id": "6b78e411-a787-52f0-95c9-70a167005fdc", "kind": "Table", "name": "invoice_tax_form", "properties": {"fk_desc": "invoice_tax_form.invoice_id → invoice.id"}, "relationship": "ForeignKey"}, {"id": "261a2b07-930a-58be-8992-43643c728614", "kind": "Table", "name": "business_unit_inv", "properties": {"fk_desc": "business_unit_inv.entry_id → invoice.id"}, "relationship": "ForeignKey"}, {"id": "ebc93298-09c9-5a2f-a24a-859ed09e5ed7", "kind": "TransformNode", "name": "sql/upgrade/sl3.0.sql#328:0", "properties": {}, "relationship": "ReadsFrom"}, {"id": "4dc96fae-49a2-5469-b548-bfeab2585510", "kind": "TransformNode", "name": "sql/modules/Goods.sql#12:0", "properties": {}, "relationship": "ReadsFrom"}, {"id": "231d2004-fa18-5232-b7b8-b7dda9cc7bff", "kind": "TransformNode", "name": "sql/upgrade/1.3-1.5.sql#401:0", "properties": {}, "relationship": "ReadsFrom"}, {"id": "40f078a4-7934-56ad-b952-d147d9a00ac3", "kind": "TransformNode", "name": "sql/upgrade/1.2-1.5.sql#127:0", "properties": {}, "relationship": "ReadsFrom"}], "dependents_count": 6, "target": {"id": "007811f7-d983-545d …
```

### 47. `ekos_impact` — 2-discovery

**Why:** Multi-hop impact of changing `invoice`  
**Arguments:** `{"id": "007811f7-d983-545d-9927-998a016f81da", "direction": "dependents", "max_hops": 3}`  
**Result:** ok, 11 ms

```json
{"count": 6, "direction": "dependents", "hops": [{"hop": 1, "id": "6b78e411-a787-52f0-95c9-70a167005fdc", "kind": "Table", "name": "invoice_tax_form", "via": "ForeignKey"}, {"hop": 1, "id": "261a2b07-930a-58be-8992-43643c728614", "kind": "Table", "name": "business_unit_inv", "via": "ForeignKey"}, {"hop": 1, "id": "ebc93298-09c9-5a2f-a24a-859ed09e5ed7", "kind": "TransformNode", "name": "sql/upgrade/sl3.0.sql#328:0", "via": "ReadsFrom"}, {"hop": 1, "id": "4dc96fae-49a2-5469-b548-bfeab2585510", "kind": "TransformNode", "name": "sql/modules/Goods.sql#12:0", "via": "ReadsFrom"}, {"hop": 1, "id": "231d2004-fa18-5232-b7b8-b7dda9cc7bff", "kind": "TransformNode", "name": "sql/upgrade/1.3-1.5.sql#401:0", "via": "ReadsFrom"}, {"hop": 1, "id": "40f078a4-7934-56ad-b952-d147d9a00ac3", "kind": "TransformNode", "name": "sql/upgrade/1.2-1.5.sql#127:0", "via": "ReadsFrom"}], "max_hops": 3, "target": {"id": "007811f7-d983-545d-9927-998a016f81da"}}
```

### 48. `ekos_search` — 2-discovery

**Why:** Where LedgerSMB implements 'cost of goods sold FIFO' — business logic the marts must reproduce  
**Arguments:** `{"query": "cost of goods sold FIFO", "limit": 15}`  
**Result:** ok, 5 ms

```json
{"arm_timings": [{"candidates": 50, "elapsed_ms": 4.823829, "source": "Bm25"}], "arms_run": {"bm25": true, "vector": false}, "matches": [{"id": "77c9ae6c-c087-55c8-b72b-74417b3d20c5", "name": "xt/66-cucumber/16-cogs/simple-ar.feature"}, {"id": "94490fa7-08e5-56f0-932f-2dc324e19be2", "name": "xt/42-cogs-fifo.pg"}, {"id": "f56e64f7-2d7c-5e73-975b-ac5c4c3d8956", "name": "charts_of_accounts"}, {"id": "e0c66c45-c838-5027-a2d9-f4d987e9fc8b", "name": "chart_of_accounts"}, {"id": "2d11ef71-0206-5f72-a964-92e5311e504e", "name": ".github/CODE_OF_CONDUCT.md"}, {"id": "f25d543c-1664-5103-809b-a05fbe4b620d", "name": ".github/CODE_OF_CONDUCT.md"}, {"id": "da1f336a-a1cc-585b-986e-77a162d48cc0", "name": "_process_goods"}, {"id": "185cde30-82e8-5642-ab6d-f257705db4ce", "name": ".github/CODE_OF_CONDUCT.md: section 1"}, {"id": "2cd11265-4162-54a5-804d-d4be0ba206fc", "name": "LedgerSMB::Scripts::goods"}, {"id": "af4309e6-7e44-5e46-b7cf-46b78fdc58c3", "name": "lib/LedgerSMB/Scripts/goods.pm"}, {"id": "081ed37e-8bcb-5148-b1e9-f7392c44cc83", "name": "xt/66-cucumber/10-gl/chart-of-accounts.feature"}, {"id": "9552747d-ac29-5997-8c13-efa405d074a5", "name": "xt/42-goods.pg"}, {"id": "1bcb1766-9712-507f-b6e3-59747090ccca", "name": "sql/modules/Goods.sql"}, {"id": "4a8acc7a-b743-5fcb-87fb-2f0323047afc", "name": "UI/Reports/filters/search_goods.html"}, {"id": "dc608d9b-7c71-5fc8-992c-353b0c675cbc", "name": "xt/66-cucumber/README.md § Code structure › Structure of feature files"}]}
```

### 49. `ekos_search` — 2-discovery

**Why:** Where LedgerSMB implements 'trial balance' — business logic the marts must reproduce  
**Arguments:** `{"query": "trial balance", "limit": 15}`  
**Result:** ok, 1 ms

```json
{"arm_timings": [{"candidates": 50, "elapsed_ms": 0.29529099999999997, "source": "Bm25"}], "arms_run": {"bm25": true, "vector": false}, "matches": [{"id": "657bd0ed-585c-5ea1-bb24-272cf5dc0533", "name": "xt/42-trial_balance.pg"}, {"id": "36adb2e1-04ab-572f-8c91-b92083450a9f", "name": "LedgerSMB::Scripts::trial_balance"}, {"id": "1abb6891-aaa2-53eb-a8b7-b21360b13ef2", "name": "trial_balance__yearend_types"}, {"id": "7df1cb9b-d1e1-587f-8fc8-f788617e9298", "name": "LedgerSMB::Report::Trial_Balance"}, {"id": "93481657-15ce-5159-bd9e-90302740af52", "name": "sql/modules/trial_balance.sql"}, {"id": "8fd438e8-8beb-56f8-8db5-a0c8ab159f6a", "name": "lib/LedgerSMB/Scripts/trial_balance.pm"}, {"id": "598dcef9-c45e-53b2-9600-2609cd9653c7", "name": "lib/LedgerSMB/Report/Trial_Balance.pm"}, {"id": "f9dd98c0-b4c4-52d8-9d28-3c6287e40578", "name": "UI/Reports/filters/trial_balance.html"}, {"id": "f444f62b-b0d7-5805-81d3-3c02344d56bc", "name": "UI/Reports/filters/trial_balance.html"}, {"id": "0a899e99-acf6-55bc-9542-89f60b080626", "name": "sql/changes/1.5/trial_balance_cleanup.sql"}, {"id": "3bd19357-ce9b-5f9c-8648-36319579e0e8", "name": "mc_migration_validation_data.trial_balances"}, {"id": "cef0e76a-db57-5397-9912-ab1d1eaff80c", "name": "UI/Reports/filters/trial_balance.html: section 1"}, {"id": "4a9738af-72db-59ae-84d0-ffcd674dc97e", "name": "UI/Reports/filters/trial_balance.html: section 4"}, {"id": "05a26129-97a0-53d7-9e41-f13739b45698", "name": "sql/modules/trial_balance.sql#4:0"}, {"id": …
```

### 50. `ekos_search` — 2-discovery

**Why:** Where LedgerSMB implements 'balance sheet income statement' — business logic the marts must reproduce  
**Arguments:** `{"query": "balance sheet income statement", "limit": 15}`  
**Result:** ok, 1 ms

```json
{"arm_timings": [{"candidates": 50, "elapsed_ms": 1.10287, "source": "Bm25"}], "arms_run": {"bm25": true, "vector": false}, "matches": [{"id": "28f62485-9b3c-5add-b370-2c8c3a93c1b3", "name": "sql/modules/Roles.sql#572:0"}, {"id": "bd5e7175-de45-5cca-b16f-1914e55e1705", "name": "t/14-report-dates.t"}, {"id": "7e67dfa9-9a78-584f-9851-1949d1187209", "name": "UI/templates/widget.html"}, {"id": "73ec5093-1c12-57e6-a98e-1f4a8dc2fc48", "name": "sql/changes/1.8/notify-import-financial-report-templates.sql#0:1"}, {"id": "7991ed79-c374-5594-86c7-54c08ea94621", "name": "sql/changes/1.8/notify-import-financial-report-templates.sql@1"}, {"id": "9402fb0c-816d-5d4e-b9ba-5ccc96cbdb6e", "name": "sql/changes/1.8/notify-import-financial-report-templates.sql"}, {"id": "13da4e4b-71ee-51a3-912f-9443060fb587", "name": "UI/templates/widget.html: section 1"}, {"id": "a2159b8a-bb4a-5a17-9665-ab0872b37b8b", "name": "generate_income_statement"}, {"id": "cb20300f-a62a-5ec3-b264-57b06b7bdc44", "name": "generate_balance_sheet"}, {"id": "b7198ebc-37a1-5060-9e79-072328e8190f", "name": "LedgerSMB::Report::Balance_Sheet"}, {"id": "9f17c98f-872b-50f2-bc62-19ce66497d7d", "name": "LedgerSMB::Report::PNL::Income_Statement"}, {"id": "c9e2e6b7-19f5-549d-b40b-1ff80fb3d736", "name": "UI/Reports/balance_sheet.html"}, {"id": "b14fb0c1-7046-5026-ac16-c58dd903d65d", "name": "lib/LedgerSMB/Report/Balance_Sheet.pm"}, {"id": "e74a1e6a-8939-50d3-b45d-2677bd5fac6a", "name": "UI/Reports/filters/income_statement.html"}, {"id": " …
```

### 51. `ekos_search` — 2-discovery

**Why:** Where LedgerSMB implements 'inventory adjustment' — business logic the marts must reproduce  
**Arguments:** `{"query": "inventory adjustment", "limit": 15}`  
**Result:** ok, 1 ms

```json
{"arm_timings": [{"candidates": 50, "elapsed_ms": 0.70163, "source": "Bm25"}], "arms_run": {"bm25": true, "vector": false}, "matches": [{"id": "ea5b1574-ba02-57ab-9c96-1be144c1eec6", "name": "adjust_inventory"}, {"id": "2de2ae2f-87dd-54b3-9aa8-a5a91c2cc211", "name": "LedgerSMB::Inventory::Adjust"}, {"id": "c7a3be17-e86c-54e1-ad01-9984f7d5d827", "name": "lib/LedgerSMB/Inventory/Adjust.pm"}, {"id": "0146df51-ea30-589e-94a5-c0957e7ec8e9", "name": "LedgerSMB::Inventory::Adjust_Line"}, {"id": "37be53ef-e123-52f8-8bdb-bf5c200ccf2c", "name": "UI/inventory/adjustment_entry.html"}, {"id": "10b5fab5-6433-5b3c-b9f4-7d8fdba9a62c", "name": "UI/inventory/adjustment_setup.html"}, {"id": "1cd7df0d-42a4-5802-a7af-188c6aae0b13", "name": "UI/inventory/adjustment_setup.html"}, {"id": "e20f5ad2-bb7e-5064-9d5c-f134e0a1f7f9", "name": "lib/LedgerSMB/Inventory/Adjust_Line.pm"}, {"id": "cd2176c8-8d14-58f6-9923-19c37fc65865", "name": "UI/inventory/adjustment_entry.html"}, {"id": "feacd935-f67f-5a6f-89a2-07a8effee41f", "name": "Concentration risk: LedgerSMB::Inventory::Adjust"}, {"id": "96d3dd8d-848a-581b-9af9-358c80aaeaea", "name": "xt/66-cucumber/30-inventory/adjustments.feature"}, {"id": "a308e3d1-4c00-5da3-bdd5-d4c1b0cda597", "name": "Concentration risk: LedgerSMB::Inventory::Adjust_Line"}, {"id": "deaea500-a763-573d-b38f-18284db65c06", "name": "UI/inventory/adjustment_entry.html: section 1"}, {"id": "cc0c1df4-d983-58ce-8078-b91dcad08ab4", "name": "UI/inventory/adjustment_setup.html: section 1"}, {" …
```

### 52. `ekos_search` — 2-discovery

**Why:** Where LedgerSMB implements 'open item' — business logic the marts must reproduce  
**Arguments:** `{"query": "open item", "limit": 15}`  
**Result:** ok, 1 ms

```json
{"arm_timings": [{"candidates": 50, "elapsed_ms": 0.23341099999999998, "source": "Bm25"}], "arms_run": {"bm25": true, "vector": false}, "matches": [{"id": "157a3e00-7af7-5262-8569-e80b22e97bb4", "name": "open_items"}, {"id": "4050340b-d85d-5da8-960c-74d76fc458a6", "name": "open_item"}, {"id": "936c2238-decc-5ad3-8d89-ac70b7013a18", "name": "sql/changes/1.14/overpayments-as-open-items.sql"}, {"id": "f6e3aa25-adae-59c5-ace5-21d0e3686e76", "name": "sql/changes/1.14/open-item-tracking.sql"}, {"id": "e5ea860c-093f-5f3b-b668-10a9eeef9128", "name": "t/16-prechecks/1.14/open-item-tracking.precheck"}, {"id": "e6626d0e-37b6-58f5-b478-422e766587cb", "name": "sql/changes/1.14/open-item-tracking.sql.checks.pl"}, {"id": "d8558871-bff3-5b35-bfca-202bbfe372fb", "name": "sql/changes/1.14/open-item-tracking.sql#10:1"}, {"id": "0d8b8f51-238f-5c01-bd84-6777d72b938e", "name": "sql/changes/1.14/open-item-tracking.sql#10:3"}, {"id": "4761a934-f1c4-5ef7-8cf1-a56d10cad799", "name": "sql/changes/1.14/open-item-tracking.sql#10:5"}, {"id": "1b2ad663-3a99-5bbf-beca-db67aaca430f", "name": "sql/changes/1.14/open-item-tracking.sql#10:7"}, {"id": "20c2479c-1ab7-552d-aa3a-e931e180e3d6", "name": "sql/changes/1.14/open-item-tracking.sql#10:9"}, {"id": "9f8c0951-9ad3-5c93-aecc-d2140d70a326", "name": "sql/changes/1.14/open-item-tracking.sql#10:11"}, {"id": "e98be08a-5a16-5f39-a200-c7dff69276e3", "name": "sql/changes/1.14/open-item-tracking.sql#10:13"}, {"id": "4d387084-c72b-51ae-82e3-d5f078428236", "name": "sql/c …
```

### 53. `ekos_search` — 2-discovery

**Why:** Where LedgerSMB implements 'payment post' — business logic the marts must reproduce  
**Arguments:** `{"query": "payment post", "limit": 15}`  
**Result:** ok, 1 ms

```json
{"arm_timings": [{"candidates": 50, "elapsed_ms": 0.8037390000000001, "source": "Bm25"}], "arms_run": {"bm25": true, "vector": false}, "matches": [{"id": "fce40979-0982-5f75-bb52-f213414c86c9", "name": "post_payment"}, {"id": "45d52457-180d-5516-b0a6-88446d3aaf96", "name": "post_payment"}, {"id": "7fa5931c-ba0a-5794-b4c5-8c49b3b05e3c", "name": "post_payments_bulk"}, {"id": "a03301e4-bd2a-51c6-a2f1-e97424fd8cd8", "name": "post_and_print_payment"}, {"id": "77de1117-98ed-54a8-a582-4bc3c1ccc8bc", "name": "UI/payments/payments_filter.html"}, {"id": "bd5a54c9-17fa-53b8-a223-8daf08908e3c", "name": "UI/payments/payments_detail.html: section 21"}, {"id": "2689ecff-98b2-5c7c-a144-8efebe2d3b31", "name": "UI/payments/payments_detail.html: section 1"}, {"id": "ba1bebcf-f688-58db-8834-f7ecd2017390", "name": "workflows/payment.workflow.xml"}, {"id": "8f08dcfe-c113-542b-95cf-d1b5b4262061", "name": "UI/payments/payment2.html"}, {"id": "975dac6a-3fb4-543a-b872-437d0303ab63", "name": "workflows/payment.actions.xml"}, {"id": "1f102df3-29a1-551a-97e3-8bbb89a2717a", "name": "xt/42-payment.pg"}, {"id": "6fdcae9a-59d8-52e2-9cc0-aaaa58c59077", "name": "UI/payments/payment2.html: section 51"}, {"id": "3c3d976c-a5d5-5c56-be54-bd74c3520e62", "name": "UI/payments/payment1_5.html"}, {"id": "8e98d1d8-d04a-50ce-b5bc-2652063cf040", "name": "UI/payments/use_overpayment2.html"}, {"id": "8365d063-e972-545f-ad4c-95cfc61903df", "name": "UI/payments/use_overpayment2.html: section 34"}]}
```

### 54. `ekos_search` — 2-discovery

**Why:** Where LedgerSMB implements 'aging receivables' — business logic the marts must reproduce  
**Arguments:** `{"query": "aging receivables", "limit": 15}`  
**Result:** ok, 1 ms

```json
{"arm_timings": [{"candidates": 50, "elapsed_ms": 0.5314949999999999, "source": "Bm25"}], "arms_run": {"bm25": true, "vector": false}, "matches": [{"id": "b50ad733-d1cb-5748-ab22-26dcda970b1b", "name": "UI/src/locales/tr_TR.json"}, {"id": "89d9c7a4-3acd-5ead-b98a-c1c7364d5f08", "name": "UI/src/locales/el.json"}, {"id": "bfdc707b-a5b2-5d9d-9e49-5835b4680807", "name": "UI/src/locales/fi.json"}, {"id": "36444e16-4fc3-57ad-914a-449ad3235f45", "name": "UI/src/locales/is.json"}, {"id": "028bf706-7211-54b9-ae2a-ae9804c5bc0e", "name": "UI/src/locales/lt.json"}, {"id": "7979f797-193e-5eb8-9a23-f4b54779e394", "name": "UI/src/locales/bg.json"}, {"id": "c820be8a-1dc9-53a3-8152-97b081944be8", "name": "UI/src/locales/lv.json"}, {"id": "ef48f708-7a63-5ae9-9f03-4fda88335489", "name": "UI/src/locales/uk.json"}, {"id": "8e579b31-5a22-5003-ae5a-f0d96c670e78", "name": "UI/src/locales/cs.json"}, {"id": "a10f5aa4-8707-58cc-a46c-b389719e1e84", "name": "UI/src/locales/ca.json"}, {"id": "7c4ee863-7f19-51f8-b31a-17417a71926d", "name": "UI/src/locales/id_ID.json"}, {"id": "65c61037-a182-5ec2-946e-f81e822d1731", "name": "UI/src/locales/tr.json"}, {"id": "71a0567f-5860-55f6-aef5-f03500582e75", "name": "ship_receive"}, {"id": "19305a84-43f1-5f35-acb8-388e50a96aa2", "name": "display_ship_receive"}, {"id": "7579ea4f-5c62-5a7b-929c-21a1175ec115", "name": "LedgerSMB::Report::Aging"}]}
```

### 55. `ekos_query` — 2-discovery

**Why:** Compiled structural answer (no LLM)  
**Arguments:** `{"question": "what depends on the acc_trans table"}`  
**Result:** ok, 31 ms

```json
{"diagnostics": [], "items": [{"claim": "ac_tax_form — dependents of acc_trans — Mapping journal_line to country_tax_form for reporting purposes.", "confidence": 1.0, "entity": "350bcdb1-14a8-5659-8737-eea48eff1951", "extracted_by": "", "location": "sql/Pg-database.sql", "source": "8fabf7d2-50f0-4e03-8cbe-7750f5c57a0e", "value": "350bcdb1-14a8-5659-8737-eea48eff1951"}, {"claim": "payment_links — dependents of acc_trans — An explanation to the type field.\n * A type 0 means the link is referencing an ar/ap  and was created\n   using an overpayment movement after the receipt was created\n * A type 1 means the link is referencing an ar/ap and  was made\n   on the payment creation, its not the product of…", "confidence": 1.0, "entity": "74455cd2-08f7-5487-a097-819f972ceed9", "extracted_by": "", "location": "sql/Pg-database.sql", "source": "5c874c2c-ed20-4402-baef-b10287c8b227", "value": "74455cd2-08f7-5487-a097-819f972ceed9"}, {"claim": "business_unit_ac — dependents of acc_trans", "confidence": 1.0, "entity": "778a0717-be99-5e4b-bf34-04ddd83e4774", "extracted_by": "", "location": "sql/Pg-database.sql", "source": "4c916383-6312-4282-b110-e8e1fd0a2d62", "value": "778a0717-be99-5e4b-bf34-04ddd83e4774"}, {"claim": "tax_extended — dependents of acc_trans — This stores extended information for manual tax calculations.", "confidence": 1.0, "entity": "5a532072-a82b-582e-a8df-b80b9dd6b486", "extracted_by": "", "location": "sql/Pg-database.sql", "source": "f77b129e-8437-4926-a8dc-c69bcdea …
```

### 56. `ekos_query` — 2-discovery

**Why:** Compiled structural answer (no LLM)  
**Arguments:** `{"question": "what depends on the parts table"}`  
**Result:** ok, 55 ms

```json
{"diagnostics": [], "items": [{"claim": "mfg_lot — dependents of parts — This tracks assembly restocks.  This is designed to work with old code and\nmay change as we refactor the parts.", "confidence": 1.0, "entity": "e3a7c55c-84ae-5d78-a035-82e9c9aa183a", "extracted_by": "", "location": "sql/Pg-database.sql", "source": "5c28b5e4-35da-433b-869f-ea268c337143", "value": "e3a7c55c-84ae-5d78-a035-82e9c9aa183a"}, {"claim": "mfg_lot_item — dependents of parts — This tracks items used in assembly restocking.", "confidence": 1.0, "entity": "aa34a159-72eb-553e-9f5d-e4bb8260cf19", "extracted_by": "", "location": "sql/Pg-database.sql", "source": "1a2026d7-e20b-4c06-9df7-4cfabb3e2e1d", "value": "aa34a159-72eb-553e-9f5d-e4bb8260cf19"}, {"claim": "assembly — dependents of parts — Holds mapping for parts that are members of assemblies.", "confidence": 1.0, "entity": "7d62046a-e73c-5920-ba72-1c5917faabf7", "extracted_by": "", "location": "sql/Pg-database.sql", "source": "7b8a706f-fe68-4a59-80b5-9e211aa3bc9f", "value": "7d62046a-e73c-5920-ba72-1c5917faabf7"}, {"claim": "file_part — dependents of parts — File attachments primarily attached to goods and services.", "confidence": 1.0, "entity": "55ae5de7-c058-5d4e-9051-191d9d9a1354", "extracted_by": "", "location": "sql/Pg-database.sql", "source": "45224abe-77f5-4736-82d5-e8f01b846afc", "value": "55ae5de7-c058-5d4e-9051-191d9d9a1354"}, {"claim": "partstax — dependents of parts — Mapping of parts to taxes.", "confidence": 1.0, "entity": "2ea7f176 …
```

### 57. `ekos_query` — 2-discovery

**Why:** Compiled structural answer (no LLM)  
**Arguments:** `{"question": "which tables reference the account table"}`  
**Result:** ok, 86 ms

```json
{"diagnostics": [], "items": [{"claim": "search match: sql/changes/1.4/account-translations.sql — CREATE TABLE IF NOT EXISTS account_translation\n(PRIMARY KEY (trans_id, language_code)) INHERITS (translation);\nALTER TABLE account_translation\nADD foreign key (trans_id) REFERENCES account(id);\n\nCOMMENT ON TABLE account_translation IS\n$$Translations for account descriptions.$$;\n\n…", "confidence": 1.0, "entity": "24f41f97-9bcf-5da6-9409-5325a9194d99", "extracted_by": "", "location": "sql/changes/1.4/account-translations.sql", "source": "8a03b894-28a7-51f5-a075-aabcf43c8706", "value": "sql/changes/1.4/account-translations.sql"}, {"claim": "search match: sql/changes/1.4/account-translations.sql@1 — CREATE TABLE account_translation\n(PRIMARY KEY (trans_id, language_code)) INHERITS (translation);\nALTER TABLE account_translation\nADD foreign key (trans_id) REFERENCES account(id);\n\nCOMMENT ON TABLE account_translation IS\n$$Translations for account descriptions.$$;\n\nCREATE TABLE a…", "confidence": 1.0, "entity": "3903c875-bdc1-550f-93ec-93acf4d0e0d7", "extracted_by": "", "location": "sql/changes/1.4/account-translations.sql@1", "source": "a50ea6e8-2c31-5705-8dd5-17ec86d7e7e0", "value": "sql/changes/1.4/account-translations.sql@1"}, {"claim": "search match: sql/changes/1.6/add-eca-business-foreign-key.sql — -- entity_credit_account.business_id should have a foreign key constraint\nALTER TABLE entity_credit_account\nADD FOREIGN KEY (business_id) REFERENCES business(id);", "co …
```

### 58. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `acc_trans`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'acc_trans'"}`  
**Result:** ok, 1066 ms

```json
{"count": 1, "rows": [{"id": "c74280fe-7b9a-5c74-b97c-afcc35f7f318", "kind": "Table", "name": "acc_trans"}]}
```

### 59. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `acc_trans`  
**Arguments:** `{"id": "c74280fe-7b9a-5c74-b97c-afcc35f7f318"}`  
**Result:** ok, 16 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:53.874571127Z", "fragment": "CREATE TABLE acc_trans", "id": "d8bfc9e6-52b0-44ac-9fd6-1ca27ef229dd", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:03.787189683Z", "fragment": "COMMENT ON TABLE acc_trans IS This table stores line items for financial transactions.  Please note that\npayments in 1.3 are not full-fledged transactions.", "id": "1d395fba-3b15-48fd-9442-23911b9e65e6", "location": {"column": null, "line": 1142, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.758000537Z", "fragment": "COMMENT ON COLUMN acc_trans.source IS Document Source identifier for individual line items, usually used\nfor payments.", "id": "6654131a-eeae-4b30-9c34-8b5acbc14412", "location": {"column": null, "line": 1146, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:00.930183454Z", "fragment": "COMMENT ON COLUMN acc_trans.fx_transaction IS When 'f', indicates that the amount column states the amount in the currency\nas specified in the associated ar, ap, payment or gl record.\n\nWhen 't', indicates that the amount column states the difference between\nthe foreighn currency amount and the base amount so that their sum equals the\nbase amount.", "id": "91dc78f4-32c7-461a-abf7-481e008b94a9", "location": {"column": null, "line": 1150, "path": "sql/Pg-database.sql"}}], "object": { …
```

### 60. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `account`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'account'"}`  
**Result:** ok, 491 ms

```json
{"count": 1, "rows": [{"id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa", "kind": "Table", "name": "account"}]}
```

### 61. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `account`  
**Arguments:** `{"id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa"}`  
**Result:** ok, 38 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:17.843615978Z", "fragment": "CREATE TABLE account", "id": "901296b9-bd47-4976-981a-a0d92e7bfbda", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.580145553Z", "fragment": "COMMENT ON COLUMN account.category IS A=asset,L=liability,Q=Equity,I=Income,E=expense", "id": "bf2686c6-466b-426e-9aa6-cb5f4c25ae2e", "location": {"column": null, "line": 72, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:14.799204876Z", "fragment": "COMMENT ON COLUMN account.is_temp IS Only affects equity accounts.  If set, close at end of year.", "id": "f49924ae-234d-4cff-ab6c-447de1cfafab", "location": {"column": null, "line": 75, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:02.735122815Z", "fragment": "COMMENT ON TABLE account IS This table stores the main account info.", "id": "d148b37b-edcc-41c4-bf85-a0623e991c85", "location": {"column": null, "line": 78, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.779480732Z", "evidence": ["901296b9-bd47-4976-981a-a0d92e7bfbda", "bf2686c6-466b-426e-9aa6-cb5f4c25ae2e", "f49924ae-234d-4cff-ab6c-447de1cfafab", "d148b37b-edcc-41c4-bf85-a0623e991c85"], "id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa", "kind": "Table", "name": "account", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "T …
```

### 62. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `account_heading`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'account_heading'"}`  
**Result:** ok, 461 ms

```json
{"count": 1, "rows": [{"id": "e7b1a9be-ac14-54f9-8cc3-7e92de186c6f", "kind": "Table", "name": "account_heading"}]}
```

### 63. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `account_heading`  
**Arguments:** `{"id": "e7b1a9be-ac14-54f9-8cc3-7e92de186c6f"}`  
**Result:** ok, 20 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:01.048946470Z", "fragment": "CREATE TABLE account_heading", "id": "19cee386-32a1-4b0b-bc80-e1a285430e26", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:06.606070117Z", "fragment": "COMMENT ON TABLE account_heading IS This table holds the account headings in the system.  Each account must belong\nto a heading, and a heading can belong to another heading.  In this way it is\npossible to nest accounts for reporting purposes.", "id": "8d3b7784-a581-46db-b310-9a2eb6524594", "location": {"column": null, "line": 49, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:07.349836034Z", "fragment": "COMMENT ON COLUMN account_heading.category IS Same as the column account.category, except that if NULL the category\nis automatically derived from the linked accounts.", "id": "81a5d667-63c0-4ee2-83aa-1f8a3fd46f5e", "location": {"column": null, "line": 54, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.764904977Z", "evidence": ["19cee386-32a1-4b0b-bc80-e1a285430e26", "8d3b7784-a581-46db-b310-9a2eb6524594", "81a5d667-63c0-4ee2-83aa-1f8a3fd46f5e"], "id": "e7b1a9be-ac14-54f9-8cc3-7e92de186c6f", "kind": "Table", "name": "account_heading", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "accno"}, {"data_type": "INT", "name": "parent_id"},  …
```

### 64. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `account_link`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'account_link'"}`  
**Result:** ok, 463 ms

```json
{"count": 1, "rows": [{"id": "f0b041a2-2a84-5909-805f-07a146cf963a", "kind": "Table", "name": "account_link"}]}
```

### 65. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `account_link`  
**Arguments:** `{"id": "f0b041a2-2a84-5909-805f-07a146cf963a"}`  
**Result:** ok, 7 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:08.326847880Z", "fragment": "CREATE TABLE account_link", "id": "d9471544-efe2-4931-b416-6dc81e1d49b3", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.819065335Z", "evidence": ["d9471544-efe2-4931-b416-6dc81e1d49b3"], "id": "f0b041a2-2a84-5909-805f-07a146cf963a", "kind": "Table", "name": "account_link", "properties": {"columns": [{"data_type": "INT", "name": "account_id"}, {"data_type": "TEXT", "name": "description"}]}}, "relationships": [{"created_at": "2026-09-16T14:59:23.839858321Z", "evidence": ["f1c75431-2fc4-5266-97e2-00362c5a931e"], "from": "d87b3d95-0623-5b7c-bc42-41d04b4d7c45", "id": "3664cf81-f00e-5d6f-a4e6-a578711a28a4", "kind": "ReadsFrom", "properties": {}, "to": "f0b041a2-2a84-5909-805f-07a146cf963a", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:39:52.803633702Z", "evidence": ["fadc86f0-2f09-4eee-ac88-828877e37c30"], "from": "f0b041a2-2a84-5909-805f-07a146cf963a", "id": "572552d6-bd3e-5850-8958-f2eed1fedb6b", "kind": "ForeignKey", "properties": {"fk_desc": "account_link.description → account_link_description.description"}, "to": "16928103-1b38-5cb4-9342-b9e9d8cf9da8", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:39:52.796165946Z", "evidence": ["eb8a44e3-71be-480d-a246-7741acf809eb"], "from": "f0b041a2-2a84-5909-805f-07a146cf963a", "id": "6d8a6772-89ec-5eaf-a08f-62713f6de …
```

### 66. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `ap`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'ap'"}`  
**Result:** ok, 450 ms

```json
{"count": 1, "rows": [{"id": "a337a7d7-e368-58e4-9c45-cba719c6046b", "kind": "Table", "name": "ap"}]}
```

### 67. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `ap`  
**Arguments:** `{"id": "a337a7d7-e368-58e4-9c45-cba719c6046b"}`  
**Result:** ok, 27 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:59.394273628Z", "fragment": "CREATE TABLE ap", "id": "e95d7643-1d8c-4fb4-9f61-33fed4e7fe49", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:07.647647051Z", "fragment": "COMMENT ON TABLE ap IS Summary/header information for AP transactions and vendor invoices.\nNote that some constraints here are hard to enforce because we haven not gotten\nto rewriting the relevant code here.\nHV TODO drop entity_id", "id": "67fc1400-30ff-4ec3-9567-09231551d480", "location": {"column": null, "line": 1442, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:53.944796256Z", "fragment": "COMMENT ON COLUMN ap.invnumber IS Text identifier for the invoice.  Must be unique.", "id": "36f36baa-6ace-4993-8ecf-b19d3fe715ef", "location": {"column": null, "line": 1449, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:56.007033168Z", "fragment": "COMMENT ON COLUMN ap.invoice IS True if the transaction tracks goods/services purchase using the invoice\ntable.  False otherwise.", "id": "c0cea321-485b-4dce-866c-f53e9b0f761d", "location": {"column": null, "line": 1452, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:02.182336869Z", "fragment": "COMMENT ON COLUMN ap.amount IS This stores the total amount (including taxes) for the transaction.", "id": "08077b22-22c …
```

### 68. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `ar`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'ar'"}`  
**Result:** ok, 477 ms

```json
{"count": 1, "rows": [{"id": "ccdf16c2-236c-55c2-a135-1a00c662c231", "kind": "Table", "name": "ar"}]}
```

### 69. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `ar`  
**Arguments:** `{"id": "ccdf16c2-236c-55c2-a135-1a00c662c231"}`  
**Result:** ok, 17 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:00.450396543Z", "fragment": "CREATE TABLE ar", "id": "cae5a52c-3d6e-46c4-b8f1-55faa6ed992e", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.760613987Z", "fragment": "COMMENT ON TABLE ar IS Summary/header information for AR transactions and sales invoices.\nNote that some constraints here are hard to enforce because we haven not gotten\nto rewriting the relevant code here.\nHV TODO drop entity_id", "id": "f765cd21-8bfe-4baf-9898-c2ad7454bdfb", "location": {"column": null, "line": 1355, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:08.578808031Z", "fragment": "COMMENT ON COLUMN ar.invnumber IS Text identifier for the invoice.  Must be unique.", "id": "d9c09ae5-39e6-46a6-b3c4-724f601398f5", "location": {"column": null, "line": 1362, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.193153685Z", "fragment": "COMMENT ON COLUMN ar.invoice IS True if the transaction tracks goods/services purchase using the invoice\ntable.  False otherwise.", "id": "4b825c90-b380-4e2e-a6b6-ad49234d91a6", "location": {"column": null, "line": 1365, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:03.171018272Z", "fragment": "COMMENT ON COLUMN ar.amount IS This stores the total amount (including taxes) for the transaction.", "id": "9fe2bb45-7970 …
```

### 70. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `business`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'business'"}`  
**Result:** ok, 464 ms

```json
{"count": 1, "rows": [{"id": "6a3a8d48-4425-58e2-acf1-cc488d9cd7e8", "kind": "Table", "name": "business"}]}
```

### 71. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `business`  
**Arguments:** `{"id": "6a3a8d48-4425-58e2-acf1-cc488d9cd7e8"}`  
**Result:** ok, 14 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:18.081124909Z", "fragment": "CREATE TABLE business", "id": "ce69dc33-4ca1-45e9-896c-43d635c91bd8", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.510958009Z", "fragment": "COMMENT ON TABLE business IS Groups of Customers assigned joint discounts.", "id": "8e0b0720-ebfe-4742-bc35-e88bcc344a11", "location": {"column": null, "line": 1825, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.900044200Z", "evidence": ["ce69dc33-4ca1-45e9-896c-43d635c91bd8", "8e0b0720-ebfe-4742-bc35-e88bcc344a11"], "id": "6a3a8d48-4425-58e2-acf1-cc488d9cd7e8", "kind": "Table", "name": "business", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "description"}, {"data_type": "NUMERIC", "name": "discount"}], "description": "Groups of Customers assigned joint discounts.", "sql_comment": "Groups of Customers assigned joint discounts."}}, "relationships": [{"created_at": "2026-09-16T14:59:23.839534395Z", "evidence": ["941b72ff-1b7d-5f90-bb40-423759bceee8"], "from": "e22be6c2-402f-5a60-b753-e4cdcef9827f", "id": "18d9bb41-d196-5efe-87c2-98cfc84dd0fc", "kind": "ReadsFrom", "properties": {}, "to": "6a3a8d48-4425-58e2-acf1-cc488d9cd7e8", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:40:04.963153881Z", "evidence": ["f968f9e6-5e35-4e40-995a-369aca7a5e0e"], "from":  …
```

### 72. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `company`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'company'"}`  
**Result:** ok, 462 ms

```json
{"count": 1, "rows": [{"id": "ebaa9398-3b6a-597f-8b54-b5cecf3acec5", "kind": "Table", "name": "company"}]}
```

### 73. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `company`  
**Arguments:** `{"id": "ebaa9398-3b6a-597f-8b54-b5cecf3acec5"}`  
**Result:** ok, 12 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:00.210513634Z", "fragment": "CREATE TABLE company", "id": "efd1d4c0-6bc6-497a-8e77-6ee6a0ed4cc5", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:11.764702169Z", "fragment": "COMMENT ON COLUMN company.tax_id IS In the US this would be a EIN.", "id": "74a2ff23-3cd2-4536-a5d3-07ca9e1284de", "location": {"column": null, "line": 414, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.981971466Z", "evidence": ["efd1d4c0-6bc6-497a-8e77-6ee6a0ed4cc5", "74a2ff23-3cd2-4536-a5d3-07ca9e1284de"], "id": "ebaa9398-3b6a-597f-8b54-b5cecf3acec5", "kind": "Table", "name": "company", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "INTEGER", "name": "entity_id"}, {"data_type": "TEXT", "name": "legal_name"}, {"data_type": "TEXT", "description": "In the US this would be a EIN.", "name": "tax_id"}, {"data_type": "TEXT", "name": "sales_tax_id"}, {"data_type": "TEXT", "name": "license_number"}, {"data_type": "VARCHAR", "name": "sic_code"}, {"data_type": "DATE", "name": "created"}]}}, "relationships": [{"created_at": "2026-09-16T14:59:23.839521126Z", "evidence": ["0717a3ae-1326-53ad-83d9-07fe69d1256f"], "from": "03377bc4-ee2e-5328-b43b-0f1878c55835", "id": "0616e748-0f9e-5952-ac01-a81a9e4e95f6", "kind": "ReadsFrom", "properties": {}, "to": "ebaa9398-3b6a-597f-8b54-b5cecf3acec5", "valid_from": null …
```

### 74. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `country`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'country'"}`  
**Result:** ok, 500 ms

```json
{"count": 1, "rows": [{"id": "bb7c1236-8a1a-538d-9cb5-d51ef1653e94", "kind": "Table", "name": "country"}]}
```

### 75. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `country`  
**Arguments:** `{"id": "bb7c1236-8a1a-538d-9cb5-d51ef1653e94"}`  
**Result:** ok, 14 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:14.290304225Z", "fragment": "CREATE TABLE country", "id": "49621b00-c003-480c-a684-3c476fe4be5f", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:56.391536442Z", "fragment": "COMMENT ON COLUMN country.itu IS The ITU Telecommunication Standardization Sector code for calling internationally. For example, the US is 1, Great Britain is 44", "id": "1e466f4c-c775-45d4-940f-a7b57a99e778", "location": {"column": null, "line": 190, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.833355018Z", "evidence": ["49621b00-c003-480c-a684-3c476fe4be5f", "1e466f4c-c775-45d4-940f-a7b57a99e778"], "id": "bb7c1236-8a1a-538d-9cb5-d51ef1653e94", "kind": "Table", "name": "country", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "name"}, {"data_type": "TEXT", "name": "short_name"}, {"data_type": "TEXT", "description": "The ITU Telecommunication Standardization Sector code for calling internationally. For example, the US is 1, Great Britain is 44", "name": "itu"}]}}, "relationships": [{"created_at": "2026-09-28T14:39:52.829550636Z", "evidence": ["e52fcf59-e831-4782-a75c-dc199154b673"], "from": "3993d440-1c22-52d8-8367-30854bbe7119", "id": "03de8f51-34b5-58f1-a1f5-177743703d00", "kind": "ForeignKey", "properties": {"fk_desc": "entity.country_id → country.id"}, "to": "bb7c1236-8a1a-5 …
```

### 76. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `currency`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'currency'"}`  
**Result:** ok, 463 ms

```json
{"count": 1, "rows": [{"id": "9bcf0658-bb38-5118-9a5c-68d807745540", "kind": "Table", "name": "currency"}]}
```

### 77. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `currency`  
**Arguments:** `{"id": "9bcf0658-bb38-5118-9a5c-68d807745540"}`  
**Result:** ok, 7 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:13.545981795Z", "fragment": "CREATE TABLE currency", "id": "1b5558af-c192-4753-8eec-1257ec210ce6", "location": {"column": null, "line": null, "path": "sql/changes/mc/new-tables.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.456529464Z", "fragment": "COMMENT ON TABLE currency IS This table holds the list of currencies available for posting in the system;\nit mostly serves as the canonical definition of currency codes.", "id": "b9bd907f-b461-443d-8ebe-a7d421524b8a", "location": {"column": null, "line": 7, "path": "sql/changes/mc/new-tables.sql"}}], "object": {"created_at": "2026-09-28T14:39:00.086631133Z", "evidence": ["1b5558af-c192-4753-8eec-1257ec210ce6", "b9bd907f-b461-443d-8ebe-a7d421524b8a"], "id": "9bcf0658-bb38-5118-9a5c-68d807745540", "kind": "Table", "name": "currency", "properties": {"columns": [{"data_type": "CHAR(3)", "name": "curr"}, {"data_type": "TEXT", "name": "description"}], "description": "This table holds the list of currencies available for posting in the system;\nit mostly serves as the canonical definition of currency codes.", "sql_comment": "This table holds the list of currencies available for posting in the system;\nit mostly serves as the canonical definition of currency codes."}}, "relationships": [{"created_at": "2026-09-16T14:59:23.838632881Z", "evidence": ["0f76037d-997f-51d9-9da2-0654671c0713"], "from": "0dc683d2-0579-50c5-bed3-a40f949379ad", "id": "414f75c0-1423-5 …
```

### 78. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `eca_to_location`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'eca_to_location'"}`  
**Result:** ok, 458 ms

```json
{"count": 1, "rows": [{"id": "be13d243-a016-5b14-ba59-545dae283bc3", "kind": "Table", "name": "eca_to_location"}]}
```

### 79. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `eca_to_location`  
**Arguments:** `{"id": "be13d243-a016-5b14-ba59-545dae283bc3"}`  
**Result:** ok, 9 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:05.327246029Z", "fragment": "CREATE TABLE eca_to_location", "id": "0c6c9923-3125-4179-85ce-cd90906453ec", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:54.781874638Z", "fragment": "COMMENT ON TABLE eca_to_location IS This table is used for locations bound to contracts.  For generic contact\naddresses, use entity_to_location instead", "id": "3839507b-c8a2-4f69-a40d-a72087b63542", "location": {"column": null, "line": 597, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.110388505Z", "evidence": ["0c6c9923-3125-4179-85ce-cd90906453ec", "3839507b-c8a2-4f69-a40d-a72087b63542"], "id": "be13d243-a016-5b14-ba59-545dae283bc3", "kind": "Table", "name": "eca_to_location", "properties": {"columns": [{"data_type": "INTEGER", "name": "location_id"}, {"data_type": "INTEGER", "name": "location_class"}, {"data_type": "INTEGER", "name": "credit_id"}], "description": "This table is used for locations bound to contracts.  For generic contact\naddresses, use entity_to_location instead", "sql_comment": "This table is used for locations bound to contracts.  For generic contact\naddresses, use entity_to_location instead"}}, "relationships": [{"created_at": "2026-09-28T14:39:53.222215717Z", "evidence": ["c03e3eb4-0624-4e52-9a43-98f0e86e1da6"], "from": "be13d243-a016-5b14-ba59-545dae283bc3", "id": "2719fc74-00ed-5640-9744-c63 …
```

### 80. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `entity`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'entity'"}`  
**Result:** ok, 469 ms

```json
{"count": 1, "rows": [{"id": "3993d440-1c22-52d8-8367-30854bbe7119", "kind": "Table", "name": "entity"}]}
```

### 81. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `entity`  
**Arguments:** `{"id": "3993d440-1c22-52d8-8367-30854bbe7119"}`  
**Result:** ok, 45 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:02.267832258Z", "fragment": "CREATE TABLE entity", "id": "5c851e6d-bda6-41a6-8d14-66911cf88fdc", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:03.604420869Z", "fragment": "COMMENT ON TABLE entity IS The primary entity table to map to all contacts", "id": "4e4985f9-206c-4b2f-844a-871f88d0d2b1", "location": {"column": null, "line": 230, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:13.718224073Z", "fragment": "COMMENT ON COLUMN entity.name IS This is the common name of an entity. If it was a person it may be Joshua Drake, a company Acme Corp. You may also choose to use a domain such as commandprompt.com", "id": "5a8ceacd-4d5f-4e27-bfe7-b8e88239d301", "location": {"column": null, "line": 231, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.273744366Z", "fragment": "COMMENT ON TABLE entity IS The primary entity table to map to all contacts", "id": "e2cd50d7-4acd-4c5a-af06-8b2c7f12f841", "location": {"column": null, "line": 559, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.862471118Z", "evidence": ["5c851e6d-bda6-41a6-8d14-66911cf88fdc", "4e4985f9-206c-4b2f-844a-871f88d0d2b1", "5a8ceacd-4d5f-4e27-bfe7-b8e88239d301", "e2cd50d7-4acd-4c5a-af06-8b2c7f12f841"], "id": "3993d440-1c22-52d8-8367-30854bbe7119", "kind": "Table", "name …
```

### 82. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `entity_class`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'entity_class'"}`  
**Result:** ok, 469 ms

```json
{"count": 1, "rows": [{"id": "9a74248d-a8ff-5ba5-ae20-fd280d091bfc", "kind": "Table", "name": "entity_class"}]}
```

### 83. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `entity_class`  
**Arguments:** `{"id": "9a74248d-a8ff-5ba5-ae20-fd280d091bfc"}`  
**Result:** ok, 10 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:06.831680180Z", "fragment": "CREATE TABLE entity_class", "id": "4dd721b2-9e7b-4e78-95ba-3b1f0dd43f30", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:53.860772223Z", "fragment": "COMMENT ON TABLE entity_class IS Defines the class type such as vendor, customer, contact, employee", "id": "05143514-bf8c-429a-863b-6c9ee025241c", "location": {"column": null, "line": 214, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:12.464091797Z", "fragment": "COMMENT ON COLUMN entity_class.id IS The first 7 values are reserved and\npermanent.  Individuals who create new classes, however, should coordinate\nwith others for ranges to use.", "id": "41c88040-f4c1-4f25-a78c-85068a09af05", "location": {"column": null, "line": 215, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.851703971Z", "evidence": ["4dd721b2-9e7b-4e78-95ba-3b1f0dd43f30", "05143514-bf8c-429a-863b-6c9ee025241c", "41c88040-f4c1-4f25-a78c-85068a09af05"], "id": "9a74248d-a8ff-5ba5-ae20-fd280d091bfc", "kind": "Table", "name": "entity_class", "properties": {"columns": [{"data_type": "serial", "description": "The first 7 values are reserved and\npermanent.  Individuals who create new classes, however, should coordinate\nwith others for ranges to use.", "name": "id"}, {"data_type": "TEXT", "name": "class"}, {"data_type": "BO …
```

### 84. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `entity_credit_account`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'entity_credit_account'"}`  
**Result:** ok, 444 ms

```json
{"count": 1, "rows": [{"id": "dd5393ba-4a3d-54cb-a816-be338e0cc992", "kind": "Table", "name": "entity_credit_account"}]}
```

### 85. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `entity_credit_account`  
**Arguments:** `{"id": "dd5393ba-4a3d-54cb-a816-be338e0cc992"}`  
**Result:** ok, 26 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:16.607633312Z", "fragment": "CREATE TABLE entity_credit_account", "id": "3d6c370b-c39c-4980-b463-a18bbcfbb4b4", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.507475761Z", "fragment": "COMMENT ON TABLE entity_credit_account IS This table stores information relating to general relationships regarding\nmoneys owed on invoice.  Invoices, whether AR or AP, must be attached to\na record in this table.", "id": "5f5cebc4-5a6a-4eed-b65d-ac7af5bcfd5e", "location": {"column": null, "line": 560, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:17.063500019Z", "fragment": "COMMENT ON COLUMN entity_credit_account.meta_number IS This stores the human readable control code for the customer/vendor record.\nThis is typically called the customer/vendor \"account\" in the application.", "id": "a87dc35d-31db-458c-a07f-300dd503ce0e", "location": {"column": null, "line": 565, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.080923476Z", "evidence": ["3d6c370b-c39c-4980-b463-a18bbcfbb4b4", "5f5cebc4-5a6a-4eed-b65d-ac7af5bcfd5e", "a87dc35d-31db-458c-a07f-300dd503ce0e"], "id": "dd5393ba-4a3d-54cb-a816-be338e0cc992", "kind": "Table", "name": "entity_credit_account", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "INT", "name": "entity_id"}, {"data_type": " …
```

### 86. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `gl`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'gl'"}`  
**Result:** ok, 495 ms

```json
{"count": 1, "rows": [{"id": "411f9c4b-8946-54f1-8783-0b6c3adfcee7", "kind": "Table", "name": "gl"}]}
```

### 87. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `gl`  
**Arguments:** `{"id": "411f9c4b-8946-54f1-8783-0b6c3adfcee7"}`  
**Result:** ok, 11 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:56.720187449Z", "fragment": "CREATE TABLE gl", "id": "22e50473-40bb-473e-a864-ae50bd3be7b6", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:54.869622700Z", "fragment": "COMMENT ON TABLE gl IS This table holds summary information for entries in the general journal.\nDoes not hold summary information in 1.3 for AR or AP entries.", "id": "eec4d760-3787-4f2f-92da-e008f6f6f680", "location": {"column": null, "line": 991, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:02.853381365Z", "fragment": "COMMENT ON COLUMN gl.person_id IS the person_id of the employee who created\nthe entry.", "id": "2dbfe517-e828-47b5-aa22-146e06b687f8", "location": {"column": null, "line": 995, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.444194500Z", "evidence": ["22e50473-40bb-473e-a864-ae50bd3be7b6", "eec4d760-3787-4f2f-92da-e008f6f6f680", "2dbfe517-e828-47b5-aa22-146e06b687f8"], "id": "411f9c4b-8946-54f1-8783-0b6c3adfcee7", "kind": "Table", "name": "gl", "properties": {"columns": [{"data_type": "INT", "name": "id"}, {"data_type": "TEXT", "name": "reference"}, {"data_type": "TEXT", "name": "description"}, {"data_type": "DATE", "name": "transdate"}, {"data_type": "INTEGER", "description": "the person_id of the employee who created\nthe entry.", "name": "person_id"}, {"data_type": "TEXT",  …
```

### 88. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `inventory_report`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'inventory_report'"}`  
**Result:** ok, 456 ms

```json
{"count": 1, "rows": [{"id": "6b9e7416-2185-5be6-86c8-783c3aee5207", "kind": "Table", "name": "inventory_report"}]}
```

### 89. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `inventory_report`  
**Arguments:** `{"id": "6b9e7416-2185-5be6-86c8-783c3aee5207"}`  
**Result:** ok, 7 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:16.399998263Z", "fragment": "CREATE TABLE inventory_report", "id": "fe528846-51cf-4087-9778-7790a5e6cccc", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.630904851Z", "evidence": ["fe528846-51cf-4087-9778-7790a5e6cccc"], "id": "6b9e7416-2185-5be6-86c8-783c3aee5207", "kind": "Table", "name": "inventory_report", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "DATE", "name": "transdate"}, {"data_type": "TEXT", "name": "source"}, {"data_type": "INT", "name": "ar_trans_id"}, {"data_type": "INT", "name": "ap_trans_id"}]}}, "relationships": [{"created_at": "2026-09-16T14:59:23.838880958Z", "evidence": ["f5e7e8b9-9b8e-5cc0-a38b-4b9dd138d86a"], "from": "f9909e05-f2e1-5e65-982f-ecce68ba1eb7", "id": "6d604d09-ccbc-55c5-a162-16ee277d6604", "kind": "ReadsFrom", "properties": {}, "to": "6b9e7416-2185-5be6-86c8-783c3aee5207", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.838430899Z", "evidence": ["7a1b6426-2dbe-5d90-9f03-78f55d32e58a"], "from": "6f642978-3e19-5182-af1f-b15ff1274232", "id": "96e665e5-38f5-5279-bba9-1c62b37476c2", "kind": "ReadsFrom", "properties": {}, "to": "6b9e7416-2185-5be6-86c8-783c3aee5207", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.839576440Z", "evidence": ["8cc02ec4-21e5-5907-b3b4-b7d59c38758b"], "from": "a6869a5e-5717-5a7d-90c8- …
```

### 90. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `inventory_report_line`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'inventory_report_line'"}`  
**Result:** ok, 464 ms

```json
{"count": 1, "rows": [{"id": "0f8e2bad-af2f-5d34-921c-14e60709a98b", "kind": "Table", "name": "inventory_report_line"}]}
```

### 91. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `inventory_report_line`  
**Arguments:** `{"id": "0f8e2bad-af2f-5d34-921c-14e60709a98b"}`  
**Result:** ok, 10 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:04.616208076Z", "fragment": "CREATE TABLE inventory_report_line", "id": "ae72de2d-f711-4189-ba94-fbd1152ec16e", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.648577945Z", "evidence": ["ae72de2d-f711-4189-ba94-fbd1152ec16e"], "id": "0f8e2bad-af2f-5d34-921c-14e60709a98b", "kind": "Table", "name": "inventory_report_line", "properties": {"columns": [{"data_type": "INT", "name": "adjust_id"}, {"data_type": "INT", "name": "parts_id"}, {"data_type": "NUMERIC", "name": "counted"}, {"data_type": "NUMERIC", "name": "expected"}, {"data_type": "NUMERIC", "name": "variance"}]}}, "relationships": [{"created_at": "2026-09-28T14:39:54.081192994Z", "evidence": ["8c4b3513-fc60-4e46-b8bf-f1f4e3a685f5"], "from": "0f8e2bad-af2f-5d34-921c-14e60709a98b", "id": "63acbbec-841d-5a3b-a075-a08da5f3f657", "kind": "ForeignKey", "properties": {"fk_desc": "inventory_report_line.parts_id → parts.id"}, "to": "13575f92-6f74-5533-8a33-04ceabd3b710", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.838036434Z", "evidence": ["16dd4120-05e7-52ae-a8bc-8cf211309b2e"], "from": "478d75e3-12ec-507a-b90b-d0f04c793424", "id": "9fab1efa-9a77-5cd4-bb0a-a9897790552f", "kind": "ReadsFrom", "properties": {}, "to": "0f8e2bad-af2f-5d34-921c-14e60709a98b", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:39:54.073979811Z", "evidence": [" …
```

### 92. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `invoice`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'invoice'"}`  
**Result:** ok, 442 ms

```json
{"count": 1, "rows": [{"id": "007811f7-d983-545d-9927-998a016f81da", "kind": "Table", "name": "invoice"}]}
```

### 93. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `invoice`  
**Arguments:** `{"id": "007811f7-d983-545d-9927-998a016f81da"}`  
**Result:** ok, 11 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:10.287927477Z", "fragment": "CREATE TABLE invoice", "id": "55e8d31e-b7a0-43b0-8c4d-68f8f5eab0e5", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:14.875694948Z", "fragment": "COMMENT ON TABLE invoice IS Line items of invoices with goods/services attached.", "id": "e4b7a9cb-c277-439f-ae07-e95d4a483d0d", "location": {"column": null, "line": 1264, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:11.714116803Z", "fragment": "COMMENT ON COLUMN invoice.allocated IS Number of allocated items, negative relative to qty.\nWhen qty + allocated = 0, then the item is fully used for purposes of COGS\ncalculations.", "id": "9fbe2725-5e47-4db2-bc0a-925bf40d9a73", "location": {"column": null, "line": 1267, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:06.013662549Z", "fragment": "COMMENT ON COLUMN invoice.qty IS Positive is normal for sales invoices, negative for vendor invoices.", "id": "71a975b1-def0-4221-9cf4-9ad7af2a36b3", "location": {"column": null, "line": 1272, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.562350256Z", "evidence": ["55e8d31e-b7a0-43b0-8c4d-68f8f5eab0e5", "e4b7a9cb-c277-439f-ae07-e95d4a483d0d", "9fbe2725-5e47-4db2-bc0a-925bf40d9a73", "71a975b1-def0-4221-9cf4-9ad7af2a36b3"], "id": "007811f7-d983-545d-9927-998a016f81da", …
```

### 94. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `location`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'location'"}`  
**Result:** ok, 426 ms

```json
{"count": 1, "rows": [{"id": "4bd59c1f-3554-5637-8606-52cdb89bac7d", "kind": "Table", "name": "location"}]}
```

### 95. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `location`  
**Arguments:** `{"id": "4bd59c1f-3554-5637-8606-52cdb89bac7d"}`  
**Result:** ok, 12 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:07.136881077Z", "fragment": "CREATE TABLE location", "id": "e8c069a4-a94e-43b3-8225-c4aa8d50b8bd", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:05.502933454Z", "fragment": "COMMENT ON TABLE location IS This table stores addresses, such as shipto and bill to addresses.", "id": "114d6fe4-b607-4193-acbb-6ed378f12066", "location": {"column": null, "line": 399, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.962474595Z", "evidence": ["e8c069a4-a94e-43b3-8225-c4aa8d50b8bd", "114d6fe4-b607-4193-acbb-6ed378f12066"], "id": "4bd59c1f-3554-5637-8606-52cdb89bac7d", "kind": "Table", "name": "location", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "line_one"}, {"data_type": "TEXT", "name": "line_two"}, {"data_type": "TEXT", "name": "line_three"}, {"data_type": "TEXT", "name": "city"}, {"data_type": "TEXT", "name": "state"}, {"data_type": "INTEGER", "name": "country_id"}, {"data_type": "TEXT", "name": "mail_code"}, {"data_type": "DATE", "name": "created"}, {"data_type": "TIMESTAMP", "name": "inactive_date"}, {"data_type": "BOOLEAN", "name": "active"}], "description": "This table stores addresses, such as shipto and bill to addresses.", "sql_comment": "This table stores addresses, such as shipto and bill to addresses."}}, "relationships": [{"created_at": "2026-09- …
```

### 96. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `oe`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'oe'"}`  
**Result:** ok, 502 ms

```json
{"count": 1, "rows": [{"id": "d1b46d64-5445-5e88-ae13-d18e0e8fbb23", "kind": "Table", "name": "oe"}]}
```

### 97. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `oe`  
**Arguments:** `{"id": "d1b46d64-5445-5e88-ae13-d18e0e8fbb23"}`  
**Result:** ok, 19 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:14.923657131Z", "fragment": "CREATE TABLE oe", "id": "9d002a7c-9581-43e2-9c49-b12a5ca4ca80", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.151513715Z", "fragment": "COMMENT ON TABLE oe IS Header information for:\n* Sales orders\n* Purchase Orders\n* Quotations\n* Requests for Quotation", "id": "1520f399-106f-454a-8e78-103a80d912b0", "location": {"column": null, "line": 1614, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.710050521Z", "evidence": ["9d002a7c-9581-43e2-9c49-b12a5ca4ca80", "1520f399-106f-454a-8e78-103a80d912b0"], "id": "d1b46d64-5445-5e88-ae13-d18e0e8fbb23", "kind": "Table", "name": "oe", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "ordnumber"}, {"data_type": "DATE", "name": "transdate"}, {"data_type": "INTEGER", "name": "entity_id"}, {"data_type": "NUMERIC", "name": "amount"}, {"data_type": "NUMERIC", "name": "netamount"}, {"data_type": "DATE", "name": "reqdate"}, {"data_type": "BOOL", "name": "taxincluded"}, {"data_type": "TEXT", "name": "shippingpoint"}, {"data_type": "TEXT", "name": "notes"}, {"data_type": "CHAR(3)", "name": "curr"}, {"data_type": "INTEGER", "name": "person_id"}, {"data_type": "BOOL", "name": "closed"}, {"data_type": "BOOL", "name": "quotation"}, {"data_type": "TEXT", "name": "quonumber"}, {"data_type": "TEXT", …
```

### 98. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `oe_class`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'oe_class'"}`  
**Result:** ok, 470 ms

```json
{"count": 1, "rows": [{"id": "ee5ad1c8-a825-5255-a204-aa9e74be7ed6", "kind": "Table", "name": "oe_class"}]}
```

### 99. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `oe_class`  
**Arguments:** `{"id": "ee5ad1c8-a825-5255-a204-aa9e74be7ed6"}`  
**Result:** ok, 6 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:05.306681071Z", "fragment": "CREATE TABLE oe_class", "id": "7d195ee5-d040-427d-89c5-74c7425ebd96", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:00.636558894Z", "fragment": "COMMENT ON TABLE oe_class IS Hardwired classifications for orders and quotations.\nCoordinate before adding.", "id": "95e861e3-b61e-4f1b-ae46-54e8256f3a75", "location": {"column": null, "line": 1585, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.699381572Z", "evidence": ["7d195ee5-d040-427d-89c5-74c7425ebd96", "95e861e3-b61e-4f1b-ae46-54e8256f3a75"], "id": "ee5ad1c8-a825-5255-a204-aa9e74be7ed6", "kind": "Table", "name": "oe_class", "properties": {"columns": [{"data_type": "SMALLINT", "name": "id"}, {"data_type": "TEXT", "name": "oe_class"}], "description": "Hardwired classifications for orders and quotations.\nCoordinate before adding.", "sql_comment": "Hardwired classifications for orders and quotations.\nCoordinate before adding."}}, "relationships": [{"created_at": "2026-09-16T14:59:23.839077143Z", "evidence": ["062ae994-abdb-56f7-b9e2-f430e4406ce2"], "from": "7bc096c6-f0ca-5b18-93d7-21a610c71769", "id": "8fdb48e9-989b-5f80-bf21-9eef77ee6115", "kind": "ReadsFrom", "properties": {}, "to": "ee5ad1c8-a825-5255-a204-aa9e74be7ed6", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:39:54.220069269Z", "eviden …
```

### 100. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `open_item`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'open_item'"}`  
**Result:** ok, 471 ms

```json
{"count": 1, "rows": [{"id": "4050340b-d85d-5da8-960c-74d76fc458a6", "kind": "Table", "name": "open_item"}]}
```

### 101. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `open_item`  
**Arguments:** `{"id": "4050340b-d85d-5da8-960c-74d76fc458a6"}`  
**Result:** ok, 11 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:10.243642391Z", "fragment": "CREATE TABLE open_item", "id": "710bee82-0a22-4381-ba3f-6b87873220a7", "location": {"column": null, "line": null, "path": "sql/changes/1.14/open-item-tracking.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:56.524492477Z", "fragment": "COMMENT ON TABLE open_item IS Allows tracking of items to be cleared/handled in subsequent transactions.", "id": "9e1412c7-8c41-452d-adb0-fd0a62096f5f", "location": {"column": null, "line": 93, "path": "sql/changes/1.14/open-item-tracking.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.073688618Z", "fragment": "COMMENT ON COLUMN open_item.id IS Internal identifier for the open item.", "id": "4c822d38-09ed-47dd-8765-9154bd13f6f6", "location": {"column": null, "line": 96, "path": "sql/changes/1.14/open-item-tracking.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:08.713944458Z", "fragment": "COMMENT ON COLUMN open_item.item_number IS Identifier as presented in the user interface.", "id": "be611c6e-4fd7-47dc-802b-1ca006aac3e1", "location": {"column": null, "line": 98, "path": "sql/changes/1.14/open-item-tracking.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:13.359453678Z", "fragment": "COMMENT ON COLUMN open_item.item_type IS Type of open item; currently 'gl','ar' or 'ap'.", "id": "f7bb2ab8-8608-4988-a205-ed800481a7b9", "location": {"column": null, "line": 100, "path": "sql/changes/1.14/open-item-track …
```

### 102. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `orderitems`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'orderitems'"}`  
**Result:** ok, 437 ms

```json
{"count": 1, "rows": [{"id": "cd6546c8-7658-5a84-ab3a-1f557f383cd2", "kind": "Table", "name": "orderitems"}]}
```

### 103. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `orderitems`  
**Arguments:** `{"id": "cd6546c8-7658-5a84-ab3a-1f557f383cd2"}`  
**Result:** ok, 7 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:05.652626008Z", "fragment": "CREATE TABLE orderitems", "id": "adcdc443-a64b-4351-b04b-a7ba035b536a", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.930779863Z", "fragment": "COMMENT ON TABLE orderitems IS Line items for sales/purchase orders and quotations.", "id": "3c007468-7d96-4d1c-87fb-e0835622e4bb", "location": {"column": null, "line": 1637, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.721288610Z", "evidence": ["adcdc443-a64b-4351-b04b-a7ba035b536a", "3c007468-7d96-4d1c-87fb-e0835622e4bb"], "id": "cd6546c8-7658-5a84-ab3a-1f557f383cd2", "kind": "Table", "name": "orderitems", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "INT", "name": "trans_id"}, {"data_type": "INT", "name": "parts_id"}, {"data_type": "TEXT", "name": "description"}, {"data_type": "NUMERIC", "name": "qty"}, {"data_type": "NUMERIC", "name": "sellprice"}, {"data_type": "INT", "name": "precision"}, {"data_type": "NUMERIC", "name": "discount"}, {"data_type": "VARCHAR(5)", "name": "unit"}, {"data_type": "DATE", "name": "reqdate"}, {"data_type": "NUMERIC", "name": "ship"}, {"data_type": "TEXT", "name": "serialnumber"}, {"data_type": "TEXT", "name": "notes"}], "description": "Line items for sales/purchase orders and quotations.", "sql_comment": "Line items for sales/purchase orders and quotations. …
```

### 104. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `parts`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'parts'"}`  
**Result:** ok, 433 ms

```json
{"count": 1, "rows": [{"id": "13575f92-6f74-5533-8a33-04ceabd3b710", "kind": "Table", "name": "parts"}]}
```

### 105. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `parts`  
**Arguments:** `{"id": "13575f92-6f74-5533-8a33-04ceabd3b710"}`  
**Result:** ok, 31 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:58.210491963Z", "fragment": "CREATE TABLE parts", "id": "a2332429-4a27-4cf6-b3b5-cc148b8e9562", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:59.758154187Z", "fragment": "COMMENT ON TABLE parts IS This stores detail information about goods and services.  The type of part\nis currently defined according to the following rules:\n* If assembly is true, then an assembly\n* If inventory_accno_id, income_accno_id, and expense_accno_id are not null then\n  a part.\n* If inventory_accno_id is null but the other two are not, then a service.\n* Otherwise, a labor/overhead entry.", "id": "b44c7fc0-1beb-49d1-8a11-1ba36e6977e1", "location": {"column": null, "line": 1195, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.797982446Z", "fragment": "COMMENT ON COLUMN parts.rop IS Re-order point.  Used to select parts for short inventory report.", "id": "96ee23a5-a002-4bd3-893a-93ffe0cb8691", "location": {"column": null, "line": 1205, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:15.986640429Z", "fragment": "COMMENT ON COLUMN parts.bin IS Text identifier for where a part is stored.", "id": "7e097481-3f74-4b2f-b2a5-d98ca4795070", "location": {"column": null, "line": 1208, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:16.071517373Z", "f …
```

### 106. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `partsgroup`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'partsgroup'"}`  
**Result:** ok, 432 ms

```json
{"count": 1, "rows": [{"id": "1feb9c21-7673-59d0-9266-ba8cf1c065ab", "kind": "Table", "name": "partsgroup"}]}
```

### 107. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `partsgroup`  
**Arguments:** `{"id": "1feb9c21-7673-59d0-9266-ba8cf1c065ab"}`  
**Result:** ok, 9 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:08.103866099Z", "fragment": "CREATE TABLE partsgroup", "id": "8b161ff4-b534-4223-8477-2d346e166d2c", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:08.371432587Z", "fragment": "COMMENT ON TABLE partsgroup IS Groups of parts for Point of Sale screen.", "id": "249043af-7b68-4f73-a6a3-a4e91fe8f1ef", "location": {"column": null, "line": 1803, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.877391182Z", "evidence": ["8b161ff4-b534-4223-8477-2d346e166d2c", "249043af-7b68-4f73-a6a3-a4e91fe8f1ef"], "id": "1feb9c21-7673-59d0-9266-ba8cf1c065ab", "kind": "Table", "name": "partsgroup", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "partsgroup"}, {"data_type": "INT", "name": "parent"}], "description": "Groups of parts for Point of Sale screen.", "sql_comment": "Groups of parts for Point of Sale screen."}}, "relationships": [{"created_at": "2026-09-16T14:59:23.839744968Z", "evidence": ["226187f4-0a33-5028-b2a0-edbb695e4a38"], "from": "2412ef55-d1f2-50be-9a60-b6a17caec760", "id": "1976c3d6-8fc8-5b4d-a67f-af72cd50cc47", "kind": "ReadsFrom", "properties": {}, "to": "1feb9c21-7673-59d0-9266-ba8cf1c065ab", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.838853370Z", "evidence": ["e76295cd-ff2c-566f-a85b-ab36d57d5635"], "from": "095d2cd5-623 …
```

### 108. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `partstax`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'partstax'"}`  
**Result:** ok, 440 ms

```json
{"count": 1, "rows": [{"id": "2ea7f176-56d7-5564-831c-2bb5449d91d4", "kind": "Table", "name": "partstax"}]}
```

### 109. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `partstax`  
**Arguments:** `{"id": "2ea7f176-56d7-5564-831c-2bb5449d91d4"}`  
**Result:** ok, 7 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:14.551146428Z", "fragment": "CREATE TABLE partstax", "id": "b6d02f38-9460-458b-8844-3985c7e09a2e", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.317725090Z", "fragment": "COMMENT ON TABLE partstax IS Mapping of parts to taxes.", "id": "b71f19b3-6247-4545-8b58-bc673a08ccac", "location": {"column": null, "line": 1538, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.674916091Z", "evidence": ["b6d02f38-9460-458b-8844-3985c7e09a2e", "b71f19b3-6247-4545-8b58-bc673a08ccac"], "id": "2ea7f176-56d7-5564-831c-2bb5449d91d4", "kind": "Table", "name": "partstax", "properties": {"columns": [{"data_type": "INT", "name": "parts_id"}, {"data_type": "INT", "name": "chart_id"}, {"data_type": "INT", "name": "taxcategory_id"}], "description": "Mapping of parts to taxes.", "sql_comment": "Mapping of parts to taxes."}}, "relationships": [{"created_at": "2026-09-28T14:39:54.096064950Z", "evidence": ["162bfc25-ca81-454e-bd61-f4467ba91715"], "from": "2ea7f176-56d7-5564-831c-2bb5449d91d4", "id": "527c92bf-114e-5ce0-a713-5359d7b6688d", "kind": "ForeignKey", "properties": {"fk_desc": "partstax.parts_id → parts.id"}, "to": "13575f92-6f74-5533-8a33-04ceabd3b710", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:39:54.103943794Z", "evidence": ["7037b26f-7ccb-45ed-835b-e06698340d89"], "from": "2ea7f176-56d7 …
```

### 110. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `payment`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'payment'"}`  
**Result:** ok, 424 ms

```json
{"count": 1, "rows": [{"id": "c600e4f4-f88b-5d21-94ac-7d918d48dcf3", "kind": "Table", "name": "payment"}]}
```

### 111. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `payment`  
**Arguments:** `{"id": "c600e4f4-f88b-5d21-94ac-7d918d48dcf3"}`  
**Result:** ok, 11 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:12.343506048Z", "fragment": "CREATE TABLE payment", "id": "cbac2b83-c419-4fe7-ab7e-17bdb7ff463a", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.929682239Z", "fragment": "COMMENT ON TABLE payment IS This table will store the main data on a payment, prepayment, overpayment, et", "id": "ae6aeb42-84de-47ce-a828-ee0090b785b3", "location": {"column": null, "line": 3417, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:05.535891194Z", "fragment": "COMMENT ON COLUMN payment.reference IS This field will store the code for both receipts and payment order", "id": "cd400e8f-8e91-481a-910f-ee3dbc59644c", "location": {"column": null, "line": 3418, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:13.618236318Z", "fragment": "COMMENT ON COLUMN payment.closed IS This will store the current state of a payment/receipt order", "id": "b15ee1fa-ecb6-42e3-9e89-06e18ad48ca6", "location": {"column": null, "line": 3419, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:05.812947211Z", "fragment": "COMMENT ON COLUMN payment.gl_id IS A payment should always be linked to a GL movement", "id": "c78f5705-9edd-4d86-b9b6-941ac9c5ae1f", "location": {"column": null, "line": 3420, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:4 …
```

### 112. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `tax`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'tax'"}`  
**Result:** ok, 430 ms

```json
{"count": 1, "rows": [{"id": "1ae6e156-42d7-5a40-abda-6c86b441ef29", "kind": "Table", "name": "tax"}]}
```

### 113. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `tax`  
**Arguments:** `{"id": "1ae6e156-42d7-5a40-abda-6c86b441ef29"}`  
**Result:** ok, 7 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:57.409108268Z", "fragment": "CREATE TABLE tax", "id": "1a1444e5-0e28-4ded-bcb6-d61ff9632956", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:56.921494202Z", "fragment": "COMMENT ON TABLE tax IS Information on tax rates.", "id": "afb65bc6-d20d-438e-b1cf-858e0df5f588", "location": {"column": null, "line": 1554, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:14.210512944Z", "fragment": "COMMENT ON COLUMN tax.pass IS This is an integer indicating the pass of the tax. This is to support\ncumultative sales tax rules (for example, Quebec charging taxes on the federal\ntaxes collected).", "id": "6eed3f9c-5003-454f-9219-7b2cb006007d", "location": {"column": null, "line": 1557, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.682271122Z", "evidence": ["1a1444e5-0e28-4ded-bcb6-d61ff9632956", "afb65bc6-d20d-438e-b1cf-858e0df5f588", "6eed3f9c-5003-454f-9219-7b2cb006007d"], "id": "1ae6e156-42d7-5a40-abda-6c86b441ef29", "kind": "Table", "name": "tax", "properties": {"columns": [{"data_type": "INT", "name": "chart_id"}, {"data_type": "NUMERIC", "name": "rate"}, {"data_type": "NUMERIC", "name": "minvalue"}, {"data_type": "NUMERIC", "name": "maxvalue"}, {"data_type": "TEXT", "name": "taxnumber"}, {"data_type": "TIMESTAMP", "name": "validto"}, {"data_type": "INTEGER", "description": …
```

### 114. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `trans_type`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'trans_type'"}`  
**Result:** ok, 438 ms

```json
{"count": 1, "rows": [{"id": "0d3c2be1-0fce-5594-bc86-61952763202b", "kind": "Table", "name": "trans_type"}]}
```

### 115. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `trans_type`  
**Arguments:** `{"id": "0d3c2be1-0fce-5594-bc86-61952763202b"}`  
**Result:** ok, 6 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:13.408017267Z", "fragment": "CREATE TABLE trans_type", "id": "6bd3adc8-d7b4-4768-b765-434f3f560536", "location": {"column": null, "line": null, "path": "sql/changes/1.6/gl-trans-type.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:11.418074384Z", "fragment": "COMMENT ON TABLE trans_type IS Documents the transaction type codes used in the 'gl' table.\n\nPlease note that the codes in this table are hard-coded into other\n(SQL) parts of the application. As such, this table merely serves\nas documentation; do *not* modify its content other than inserting\nnew codes.", "id": "e468b5ec-cfed-49f2-ba52-3ab3ff359b08", "location": {"column": null, "line": 7, "path": "sql/changes/1.6/gl-trans-type.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:07.471039671Z", "fragment": "COMMENT ON COLUMN trans_type.code IS Code of the transaction type. The 72 alphanumeric codes starting\nwith 'x' or 'X' are reserved for custom internal extensions.\n\nFor extensions distributed for wide(r) use, please request a code\nfrom the LedgerSMB development team.", "id": "a7881b28-0d15-4ed0-8514-98308ab8343a", "location": {"column": null, "line": 15, "path": "sql/changes/1.6/gl-trans-type.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:07.420955838Z", "fragment": "COMMENT ON COLUMN trans_type.description IS This column contains the full documentation as to the origin\nand purpose of the transaction type.", "id" …
```

### 116. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `transactions`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'transactions'"}`  
**Result:** ok, 428 ms

```json
{"count": 1, "rows": [{"id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38", "kind": "Table", "name": "transactions"}]}
```

### 117. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `transactions`  
**Arguments:** `{"id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38"}`  
**Result:** ok, 19 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:12.691082215Z", "fragment": "CREATE TABLE transactions", "id": "971e753e-1515-4cd4-b0cb-9e45ba93bfef", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:12.686200978Z", "fragment": "COMMENT ON TABLE transactions IS This table provides referential integrity between AR, AP, GL tables on one\nhand and acc_trans on the other, pending the refactoring of those tables.  It\nalso is used to provide discretionary locking of financial transactions across\ndatabase connections, for example in batch payment workflows.", "id": "7caa0c59-3c1e-440b-852b-9e02132a0ef3", "location": {"column": null, "line": 308, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.189559073Z", "fragment": "COMMENT ON COLUMN transactions.locked_by IS This should only be used in pessimistic locking measures as required by large\nbatch work flows.", "id": "58d32d2d-3afe-44f1-9201-eea476bc1d20", "location": {"column": null, "line": 338, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.908817167Z", "evidence": ["971e753e-1515-4cd4-b0cb-9e45ba93bfef", "7caa0c59-3c1e-440b-852b-9e02132a0ef3", "58d32d2d-3afe-44f1-9201-eea476bc1d20"], "id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38", "kind": "Table", "name": "transactions", "properties": {"columns": [{"data_type": "INT", "name": "id"}, {"data_type": "TEXT", "name": "t …
```

### 118. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `warehouse`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'warehouse'"}`  
**Result:** ok, 444 ms

```json
{"count": 1, "rows": [{"id": "cb63feeb-3d78-5175-8948-db542ce600da", "kind": "Table", "name": "warehouse"}]}
```

### 119. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `warehouse`  
**Arguments:** `{"id": "cb63feeb-3d78-5175-8948-db542ce600da"}`  
**Result:** ok, 8 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:54.676679631Z", "fragment": "CREATE TABLE warehouse", "id": "f355a0d8-1bc2-4fde-9fff-c1afc4d94cb7", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.926357622Z", "evidence": ["f355a0d8-1bc2-4fde-9fff-c1afc4d94cb7"], "id": "cb63feeb-3d78-5175-8948-db542ce600da", "kind": "Table", "name": "warehouse", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "description"}]}}, "relationships": [{"created_at": "2026-09-28T14:39:54.792958459Z", "evidence": ["cfda4423-8e80-4f06-ae34-6cda8dfefbce"], "from": "6e2475a2-326b-529e-99dc-1eb7474eccbc", "id": "13a02980-74ea-5af7-8498-143387ee4e97", "kind": "ForeignKey", "properties": {"fk_desc": "asset_item.location_id → warehouse.id"}, "to": "cb63feeb-3d78-5175-8948-db542ce600da", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.839987458Z", "evidence": ["7409a82f-bf5e-591e-85fa-54d47c935330"], "from": "49312b51-74ab-5d74-b7dd-7fbf88d57aa2", "id": "7e01f7e3-49ab-586f-9c7f-0c7193c7070b", "kind": "ReadsFrom", "properties": {}, "to": "cb63feeb-3d78-5175-8948-db542ce600da", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.840177497Z", "evidence": ["1591db61-4f66-54a5-9efb-9dd5d48df2f2"], "from": "465692b3-daca-5e4b-a4d5-8d046f435b7d", "id": "8ce0a240-c520-5e32-901e-0d51689a36e7", "kind": "ReadsFrom", "propertie …
```

### 120. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `acc_trans`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'acc_trans'"}`  
**Result:** ok, 820 ms

```json
{"count": 1, "rows": [{"id": "c74280fe-7b9a-5c74-b97c-afcc35f7f318", "kind": "Table", "name": "acc_trans"}]}
```

### 121. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `acc_trans`  
**Arguments:** `{"id": "c74280fe-7b9a-5c74-b97c-afcc35f7f318"}`  
**Result:** ok, 5 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:53.874571127Z", "fragment": "CREATE TABLE acc_trans", "id": "d8bfc9e6-52b0-44ac-9fd6-1ca27ef229dd", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:03.787189683Z", "fragment": "COMMENT ON TABLE acc_trans IS This table stores line items for financial transactions.  Please note that\npayments in 1.3 are not full-fledged transactions.", "id": "1d395fba-3b15-48fd-9442-23911b9e65e6", "location": {"column": null, "line": 1142, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.758000537Z", "fragment": "COMMENT ON COLUMN acc_trans.source IS Document Source identifier for individual line items, usually used\nfor payments.", "id": "6654131a-eeae-4b30-9c34-8b5acbc14412", "location": {"column": null, "line": 1146, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:00.930183454Z", "fragment": "COMMENT ON COLUMN acc_trans.fx_transaction IS When 'f', indicates that the amount column states the amount in the currency\nas specified in the associated ar, ap, payment or gl record.\n\nWhen 't', indicates that the amount column states the difference between\nthe foreighn currency amount and the base amount so that their sum equals the\nbase amount.", "id": "91dc78f4-32c7-461a-abf7-481e008b94a9", "location": {"column": null, "line": 1150, "path": "sql/Pg-database.sql"}}], "object": { …
```

### 122. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `account`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'account'"}`  
**Result:** ok, 595 ms

```json
{"count": 1, "rows": [{"id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa", "kind": "Table", "name": "account"}]}
```

### 123. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `account`  
**Arguments:** `{"id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa"}`  
**Result:** ok, 9 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:17.843615978Z", "fragment": "CREATE TABLE account", "id": "901296b9-bd47-4976-981a-a0d92e7bfbda", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.580145553Z", "fragment": "COMMENT ON COLUMN account.category IS A=asset,L=liability,Q=Equity,I=Income,E=expense", "id": "bf2686c6-466b-426e-9aa6-cb5f4c25ae2e", "location": {"column": null, "line": 72, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:14.799204876Z", "fragment": "COMMENT ON COLUMN account.is_temp IS Only affects equity accounts.  If set, close at end of year.", "id": "f49924ae-234d-4cff-ab6c-447de1cfafab", "location": {"column": null, "line": 75, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:02.735122815Z", "fragment": "COMMENT ON TABLE account IS This table stores the main account info.", "id": "d148b37b-edcc-41c4-bf85-a0623e991c85", "location": {"column": null, "line": 78, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.779480732Z", "evidence": ["901296b9-bd47-4976-981a-a0d92e7bfbda", "bf2686c6-466b-426e-9aa6-cb5f4c25ae2e", "f49924ae-234d-4cff-ab6c-447de1cfafab", "d148b37b-edcc-41c4-bf85-a0623e991c85"], "id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa", "kind": "Table", "name": "account", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "T …
```

### 124. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `account_heading`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'account_heading'"}`  
**Result:** ok, 589 ms

```json
{"count": 1, "rows": [{"id": "e7b1a9be-ac14-54f9-8cc3-7e92de186c6f", "kind": "Table", "name": "account_heading"}]}
```

### 125. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `account_heading`  
**Arguments:** `{"id": "e7b1a9be-ac14-54f9-8cc3-7e92de186c6f"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:01.048946470Z", "fragment": "CREATE TABLE account_heading", "id": "19cee386-32a1-4b0b-bc80-e1a285430e26", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:06.606070117Z", "fragment": "COMMENT ON TABLE account_heading IS This table holds the account headings in the system.  Each account must belong\nto a heading, and a heading can belong to another heading.  In this way it is\npossible to nest accounts for reporting purposes.", "id": "8d3b7784-a581-46db-b310-9a2eb6524594", "location": {"column": null, "line": 49, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:07.349836034Z", "fragment": "COMMENT ON COLUMN account_heading.category IS Same as the column account.category, except that if NULL the category\nis automatically derived from the linked accounts.", "id": "81a5d667-63c0-4ee2-83aa-1f8a3fd46f5e", "location": {"column": null, "line": 54, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.764904977Z", "evidence": ["19cee386-32a1-4b0b-bc80-e1a285430e26", "8d3b7784-a581-46db-b310-9a2eb6524594", "81a5d667-63c0-4ee2-83aa-1f8a3fd46f5e"], "id": "e7b1a9be-ac14-54f9-8cc3-7e92de186c6f", "kind": "Table", "name": "account_heading", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "accno"}, {"data_type": "INT", "name": "parent_id"},  …
```

### 126. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `account_link`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'account_link'"}`  
**Result:** ok, 575 ms

```json
{"count": 1, "rows": [{"id": "f0b041a2-2a84-5909-805f-07a146cf963a", "kind": "Table", "name": "account_link"}]}
```

### 127. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `account_link`  
**Arguments:** `{"id": "f0b041a2-2a84-5909-805f-07a146cf963a"}`  
**Result:** ok, 3 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:08.326847880Z", "fragment": "CREATE TABLE account_link", "id": "d9471544-efe2-4931-b416-6dc81e1d49b3", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.819065335Z", "evidence": ["d9471544-efe2-4931-b416-6dc81e1d49b3"], "id": "f0b041a2-2a84-5909-805f-07a146cf963a", "kind": "Table", "name": "account_link", "properties": {"columns": [{"data_type": "INT", "name": "account_id"}, {"data_type": "TEXT", "name": "description"}]}}, "relationships": [{"created_at": "2026-09-16T14:59:23.839858321Z", "evidence": ["f1c75431-2fc4-5266-97e2-00362c5a931e"], "from": "d87b3d95-0623-5b7c-bc42-41d04b4d7c45", "id": "3664cf81-f00e-5d6f-a4e6-a578711a28a4", "kind": "ReadsFrom", "properties": {}, "to": "f0b041a2-2a84-5909-805f-07a146cf963a", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:39:52.803633702Z", "evidence": ["fadc86f0-2f09-4eee-ac88-828877e37c30"], "from": "f0b041a2-2a84-5909-805f-07a146cf963a", "id": "572552d6-bd3e-5850-8958-f2eed1fedb6b", "kind": "ForeignKey", "properties": {"fk_desc": "account_link.description → account_link_description.description"}, "to": "16928103-1b38-5cb4-9342-b9e9d8cf9da8", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:39:52.796165946Z", "evidence": ["eb8a44e3-71be-480d-a246-7741acf809eb"], "from": "f0b041a2-2a84-5909-805f-07a146cf963a", "id": "6d8a6772-89ec-5eaf-a08f-62713f6de …
```

### 128. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `ap`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'ap'"}`  
**Result:** ok, 591 ms

```json
{"count": 1, "rows": [{"id": "a337a7d7-e368-58e4-9c45-cba719c6046b", "kind": "Table", "name": "ap"}]}
```

### 129. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `ap`  
**Arguments:** `{"id": "a337a7d7-e368-58e4-9c45-cba719c6046b"}`  
**Result:** ok, 5 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:59.394273628Z", "fragment": "CREATE TABLE ap", "id": "e95d7643-1d8c-4fb4-9f61-33fed4e7fe49", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:07.647647051Z", "fragment": "COMMENT ON TABLE ap IS Summary/header information for AP transactions and vendor invoices.\nNote that some constraints here are hard to enforce because we haven not gotten\nto rewriting the relevant code here.\nHV TODO drop entity_id", "id": "67fc1400-30ff-4ec3-9567-09231551d480", "location": {"column": null, "line": 1442, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:53.944796256Z", "fragment": "COMMENT ON COLUMN ap.invnumber IS Text identifier for the invoice.  Must be unique.", "id": "36f36baa-6ace-4993-8ecf-b19d3fe715ef", "location": {"column": null, "line": 1449, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:56.007033168Z", "fragment": "COMMENT ON COLUMN ap.invoice IS True if the transaction tracks goods/services purchase using the invoice\ntable.  False otherwise.", "id": "c0cea321-485b-4dce-866c-f53e9b0f761d", "location": {"column": null, "line": 1452, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:02.182336869Z", "fragment": "COMMENT ON COLUMN ap.amount IS This stores the total amount (including taxes) for the transaction.", "id": "08077b22-22c …
```

### 130. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `ar`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'ar'"}`  
**Result:** ok, 576 ms

```json
{"count": 1, "rows": [{"id": "ccdf16c2-236c-55c2-a135-1a00c662c231", "kind": "Table", "name": "ar"}]}
```

### 131. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `ar`  
**Arguments:** `{"id": "ccdf16c2-236c-55c2-a135-1a00c662c231"}`  
**Result:** ok, 6 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:00.450396543Z", "fragment": "CREATE TABLE ar", "id": "cae5a52c-3d6e-46c4-b8f1-55faa6ed992e", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.760613987Z", "fragment": "COMMENT ON TABLE ar IS Summary/header information for AR transactions and sales invoices.\nNote that some constraints here are hard to enforce because we haven not gotten\nto rewriting the relevant code here.\nHV TODO drop entity_id", "id": "f765cd21-8bfe-4baf-9898-c2ad7454bdfb", "location": {"column": null, "line": 1355, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:08.578808031Z", "fragment": "COMMENT ON COLUMN ar.invnumber IS Text identifier for the invoice.  Must be unique.", "id": "d9c09ae5-39e6-46a6-b3c4-724f601398f5", "location": {"column": null, "line": 1362, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.193153685Z", "fragment": "COMMENT ON COLUMN ar.invoice IS True if the transaction tracks goods/services purchase using the invoice\ntable.  False otherwise.", "id": "4b825c90-b380-4e2e-a6b6-ad49234d91a6", "location": {"column": null, "line": 1365, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:03.171018272Z", "fragment": "COMMENT ON COLUMN ar.amount IS This stores the total amount (including taxes) for the transaction.", "id": "9fe2bb45-7970 …
```

### 132. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `business`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'business'"}`  
**Result:** ok, 584 ms

```json
{"count": 1, "rows": [{"id": "6a3a8d48-4425-58e2-acf1-cc488d9cd7e8", "kind": "Table", "name": "business"}]}
```

### 133. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `business`  
**Arguments:** `{"id": "6a3a8d48-4425-58e2-acf1-cc488d9cd7e8"}`  
**Result:** ok, 3 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:18.081124909Z", "fragment": "CREATE TABLE business", "id": "ce69dc33-4ca1-45e9-896c-43d635c91bd8", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.510958009Z", "fragment": "COMMENT ON TABLE business IS Groups of Customers assigned joint discounts.", "id": "8e0b0720-ebfe-4742-bc35-e88bcc344a11", "location": {"column": null, "line": 1825, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.900044200Z", "evidence": ["ce69dc33-4ca1-45e9-896c-43d635c91bd8", "8e0b0720-ebfe-4742-bc35-e88bcc344a11"], "id": "6a3a8d48-4425-58e2-acf1-cc488d9cd7e8", "kind": "Table", "name": "business", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "description"}, {"data_type": "NUMERIC", "name": "discount"}], "description": "Groups of Customers assigned joint discounts.", "sql_comment": "Groups of Customers assigned joint discounts."}}, "relationships": [{"created_at": "2026-09-16T14:59:23.839534395Z", "evidence": ["941b72ff-1b7d-5f90-bb40-423759bceee8"], "from": "e22be6c2-402f-5a60-b753-e4cdcef9827f", "id": "18d9bb41-d196-5efe-87c2-98cfc84dd0fc", "kind": "ReadsFrom", "properties": {}, "to": "6a3a8d48-4425-58e2-acf1-cc488d9cd7e8", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:40:04.963153881Z", "evidence": ["f968f9e6-5e35-4e40-995a-369aca7a5e0e"], "from":  …
```

### 134. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `company`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'company'"}`  
**Result:** ok, 586 ms

```json
{"count": 1, "rows": [{"id": "ebaa9398-3b6a-597f-8b54-b5cecf3acec5", "kind": "Table", "name": "company"}]}
```

### 135. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `company`  
**Arguments:** `{"id": "ebaa9398-3b6a-597f-8b54-b5cecf3acec5"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:00.210513634Z", "fragment": "CREATE TABLE company", "id": "efd1d4c0-6bc6-497a-8e77-6ee6a0ed4cc5", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:11.764702169Z", "fragment": "COMMENT ON COLUMN company.tax_id IS In the US this would be a EIN.", "id": "74a2ff23-3cd2-4536-a5d3-07ca9e1284de", "location": {"column": null, "line": 414, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.981971466Z", "evidence": ["efd1d4c0-6bc6-497a-8e77-6ee6a0ed4cc5", "74a2ff23-3cd2-4536-a5d3-07ca9e1284de"], "id": "ebaa9398-3b6a-597f-8b54-b5cecf3acec5", "kind": "Table", "name": "company", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "INTEGER", "name": "entity_id"}, {"data_type": "TEXT", "name": "legal_name"}, {"data_type": "TEXT", "description": "In the US this would be a EIN.", "name": "tax_id"}, {"data_type": "TEXT", "name": "sales_tax_id"}, {"data_type": "TEXT", "name": "license_number"}, {"data_type": "VARCHAR", "name": "sic_code"}, {"data_type": "DATE", "name": "created"}]}}, "relationships": [{"created_at": "2026-09-16T14:59:23.839521126Z", "evidence": ["0717a3ae-1326-53ad-83d9-07fe69d1256f"], "from": "03377bc4-ee2e-5328-b43b-0f1878c55835", "id": "0616e748-0f9e-5952-ac01-a81a9e4e95f6", "kind": "ReadsFrom", "properties": {}, "to": "ebaa9398-3b6a-597f-8b54-b5cecf3acec5", "valid_from": null …
```

### 136. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `country`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'country'"}`  
**Result:** ok, 579 ms

```json
{"count": 1, "rows": [{"id": "bb7c1236-8a1a-538d-9cb5-d51ef1653e94", "kind": "Table", "name": "country"}]}
```

### 137. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `country`  
**Arguments:** `{"id": "bb7c1236-8a1a-538d-9cb5-d51ef1653e94"}`  
**Result:** ok, 5 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:14.290304225Z", "fragment": "CREATE TABLE country", "id": "49621b00-c003-480c-a684-3c476fe4be5f", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:56.391536442Z", "fragment": "COMMENT ON COLUMN country.itu IS The ITU Telecommunication Standardization Sector code for calling internationally. For example, the US is 1, Great Britain is 44", "id": "1e466f4c-c775-45d4-940f-a7b57a99e778", "location": {"column": null, "line": 190, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.833355018Z", "evidence": ["49621b00-c003-480c-a684-3c476fe4be5f", "1e466f4c-c775-45d4-940f-a7b57a99e778"], "id": "bb7c1236-8a1a-538d-9cb5-d51ef1653e94", "kind": "Table", "name": "country", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "name"}, {"data_type": "TEXT", "name": "short_name"}, {"data_type": "TEXT", "description": "The ITU Telecommunication Standardization Sector code for calling internationally. For example, the US is 1, Great Britain is 44", "name": "itu"}]}}, "relationships": [{"created_at": "2026-09-28T14:39:52.829550636Z", "evidence": ["e52fcf59-e831-4782-a75c-dc199154b673"], "from": "3993d440-1c22-52d8-8367-30854bbe7119", "id": "03de8f51-34b5-58f1-a1f5-177743703d00", "kind": "ForeignKey", "properties": {"fk_desc": "entity.country_id → country.id"}, "to": "bb7c1236-8a1a-5 …
```

### 138. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `currency`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'currency'"}`  
**Result:** ok, 590 ms

```json
{"count": 1, "rows": [{"id": "9bcf0658-bb38-5118-9a5c-68d807745540", "kind": "Table", "name": "currency"}]}
```

### 139. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `currency`  
**Arguments:** `{"id": "9bcf0658-bb38-5118-9a5c-68d807745540"}`  
**Result:** ok, 3 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:13.545981795Z", "fragment": "CREATE TABLE currency", "id": "1b5558af-c192-4753-8eec-1257ec210ce6", "location": {"column": null, "line": null, "path": "sql/changes/mc/new-tables.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.456529464Z", "fragment": "COMMENT ON TABLE currency IS This table holds the list of currencies available for posting in the system;\nit mostly serves as the canonical definition of currency codes.", "id": "b9bd907f-b461-443d-8ebe-a7d421524b8a", "location": {"column": null, "line": 7, "path": "sql/changes/mc/new-tables.sql"}}], "object": {"created_at": "2026-09-28T14:39:00.086631133Z", "evidence": ["1b5558af-c192-4753-8eec-1257ec210ce6", "b9bd907f-b461-443d-8ebe-a7d421524b8a"], "id": "9bcf0658-bb38-5118-9a5c-68d807745540", "kind": "Table", "name": "currency", "properties": {"columns": [{"data_type": "CHAR(3)", "name": "curr"}, {"data_type": "TEXT", "name": "description"}], "description": "This table holds the list of currencies available for posting in the system;\nit mostly serves as the canonical definition of currency codes.", "sql_comment": "This table holds the list of currencies available for posting in the system;\nit mostly serves as the canonical definition of currency codes."}}, "relationships": [{"created_at": "2026-09-16T14:59:23.838632881Z", "evidence": ["0f76037d-997f-51d9-9da2-0654671c0713"], "from": "0dc683d2-0579-50c5-bed3-a40f949379ad", "id": "414f75c0-1423-5 …
```

### 140. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `eca_to_location`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'eca_to_location'"}`  
**Result:** ok, 585 ms

```json
{"count": 1, "rows": [{"id": "be13d243-a016-5b14-ba59-545dae283bc3", "kind": "Table", "name": "eca_to_location"}]}
```

### 141. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `eca_to_location`  
**Arguments:** `{"id": "be13d243-a016-5b14-ba59-545dae283bc3"}`  
**Result:** ok, 3 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:05.327246029Z", "fragment": "CREATE TABLE eca_to_location", "id": "0c6c9923-3125-4179-85ce-cd90906453ec", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:54.781874638Z", "fragment": "COMMENT ON TABLE eca_to_location IS This table is used for locations bound to contracts.  For generic contact\naddresses, use entity_to_location instead", "id": "3839507b-c8a2-4f69-a40d-a72087b63542", "location": {"column": null, "line": 597, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.110388505Z", "evidence": ["0c6c9923-3125-4179-85ce-cd90906453ec", "3839507b-c8a2-4f69-a40d-a72087b63542"], "id": "be13d243-a016-5b14-ba59-545dae283bc3", "kind": "Table", "name": "eca_to_location", "properties": {"columns": [{"data_type": "INTEGER", "name": "location_id"}, {"data_type": "INTEGER", "name": "location_class"}, {"data_type": "INTEGER", "name": "credit_id"}], "description": "This table is used for locations bound to contracts.  For generic contact\naddresses, use entity_to_location instead", "sql_comment": "This table is used for locations bound to contracts.  For generic contact\naddresses, use entity_to_location instead"}}, "relationships": [{"created_at": "2026-09-28T14:39:53.222215717Z", "evidence": ["c03e3eb4-0624-4e52-9a43-98f0e86e1da6"], "from": "be13d243-a016-5b14-ba59-545dae283bc3", "id": "2719fc74-00ed-5640-9744-c63 …
```

### 142. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `entity`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'entity'"}`  
**Result:** ok, 586 ms

```json
{"count": 1, "rows": [{"id": "3993d440-1c22-52d8-8367-30854bbe7119", "kind": "Table", "name": "entity"}]}
```

### 143. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `entity`  
**Arguments:** `{"id": "3993d440-1c22-52d8-8367-30854bbe7119"}`  
**Result:** ok, 10 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:02.267832258Z", "fragment": "CREATE TABLE entity", "id": "5c851e6d-bda6-41a6-8d14-66911cf88fdc", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:03.604420869Z", "fragment": "COMMENT ON TABLE entity IS The primary entity table to map to all contacts", "id": "4e4985f9-206c-4b2f-844a-871f88d0d2b1", "location": {"column": null, "line": 230, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:13.718224073Z", "fragment": "COMMENT ON COLUMN entity.name IS This is the common name of an entity. If it was a person it may be Joshua Drake, a company Acme Corp. You may also choose to use a domain such as commandprompt.com", "id": "5a8ceacd-4d5f-4e27-bfe7-b8e88239d301", "location": {"column": null, "line": 231, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.273744366Z", "fragment": "COMMENT ON TABLE entity IS The primary entity table to map to all contacts", "id": "e2cd50d7-4acd-4c5a-af06-8b2c7f12f841", "location": {"column": null, "line": 559, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.862471118Z", "evidence": ["5c851e6d-bda6-41a6-8d14-66911cf88fdc", "4e4985f9-206c-4b2f-844a-871f88d0d2b1", "5a8ceacd-4d5f-4e27-bfe7-b8e88239d301", "e2cd50d7-4acd-4c5a-af06-8b2c7f12f841"], "id": "3993d440-1c22-52d8-8367-30854bbe7119", "kind": "Table", "name …
```

### 144. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `entity_class`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'entity_class'"}`  
**Result:** ok, 589 ms

```json
{"count": 1, "rows": [{"id": "9a74248d-a8ff-5ba5-ae20-fd280d091bfc", "kind": "Table", "name": "entity_class"}]}
```

### 145. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `entity_class`  
**Arguments:** `{"id": "9a74248d-a8ff-5ba5-ae20-fd280d091bfc"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:06.831680180Z", "fragment": "CREATE TABLE entity_class", "id": "4dd721b2-9e7b-4e78-95ba-3b1f0dd43f30", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:53.860772223Z", "fragment": "COMMENT ON TABLE entity_class IS Defines the class type such as vendor, customer, contact, employee", "id": "05143514-bf8c-429a-863b-6c9ee025241c", "location": {"column": null, "line": 214, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:12.464091797Z", "fragment": "COMMENT ON COLUMN entity_class.id IS The first 7 values are reserved and\npermanent.  Individuals who create new classes, however, should coordinate\nwith others for ranges to use.", "id": "41c88040-f4c1-4f25-a78c-85068a09af05", "location": {"column": null, "line": 215, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.851703971Z", "evidence": ["4dd721b2-9e7b-4e78-95ba-3b1f0dd43f30", "05143514-bf8c-429a-863b-6c9ee025241c", "41c88040-f4c1-4f25-a78c-85068a09af05"], "id": "9a74248d-a8ff-5ba5-ae20-fd280d091bfc", "kind": "Table", "name": "entity_class", "properties": {"columns": [{"data_type": "serial", "description": "The first 7 values are reserved and\npermanent.  Individuals who create new classes, however, should coordinate\nwith others for ranges to use.", "name": "id"}, {"data_type": "TEXT", "name": "class"}, {"data_type": "BO …
```

### 146. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `entity_credit_account`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'entity_credit_account'"}`  
**Result:** ok, 583 ms

```json
{"count": 1, "rows": [{"id": "dd5393ba-4a3d-54cb-a816-be338e0cc992", "kind": "Table", "name": "entity_credit_account"}]}
```

### 147. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `entity_credit_account`  
**Arguments:** `{"id": "dd5393ba-4a3d-54cb-a816-be338e0cc992"}`  
**Result:** ok, 8 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:16.607633312Z", "fragment": "CREATE TABLE entity_credit_account", "id": "3d6c370b-c39c-4980-b463-a18bbcfbb4b4", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.507475761Z", "fragment": "COMMENT ON TABLE entity_credit_account IS This table stores information relating to general relationships regarding\nmoneys owed on invoice.  Invoices, whether AR or AP, must be attached to\na record in this table.", "id": "5f5cebc4-5a6a-4eed-b65d-ac7af5bcfd5e", "location": {"column": null, "line": 560, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:17.063500019Z", "fragment": "COMMENT ON COLUMN entity_credit_account.meta_number IS This stores the human readable control code for the customer/vendor record.\nThis is typically called the customer/vendor \"account\" in the application.", "id": "a87dc35d-31db-458c-a07f-300dd503ce0e", "location": {"column": null, "line": 565, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.080923476Z", "evidence": ["3d6c370b-c39c-4980-b463-a18bbcfbb4b4", "5f5cebc4-5a6a-4eed-b65d-ac7af5bcfd5e", "a87dc35d-31db-458c-a07f-300dd503ce0e"], "id": "dd5393ba-4a3d-54cb-a816-be338e0cc992", "kind": "Table", "name": "entity_credit_account", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "INT", "name": "entity_id"}, {"data_type": " …
```

### 148. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `gl`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'gl'"}`  
**Result:** ok, 590 ms

```json
{"count": 1, "rows": [{"id": "411f9c4b-8946-54f1-8783-0b6c3adfcee7", "kind": "Table", "name": "gl"}]}
```

### 149. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `gl`  
**Arguments:** `{"id": "411f9c4b-8946-54f1-8783-0b6c3adfcee7"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:56.720187449Z", "fragment": "CREATE TABLE gl", "id": "22e50473-40bb-473e-a864-ae50bd3be7b6", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:54.869622700Z", "fragment": "COMMENT ON TABLE gl IS This table holds summary information for entries in the general journal.\nDoes not hold summary information in 1.3 for AR or AP entries.", "id": "eec4d760-3787-4f2f-92da-e008f6f6f680", "location": {"column": null, "line": 991, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:02.853381365Z", "fragment": "COMMENT ON COLUMN gl.person_id IS the person_id of the employee who created\nthe entry.", "id": "2dbfe517-e828-47b5-aa22-146e06b687f8", "location": {"column": null, "line": 995, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.444194500Z", "evidence": ["22e50473-40bb-473e-a864-ae50bd3be7b6", "eec4d760-3787-4f2f-92da-e008f6f6f680", "2dbfe517-e828-47b5-aa22-146e06b687f8"], "id": "411f9c4b-8946-54f1-8783-0b6c3adfcee7", "kind": "Table", "name": "gl", "properties": {"columns": [{"data_type": "INT", "name": "id"}, {"data_type": "TEXT", "name": "reference"}, {"data_type": "TEXT", "name": "description"}, {"data_type": "DATE", "name": "transdate"}, {"data_type": "INTEGER", "description": "the person_id of the employee who created\nthe entry.", "name": "person_id"}, {"data_type": "TEXT",  …
```

### 150. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `inventory_report`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'inventory_report'"}`  
**Result:** ok, 584 ms

```json
{"count": 1, "rows": [{"id": "6b9e7416-2185-5be6-86c8-783c3aee5207", "kind": "Table", "name": "inventory_report"}]}
```

### 151. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `inventory_report`  
**Arguments:** `{"id": "6b9e7416-2185-5be6-86c8-783c3aee5207"}`  
**Result:** ok, 3 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:16.399998263Z", "fragment": "CREATE TABLE inventory_report", "id": "fe528846-51cf-4087-9778-7790a5e6cccc", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.630904851Z", "evidence": ["fe528846-51cf-4087-9778-7790a5e6cccc"], "id": "6b9e7416-2185-5be6-86c8-783c3aee5207", "kind": "Table", "name": "inventory_report", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "DATE", "name": "transdate"}, {"data_type": "TEXT", "name": "source"}, {"data_type": "INT", "name": "ar_trans_id"}, {"data_type": "INT", "name": "ap_trans_id"}]}}, "relationships": [{"created_at": "2026-09-16T14:59:23.838880958Z", "evidence": ["f5e7e8b9-9b8e-5cc0-a38b-4b9dd138d86a"], "from": "f9909e05-f2e1-5e65-982f-ecce68ba1eb7", "id": "6d604d09-ccbc-55c5-a162-16ee277d6604", "kind": "ReadsFrom", "properties": {}, "to": "6b9e7416-2185-5be6-86c8-783c3aee5207", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.838430899Z", "evidence": ["7a1b6426-2dbe-5d90-9f03-78f55d32e58a"], "from": "6f642978-3e19-5182-af1f-b15ff1274232", "id": "96e665e5-38f5-5279-bba9-1c62b37476c2", "kind": "ReadsFrom", "properties": {}, "to": "6b9e7416-2185-5be6-86c8-783c3aee5207", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.839576440Z", "evidence": ["8cc02ec4-21e5-5907-b3b4-b7d59c38758b"], "from": "a6869a5e-5717-5a7d-90c8- …
```

### 152. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `inventory_report_line`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'inventory_report_line'"}`  
**Result:** ok, 579 ms

```json
{"count": 1, "rows": [{"id": "0f8e2bad-af2f-5d34-921c-14e60709a98b", "kind": "Table", "name": "inventory_report_line"}]}
```

### 153. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `inventory_report_line`  
**Arguments:** `{"id": "0f8e2bad-af2f-5d34-921c-14e60709a98b"}`  
**Result:** ok, 3 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:04.616208076Z", "fragment": "CREATE TABLE inventory_report_line", "id": "ae72de2d-f711-4189-ba94-fbd1152ec16e", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.648577945Z", "evidence": ["ae72de2d-f711-4189-ba94-fbd1152ec16e"], "id": "0f8e2bad-af2f-5d34-921c-14e60709a98b", "kind": "Table", "name": "inventory_report_line", "properties": {"columns": [{"data_type": "INT", "name": "adjust_id"}, {"data_type": "INT", "name": "parts_id"}, {"data_type": "NUMERIC", "name": "counted"}, {"data_type": "NUMERIC", "name": "expected"}, {"data_type": "NUMERIC", "name": "variance"}]}}, "relationships": [{"created_at": "2026-09-28T14:39:54.081192994Z", "evidence": ["8c4b3513-fc60-4e46-b8bf-f1f4e3a685f5"], "from": "0f8e2bad-af2f-5d34-921c-14e60709a98b", "id": "63acbbec-841d-5a3b-a075-a08da5f3f657", "kind": "ForeignKey", "properties": {"fk_desc": "inventory_report_line.parts_id → parts.id"}, "to": "13575f92-6f74-5533-8a33-04ceabd3b710", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.838036434Z", "evidence": ["16dd4120-05e7-52ae-a8bc-8cf211309b2e"], "from": "478d75e3-12ec-507a-b90b-d0f04c793424", "id": "9fab1efa-9a77-5cd4-bb0a-a9897790552f", "kind": "ReadsFrom", "properties": {}, "to": "0f8e2bad-af2f-5d34-921c-14e60709a98b", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:39:54.073979811Z", "evidence": [" …
```

### 154. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `invoice`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'invoice'"}`  
**Result:** ok, 582 ms

```json
{"count": 1, "rows": [{"id": "007811f7-d983-545d-9927-998a016f81da", "kind": "Table", "name": "invoice"}]}
```

### 155. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `invoice`  
**Arguments:** `{"id": "007811f7-d983-545d-9927-998a016f81da"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:10.287927477Z", "fragment": "CREATE TABLE invoice", "id": "55e8d31e-b7a0-43b0-8c4d-68f8f5eab0e5", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:14.875694948Z", "fragment": "COMMENT ON TABLE invoice IS Line items of invoices with goods/services attached.", "id": "e4b7a9cb-c277-439f-ae07-e95d4a483d0d", "location": {"column": null, "line": 1264, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:11.714116803Z", "fragment": "COMMENT ON COLUMN invoice.allocated IS Number of allocated items, negative relative to qty.\nWhen qty + allocated = 0, then the item is fully used for purposes of COGS\ncalculations.", "id": "9fbe2725-5e47-4db2-bc0a-925bf40d9a73", "location": {"column": null, "line": 1267, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:06.013662549Z", "fragment": "COMMENT ON COLUMN invoice.qty IS Positive is normal for sales invoices, negative for vendor invoices.", "id": "71a975b1-def0-4221-9cf4-9ad7af2a36b3", "location": {"column": null, "line": 1272, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.562350256Z", "evidence": ["55e8d31e-b7a0-43b0-8c4d-68f8f5eab0e5", "e4b7a9cb-c277-439f-ae07-e95d4a483d0d", "9fbe2725-5e47-4db2-bc0a-925bf40d9a73", "71a975b1-def0-4221-9cf4-9ad7af2a36b3"], "id": "007811f7-d983-545d-9927-998a016f81da", …
```

### 156. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `location`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'location'"}`  
**Result:** ok, 583 ms

```json
{"count": 1, "rows": [{"id": "4bd59c1f-3554-5637-8606-52cdb89bac7d", "kind": "Table", "name": "location"}]}
```

### 157. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `location`  
**Arguments:** `{"id": "4bd59c1f-3554-5637-8606-52cdb89bac7d"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:07.136881077Z", "fragment": "CREATE TABLE location", "id": "e8c069a4-a94e-43b3-8225-c4aa8d50b8bd", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:05.502933454Z", "fragment": "COMMENT ON TABLE location IS This table stores addresses, such as shipto and bill to addresses.", "id": "114d6fe4-b607-4193-acbb-6ed378f12066", "location": {"column": null, "line": 399, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.962474595Z", "evidence": ["e8c069a4-a94e-43b3-8225-c4aa8d50b8bd", "114d6fe4-b607-4193-acbb-6ed378f12066"], "id": "4bd59c1f-3554-5637-8606-52cdb89bac7d", "kind": "Table", "name": "location", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "line_one"}, {"data_type": "TEXT", "name": "line_two"}, {"data_type": "TEXT", "name": "line_three"}, {"data_type": "TEXT", "name": "city"}, {"data_type": "TEXT", "name": "state"}, {"data_type": "INTEGER", "name": "country_id"}, {"data_type": "TEXT", "name": "mail_code"}, {"data_type": "DATE", "name": "created"}, {"data_type": "TIMESTAMP", "name": "inactive_date"}, {"data_type": "BOOLEAN", "name": "active"}], "description": "This table stores addresses, such as shipto and bill to addresses.", "sql_comment": "This table stores addresses, such as shipto and bill to addresses."}}, "relationships": [{"created_at": "2026-09- …
```

### 158. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `oe`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'oe'"}`  
**Result:** ok, 582 ms

```json
{"count": 1, "rows": [{"id": "d1b46d64-5445-5e88-ae13-d18e0e8fbb23", "kind": "Table", "name": "oe"}]}
```

### 159. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `oe`  
**Arguments:** `{"id": "d1b46d64-5445-5e88-ae13-d18e0e8fbb23"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:14.923657131Z", "fragment": "CREATE TABLE oe", "id": "9d002a7c-9581-43e2-9c49-b12a5ca4ca80", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.151513715Z", "fragment": "COMMENT ON TABLE oe IS Header information for:\n* Sales orders\n* Purchase Orders\n* Quotations\n* Requests for Quotation", "id": "1520f399-106f-454a-8e78-103a80d912b0", "location": {"column": null, "line": 1614, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.710050521Z", "evidence": ["9d002a7c-9581-43e2-9c49-b12a5ca4ca80", "1520f399-106f-454a-8e78-103a80d912b0"], "id": "d1b46d64-5445-5e88-ae13-d18e0e8fbb23", "kind": "Table", "name": "oe", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "ordnumber"}, {"data_type": "DATE", "name": "transdate"}, {"data_type": "INTEGER", "name": "entity_id"}, {"data_type": "NUMERIC", "name": "amount"}, {"data_type": "NUMERIC", "name": "netamount"}, {"data_type": "DATE", "name": "reqdate"}, {"data_type": "BOOL", "name": "taxincluded"}, {"data_type": "TEXT", "name": "shippingpoint"}, {"data_type": "TEXT", "name": "notes"}, {"data_type": "CHAR(3)", "name": "curr"}, {"data_type": "INTEGER", "name": "person_id"}, {"data_type": "BOOL", "name": "closed"}, {"data_type": "BOOL", "name": "quotation"}, {"data_type": "TEXT", "name": "quonumber"}, {"data_type": "TEXT", …
```

### 160. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `oe_class`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'oe_class'"}`  
**Result:** ok, 581 ms

```json
{"count": 1, "rows": [{"id": "ee5ad1c8-a825-5255-a204-aa9e74be7ed6", "kind": "Table", "name": "oe_class"}]}
```

### 161. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `oe_class`  
**Arguments:** `{"id": "ee5ad1c8-a825-5255-a204-aa9e74be7ed6"}`  
**Result:** ok, 3 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:05.306681071Z", "fragment": "CREATE TABLE oe_class", "id": "7d195ee5-d040-427d-89c5-74c7425ebd96", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:00.636558894Z", "fragment": "COMMENT ON TABLE oe_class IS Hardwired classifications for orders and quotations.\nCoordinate before adding.", "id": "95e861e3-b61e-4f1b-ae46-54e8256f3a75", "location": {"column": null, "line": 1585, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.699381572Z", "evidence": ["7d195ee5-d040-427d-89c5-74c7425ebd96", "95e861e3-b61e-4f1b-ae46-54e8256f3a75"], "id": "ee5ad1c8-a825-5255-a204-aa9e74be7ed6", "kind": "Table", "name": "oe_class", "properties": {"columns": [{"data_type": "SMALLINT", "name": "id"}, {"data_type": "TEXT", "name": "oe_class"}], "description": "Hardwired classifications for orders and quotations.\nCoordinate before adding.", "sql_comment": "Hardwired classifications for orders and quotations.\nCoordinate before adding."}}, "relationships": [{"created_at": "2026-09-16T14:59:23.839077143Z", "evidence": ["062ae994-abdb-56f7-b9e2-f430e4406ce2"], "from": "7bc096c6-f0ca-5b18-93d7-21a610c71769", "id": "8fdb48e9-989b-5f80-bf21-9eef77ee6115", "kind": "ReadsFrom", "properties": {}, "to": "ee5ad1c8-a825-5255-a204-aa9e74be7ed6", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:39:54.220069269Z", "eviden …
```

### 162. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `open_item`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'open_item'"}`  
**Result:** ok, 581 ms

```json
{"count": 1, "rows": [{"id": "4050340b-d85d-5da8-960c-74d76fc458a6", "kind": "Table", "name": "open_item"}]}
```

### 163. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `open_item`  
**Arguments:** `{"id": "4050340b-d85d-5da8-960c-74d76fc458a6"}`  
**Result:** ok, 3 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:10.243642391Z", "fragment": "CREATE TABLE open_item", "id": "710bee82-0a22-4381-ba3f-6b87873220a7", "location": {"column": null, "line": null, "path": "sql/changes/1.14/open-item-tracking.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:56.524492477Z", "fragment": "COMMENT ON TABLE open_item IS Allows tracking of items to be cleared/handled in subsequent transactions.", "id": "9e1412c7-8c41-452d-adb0-fd0a62096f5f", "location": {"column": null, "line": 93, "path": "sql/changes/1.14/open-item-tracking.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.073688618Z", "fragment": "COMMENT ON COLUMN open_item.id IS Internal identifier for the open item.", "id": "4c822d38-09ed-47dd-8765-9154bd13f6f6", "location": {"column": null, "line": 96, "path": "sql/changes/1.14/open-item-tracking.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:08.713944458Z", "fragment": "COMMENT ON COLUMN open_item.item_number IS Identifier as presented in the user interface.", "id": "be611c6e-4fd7-47dc-802b-1ca006aac3e1", "location": {"column": null, "line": 98, "path": "sql/changes/1.14/open-item-tracking.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:13.359453678Z", "fragment": "COMMENT ON COLUMN open_item.item_type IS Type of open item; currently 'gl','ar' or 'ap'.", "id": "f7bb2ab8-8608-4988-a205-ed800481a7b9", "location": {"column": null, "line": 100, "path": "sql/changes/1.14/open-item-track …
```

### 164. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `orderitems`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'orderitems'"}`  
**Result:** ok, 580 ms

```json
{"count": 1, "rows": [{"id": "cd6546c8-7658-5a84-ab3a-1f557f383cd2", "kind": "Table", "name": "orderitems"}]}
```

### 165. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `orderitems`  
**Arguments:** `{"id": "cd6546c8-7658-5a84-ab3a-1f557f383cd2"}`  
**Result:** ok, 3 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:05.652626008Z", "fragment": "CREATE TABLE orderitems", "id": "adcdc443-a64b-4351-b04b-a7ba035b536a", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.930779863Z", "fragment": "COMMENT ON TABLE orderitems IS Line items for sales/purchase orders and quotations.", "id": "3c007468-7d96-4d1c-87fb-e0835622e4bb", "location": {"column": null, "line": 1637, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.721288610Z", "evidence": ["adcdc443-a64b-4351-b04b-a7ba035b536a", "3c007468-7d96-4d1c-87fb-e0835622e4bb"], "id": "cd6546c8-7658-5a84-ab3a-1f557f383cd2", "kind": "Table", "name": "orderitems", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "INT", "name": "trans_id"}, {"data_type": "INT", "name": "parts_id"}, {"data_type": "TEXT", "name": "description"}, {"data_type": "NUMERIC", "name": "qty"}, {"data_type": "NUMERIC", "name": "sellprice"}, {"data_type": "INT", "name": "precision"}, {"data_type": "NUMERIC", "name": "discount"}, {"data_type": "VARCHAR(5)", "name": "unit"}, {"data_type": "DATE", "name": "reqdate"}, {"data_type": "NUMERIC", "name": "ship"}, {"data_type": "TEXT", "name": "serialnumber"}, {"data_type": "TEXT", "name": "notes"}], "description": "Line items for sales/purchase orders and quotations.", "sql_comment": "Line items for sales/purchase orders and quotations. …
```

### 166. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `parts`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'parts'"}`  
**Result:** ok, 584 ms

```json
{"count": 1, "rows": [{"id": "13575f92-6f74-5533-8a33-04ceabd3b710", "kind": "Table", "name": "parts"}]}
```

### 167. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `parts`  
**Arguments:** `{"id": "13575f92-6f74-5533-8a33-04ceabd3b710"}`  
**Result:** ok, 8 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:58.210491963Z", "fragment": "CREATE TABLE parts", "id": "a2332429-4a27-4cf6-b3b5-cc148b8e9562", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:59.758154187Z", "fragment": "COMMENT ON TABLE parts IS This stores detail information about goods and services.  The type of part\nis currently defined according to the following rules:\n* If assembly is true, then an assembly\n* If inventory_accno_id, income_accno_id, and expense_accno_id are not null then\n  a part.\n* If inventory_accno_id is null but the other two are not, then a service.\n* Otherwise, a labor/overhead entry.", "id": "b44c7fc0-1beb-49d1-8a11-1ba36e6977e1", "location": {"column": null, "line": 1195, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.797982446Z", "fragment": "COMMENT ON COLUMN parts.rop IS Re-order point.  Used to select parts for short inventory report.", "id": "96ee23a5-a002-4bd3-893a-93ffe0cb8691", "location": {"column": null, "line": 1205, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:15.986640429Z", "fragment": "COMMENT ON COLUMN parts.bin IS Text identifier for where a part is stored.", "id": "7e097481-3f74-4b2f-b2a5-d98ca4795070", "location": {"column": null, "line": 1208, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:16.071517373Z", "f …
```

### 168. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `partsgroup`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'partsgroup'"}`  
**Result:** ok, 607 ms

```json
{"count": 1, "rows": [{"id": "1feb9c21-7673-59d0-9266-ba8cf1c065ab", "kind": "Table", "name": "partsgroup"}]}
```

### 169. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `partsgroup`  
**Arguments:** `{"id": "1feb9c21-7673-59d0-9266-ba8cf1c065ab"}`  
**Result:** ok, 5 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:08.103866099Z", "fragment": "CREATE TABLE partsgroup", "id": "8b161ff4-b534-4223-8477-2d346e166d2c", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:08.371432587Z", "fragment": "COMMENT ON TABLE partsgroup IS Groups of parts for Point of Sale screen.", "id": "249043af-7b68-4f73-a6a3-a4e91fe8f1ef", "location": {"column": null, "line": 1803, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.877391182Z", "evidence": ["8b161ff4-b534-4223-8477-2d346e166d2c", "249043af-7b68-4f73-a6a3-a4e91fe8f1ef"], "id": "1feb9c21-7673-59d0-9266-ba8cf1c065ab", "kind": "Table", "name": "partsgroup", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "partsgroup"}, {"data_type": "INT", "name": "parent"}], "description": "Groups of parts for Point of Sale screen.", "sql_comment": "Groups of parts for Point of Sale screen."}}, "relationships": [{"created_at": "2026-09-16T14:59:23.839744968Z", "evidence": ["226187f4-0a33-5028-b2a0-edbb695e4a38"], "from": "2412ef55-d1f2-50be-9a60-b6a17caec760", "id": "1976c3d6-8fc8-5b4d-a67f-af72cd50cc47", "kind": "ReadsFrom", "properties": {}, "to": "1feb9c21-7673-59d0-9266-ba8cf1c065ab", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.838853370Z", "evidence": ["e76295cd-ff2c-566f-a85b-ab36d57d5635"], "from": "095d2cd5-623 …
```

### 170. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `partstax`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'partstax'"}`  
**Result:** ok, 599 ms

```json
{"count": 1, "rows": [{"id": "2ea7f176-56d7-5564-831c-2bb5449d91d4", "kind": "Table", "name": "partstax"}]}
```

### 171. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `partstax`  
**Arguments:** `{"id": "2ea7f176-56d7-5564-831c-2bb5449d91d4"}`  
**Result:** ok, 3 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:14.551146428Z", "fragment": "CREATE TABLE partstax", "id": "b6d02f38-9460-458b-8844-3985c7e09a2e", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.317725090Z", "fragment": "COMMENT ON TABLE partstax IS Mapping of parts to taxes.", "id": "b71f19b3-6247-4545-8b58-bc673a08ccac", "location": {"column": null, "line": 1538, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.674916091Z", "evidence": ["b6d02f38-9460-458b-8844-3985c7e09a2e", "b71f19b3-6247-4545-8b58-bc673a08ccac"], "id": "2ea7f176-56d7-5564-831c-2bb5449d91d4", "kind": "Table", "name": "partstax", "properties": {"columns": [{"data_type": "INT", "name": "parts_id"}, {"data_type": "INT", "name": "chart_id"}, {"data_type": "INT", "name": "taxcategory_id"}], "description": "Mapping of parts to taxes.", "sql_comment": "Mapping of parts to taxes."}}, "relationships": [{"created_at": "2026-09-28T14:39:54.096064950Z", "evidence": ["162bfc25-ca81-454e-bd61-f4467ba91715"], "from": "2ea7f176-56d7-5564-831c-2bb5449d91d4", "id": "527c92bf-114e-5ce0-a713-5359d7b6688d", "kind": "ForeignKey", "properties": {"fk_desc": "partstax.parts_id → parts.id"}, "to": "13575f92-6f74-5533-8a33-04ceabd3b710", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:39:54.103943794Z", "evidence": ["7037b26f-7ccb-45ed-835b-e06698340d89"], "from": "2ea7f176-56d7 …
```

### 172. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `payment`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'payment'"}`  
**Result:** ok, 581 ms

```json
{"count": 1, "rows": [{"id": "c600e4f4-f88b-5d21-94ac-7d918d48dcf3", "kind": "Table", "name": "payment"}]}
```

### 173. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `payment`  
**Arguments:** `{"id": "c600e4f4-f88b-5d21-94ac-7d918d48dcf3"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:12.343506048Z", "fragment": "CREATE TABLE payment", "id": "cbac2b83-c419-4fe7-ab7e-17bdb7ff463a", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.929682239Z", "fragment": "COMMENT ON TABLE payment IS This table will store the main data on a payment, prepayment, overpayment, et", "id": "ae6aeb42-84de-47ce-a828-ee0090b785b3", "location": {"column": null, "line": 3417, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:05.535891194Z", "fragment": "COMMENT ON COLUMN payment.reference IS This field will store the code for both receipts and payment order", "id": "cd400e8f-8e91-481a-910f-ee3dbc59644c", "location": {"column": null, "line": 3418, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:13.618236318Z", "fragment": "COMMENT ON COLUMN payment.closed IS This will store the current state of a payment/receipt order", "id": "b15ee1fa-ecb6-42e3-9e89-06e18ad48ca6", "location": {"column": null, "line": 3419, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:05.812947211Z", "fragment": "COMMENT ON COLUMN payment.gl_id IS A payment should always be linked to a GL movement", "id": "c78f5705-9edd-4d86-b9b6-941ac9c5ae1f", "location": {"column": null, "line": 3420, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:4 …
```

### 174. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `tax`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'tax'"}`  
**Result:** ok, 584 ms

```json
{"count": 1, "rows": [{"id": "1ae6e156-42d7-5a40-abda-6c86b441ef29", "kind": "Table", "name": "tax"}]}
```

### 175. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `tax`  
**Arguments:** `{"id": "1ae6e156-42d7-5a40-abda-6c86b441ef29"}`  
**Result:** ok, 3 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:57.409108268Z", "fragment": "CREATE TABLE tax", "id": "1a1444e5-0e28-4ded-bcb6-d61ff9632956", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:56.921494202Z", "fragment": "COMMENT ON TABLE tax IS Information on tax rates.", "id": "afb65bc6-d20d-438e-b1cf-858e0df5f588", "location": {"column": null, "line": 1554, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:14.210512944Z", "fragment": "COMMENT ON COLUMN tax.pass IS This is an integer indicating the pass of the tax. This is to support\ncumultative sales tax rules (for example, Quebec charging taxes on the federal\ntaxes collected).", "id": "6eed3f9c-5003-454f-9219-7b2cb006007d", "location": {"column": null, "line": 1557, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.682271122Z", "evidence": ["1a1444e5-0e28-4ded-bcb6-d61ff9632956", "afb65bc6-d20d-438e-b1cf-858e0df5f588", "6eed3f9c-5003-454f-9219-7b2cb006007d"], "id": "1ae6e156-42d7-5a40-abda-6c86b441ef29", "kind": "Table", "name": "tax", "properties": {"columns": [{"data_type": "INT", "name": "chart_id"}, {"data_type": "NUMERIC", "name": "rate"}, {"data_type": "NUMERIC", "name": "minvalue"}, {"data_type": "NUMERIC", "name": "maxvalue"}, {"data_type": "TEXT", "name": "taxnumber"}, {"data_type": "TIMESTAMP", "name": "validto"}, {"data_type": "INTEGER", "description": …
```

### 176. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `trans_type`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'trans_type'"}`  
**Result:** ok, 588 ms

```json
{"count": 1, "rows": [{"id": "0d3c2be1-0fce-5594-bc86-61952763202b", "kind": "Table", "name": "trans_type"}]}
```

### 177. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `trans_type`  
**Arguments:** `{"id": "0d3c2be1-0fce-5594-bc86-61952763202b"}`  
**Result:** ok, 3 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:13.408017267Z", "fragment": "CREATE TABLE trans_type", "id": "6bd3adc8-d7b4-4768-b765-434f3f560536", "location": {"column": null, "line": null, "path": "sql/changes/1.6/gl-trans-type.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:11.418074384Z", "fragment": "COMMENT ON TABLE trans_type IS Documents the transaction type codes used in the 'gl' table.\n\nPlease note that the codes in this table are hard-coded into other\n(SQL) parts of the application. As such, this table merely serves\nas documentation; do *not* modify its content other than inserting\nnew codes.", "id": "e468b5ec-cfed-49f2-ba52-3ab3ff359b08", "location": {"column": null, "line": 7, "path": "sql/changes/1.6/gl-trans-type.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:07.471039671Z", "fragment": "COMMENT ON COLUMN trans_type.code IS Code of the transaction type. The 72 alphanumeric codes starting\nwith 'x' or 'X' are reserved for custom internal extensions.\n\nFor extensions distributed for wide(r) use, please request a code\nfrom the LedgerSMB development team.", "id": "a7881b28-0d15-4ed0-8514-98308ab8343a", "location": {"column": null, "line": 15, "path": "sql/changes/1.6/gl-trans-type.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:07.420955838Z", "fragment": "COMMENT ON COLUMN trans_type.description IS This column contains the full documentation as to the origin\nand purpose of the transaction type.", "id" …
```

### 178. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `transactions`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'transactions'"}`  
**Result:** ok, 579 ms

```json
{"count": 1, "rows": [{"id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38", "kind": "Table", "name": "transactions"}]}
```

### 179. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `transactions`  
**Arguments:** `{"id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38"}`  
**Result:** ok, 6 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:12.691082215Z", "fragment": "CREATE TABLE transactions", "id": "971e753e-1515-4cd4-b0cb-9e45ba93bfef", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:12.686200978Z", "fragment": "COMMENT ON TABLE transactions IS This table provides referential integrity between AR, AP, GL tables on one\nhand and acc_trans on the other, pending the refactoring of those tables.  It\nalso is used to provide discretionary locking of financial transactions across\ndatabase connections, for example in batch payment workflows.", "id": "7caa0c59-3c1e-440b-852b-9e02132a0ef3", "location": {"column": null, "line": 308, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.189559073Z", "fragment": "COMMENT ON COLUMN transactions.locked_by IS This should only be used in pessimistic locking measures as required by large\nbatch work flows.", "id": "58d32d2d-3afe-44f1-9201-eea476bc1d20", "location": {"column": null, "line": 338, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.908817167Z", "evidence": ["971e753e-1515-4cd4-b0cb-9e45ba93bfef", "7caa0c59-3c1e-440b-852b-9e02132a0ef3", "58d32d2d-3afe-44f1-9201-eea476bc1d20"], "id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38", "kind": "Table", "name": "transactions", "properties": {"columns": [{"data_type": "INT", "name": "id"}, {"data_type": "TEXT", "name": "t …
```

### 180. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `warehouse`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'warehouse'"}`  
**Result:** ok, 575 ms

```json
{"count": 1, "rows": [{"id": "cb63feeb-3d78-5175-8948-db542ce600da", "kind": "Table", "name": "warehouse"}]}
```

### 181. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `warehouse`  
**Arguments:** `{"id": "cb63feeb-3d78-5175-8948-db542ce600da"}`  
**Result:** ok, 3 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:54.676679631Z", "fragment": "CREATE TABLE warehouse", "id": "f355a0d8-1bc2-4fde-9fff-c1afc4d94cb7", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.926357622Z", "evidence": ["f355a0d8-1bc2-4fde-9fff-c1afc4d94cb7"], "id": "cb63feeb-3d78-5175-8948-db542ce600da", "kind": "Table", "name": "warehouse", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "description"}]}}, "relationships": [{"created_at": "2026-09-28T14:39:54.792958459Z", "evidence": ["cfda4423-8e80-4f06-ae34-6cda8dfefbce"], "from": "6e2475a2-326b-529e-99dc-1eb7474eccbc", "id": "13a02980-74ea-5af7-8498-143387ee4e97", "kind": "ForeignKey", "properties": {"fk_desc": "asset_item.location_id → warehouse.id"}, "to": "cb63feeb-3d78-5175-8948-db542ce600da", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.839987458Z", "evidence": ["7409a82f-bf5e-591e-85fa-54d47c935330"], "from": "49312b51-74ab-5d74-b7dd-7fbf88d57aa2", "id": "7e01f7e3-49ab-586f-9c7f-0c7193c7070b", "kind": "ReadsFrom", "properties": {}, "to": "cb63feeb-3d78-5175-8948-db542ce600da", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.840177497Z", "evidence": ["1591db61-4f66-54a5-9efb-9dd5d48df2f2"], "from": "465692b3-daca-5e4b-a4d5-8d046f435b7d", "id": "8ce0a240-c520-5e32-901e-0d51689a36e7", "kind": "ReadsFrom", "propertie …
```

### 182. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `acc_trans`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'acc_trans'"}`  
**Result:** ok, 939 ms

```json
{"count": 1, "rows": [{"id": "c74280fe-7b9a-5c74-b97c-afcc35f7f318", "kind": "Table", "name": "acc_trans"}]}
```

### 183. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `acc_trans`  
**Arguments:** `{"id": "c74280fe-7b9a-5c74-b97c-afcc35f7f318"}`  
**Result:** ok, 6 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:53.874571127Z", "fragment": "CREATE TABLE acc_trans", "id": "d8bfc9e6-52b0-44ac-9fd6-1ca27ef229dd", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:03.787189683Z", "fragment": "COMMENT ON TABLE acc_trans IS This table stores line items for financial transactions.  Please note that\npayments in 1.3 are not full-fledged transactions.", "id": "1d395fba-3b15-48fd-9442-23911b9e65e6", "location": {"column": null, "line": 1142, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.758000537Z", "fragment": "COMMENT ON COLUMN acc_trans.source IS Document Source identifier for individual line items, usually used\nfor payments.", "id": "6654131a-eeae-4b30-9c34-8b5acbc14412", "location": {"column": null, "line": 1146, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:00.930183454Z", "fragment": "COMMENT ON COLUMN acc_trans.fx_transaction IS When 'f', indicates that the amount column states the amount in the currency\nas specified in the associated ar, ap, payment or gl record.\n\nWhen 't', indicates that the amount column states the difference between\nthe foreighn currency amount and the base amount so that their sum equals the\nbase amount.", "id": "91dc78f4-32c7-461a-abf7-481e008b94a9", "location": {"column": null, "line": 1150, "path": "sql/Pg-database.sql"}}], "object": { …
```

### 184. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `account`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'account'"}`  
**Result:** ok, 648 ms

```json
{"count": 1, "rows": [{"id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa", "kind": "Table", "name": "account"}]}
```

### 185. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `account`  
**Arguments:** `{"id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa"}`  
**Result:** ok, 12 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:17.843615978Z", "fragment": "CREATE TABLE account", "id": "901296b9-bd47-4976-981a-a0d92e7bfbda", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.580145553Z", "fragment": "COMMENT ON COLUMN account.category IS A=asset,L=liability,Q=Equity,I=Income,E=expense", "id": "bf2686c6-466b-426e-9aa6-cb5f4c25ae2e", "location": {"column": null, "line": 72, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:14.799204876Z", "fragment": "COMMENT ON COLUMN account.is_temp IS Only affects equity accounts.  If set, close at end of year.", "id": "f49924ae-234d-4cff-ab6c-447de1cfafab", "location": {"column": null, "line": 75, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:02.735122815Z", "fragment": "COMMENT ON TABLE account IS This table stores the main account info.", "id": "d148b37b-edcc-41c4-bf85-a0623e991c85", "location": {"column": null, "line": 78, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.779480732Z", "evidence": ["901296b9-bd47-4976-981a-a0d92e7bfbda", "bf2686c6-466b-426e-9aa6-cb5f4c25ae2e", "f49924ae-234d-4cff-ab6c-447de1cfafab", "d148b37b-edcc-41c4-bf85-a0623e991c85"], "id": "4463dabc-b615-5f4b-92f8-37e3275fbbaa", "kind": "Table", "name": "account", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "T …
```

### 186. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `account_heading`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'account_heading'"}`  
**Result:** ok, 656 ms

```json
{"count": 1, "rows": [{"id": "e7b1a9be-ac14-54f9-8cc3-7e92de186c6f", "kind": "Table", "name": "account_heading"}]}
```

### 187. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `account_heading`  
**Arguments:** `{"id": "e7b1a9be-ac14-54f9-8cc3-7e92de186c6f"}`  
**Result:** ok, 6 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:01.048946470Z", "fragment": "CREATE TABLE account_heading", "id": "19cee386-32a1-4b0b-bc80-e1a285430e26", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:06.606070117Z", "fragment": "COMMENT ON TABLE account_heading IS This table holds the account headings in the system.  Each account must belong\nto a heading, and a heading can belong to another heading.  In this way it is\npossible to nest accounts for reporting purposes.", "id": "8d3b7784-a581-46db-b310-9a2eb6524594", "location": {"column": null, "line": 49, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:07.349836034Z", "fragment": "COMMENT ON COLUMN account_heading.category IS Same as the column account.category, except that if NULL the category\nis automatically derived from the linked accounts.", "id": "81a5d667-63c0-4ee2-83aa-1f8a3fd46f5e", "location": {"column": null, "line": 54, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.764904977Z", "evidence": ["19cee386-32a1-4b0b-bc80-e1a285430e26", "8d3b7784-a581-46db-b310-9a2eb6524594", "81a5d667-63c0-4ee2-83aa-1f8a3fd46f5e"], "id": "e7b1a9be-ac14-54f9-8cc3-7e92de186c6f", "kind": "Table", "name": "account_heading", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "accno"}, {"data_type": "INT", "name": "parent_id"},  …
```

### 188. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `account_link`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'account_link'"}`  
**Result:** ok, 641 ms

```json
{"count": 1, "rows": [{"id": "f0b041a2-2a84-5909-805f-07a146cf963a", "kind": "Table", "name": "account_link"}]}
```

### 189. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `account_link`  
**Arguments:** `{"id": "f0b041a2-2a84-5909-805f-07a146cf963a"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:08.326847880Z", "fragment": "CREATE TABLE account_link", "id": "d9471544-efe2-4931-b416-6dc81e1d49b3", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.819065335Z", "evidence": ["d9471544-efe2-4931-b416-6dc81e1d49b3"], "id": "f0b041a2-2a84-5909-805f-07a146cf963a", "kind": "Table", "name": "account_link", "properties": {"columns": [{"data_type": "INT", "name": "account_id"}, {"data_type": "TEXT", "name": "description"}]}}, "relationships": [{"created_at": "2026-09-16T14:59:23.839858321Z", "evidence": ["f1c75431-2fc4-5266-97e2-00362c5a931e"], "from": "d87b3d95-0623-5b7c-bc42-41d04b4d7c45", "id": "3664cf81-f00e-5d6f-a4e6-a578711a28a4", "kind": "ReadsFrom", "properties": {}, "to": "f0b041a2-2a84-5909-805f-07a146cf963a", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:39:52.803633702Z", "evidence": ["fadc86f0-2f09-4eee-ac88-828877e37c30"], "from": "f0b041a2-2a84-5909-805f-07a146cf963a", "id": "572552d6-bd3e-5850-8958-f2eed1fedb6b", "kind": "ForeignKey", "properties": {"fk_desc": "account_link.description → account_link_description.description"}, "to": "16928103-1b38-5cb4-9342-b9e9d8cf9da8", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:39:52.796165946Z", "evidence": ["eb8a44e3-71be-480d-a246-7741acf809eb"], "from": "f0b041a2-2a84-5909-805f-07a146cf963a", "id": "6d8a6772-89ec-5eaf-a08f-62713f6de …
```

### 190. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `ap`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'ap'"}`  
**Result:** ok, 639 ms

```json
{"count": 1, "rows": [{"id": "a337a7d7-e368-58e4-9c45-cba719c6046b", "kind": "Table", "name": "ap"}]}
```

### 191. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `ap`  
**Arguments:** `{"id": "a337a7d7-e368-58e4-9c45-cba719c6046b"}`  
**Result:** ok, 7 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:59.394273628Z", "fragment": "CREATE TABLE ap", "id": "e95d7643-1d8c-4fb4-9f61-33fed4e7fe49", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:07.647647051Z", "fragment": "COMMENT ON TABLE ap IS Summary/header information for AP transactions and vendor invoices.\nNote that some constraints here are hard to enforce because we haven not gotten\nto rewriting the relevant code here.\nHV TODO drop entity_id", "id": "67fc1400-30ff-4ec3-9567-09231551d480", "location": {"column": null, "line": 1442, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:53.944796256Z", "fragment": "COMMENT ON COLUMN ap.invnumber IS Text identifier for the invoice.  Must be unique.", "id": "36f36baa-6ace-4993-8ecf-b19d3fe715ef", "location": {"column": null, "line": 1449, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:56.007033168Z", "fragment": "COMMENT ON COLUMN ap.invoice IS True if the transaction tracks goods/services purchase using the invoice\ntable.  False otherwise.", "id": "c0cea321-485b-4dce-866c-f53e9b0f761d", "location": {"column": null, "line": 1452, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:02.182336869Z", "fragment": "COMMENT ON COLUMN ap.amount IS This stores the total amount (including taxes) for the transaction.", "id": "08077b22-22c …
```

### 192. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `ar`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'ar'"}`  
**Result:** ok, 642 ms

```json
{"count": 1, "rows": [{"id": "ccdf16c2-236c-55c2-a135-1a00c662c231", "kind": "Table", "name": "ar"}]}
```

### 193. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `ar`  
**Arguments:** `{"id": "ccdf16c2-236c-55c2-a135-1a00c662c231"}`  
**Result:** ok, 7 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:00.450396543Z", "fragment": "CREATE TABLE ar", "id": "cae5a52c-3d6e-46c4-b8f1-55faa6ed992e", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.760613987Z", "fragment": "COMMENT ON TABLE ar IS Summary/header information for AR transactions and sales invoices.\nNote that some constraints here are hard to enforce because we haven not gotten\nto rewriting the relevant code here.\nHV TODO drop entity_id", "id": "f765cd21-8bfe-4baf-9898-c2ad7454bdfb", "location": {"column": null, "line": 1355, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:08.578808031Z", "fragment": "COMMENT ON COLUMN ar.invnumber IS Text identifier for the invoice.  Must be unique.", "id": "d9c09ae5-39e6-46a6-b3c4-724f601398f5", "location": {"column": null, "line": 1362, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.193153685Z", "fragment": "COMMENT ON COLUMN ar.invoice IS True if the transaction tracks goods/services purchase using the invoice\ntable.  False otherwise.", "id": "4b825c90-b380-4e2e-a6b6-ad49234d91a6", "location": {"column": null, "line": 1365, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:03.171018272Z", "fragment": "COMMENT ON COLUMN ar.amount IS This stores the total amount (including taxes) for the transaction.", "id": "9fe2bb45-7970 …
```

### 194. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `business`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'business'"}`  
**Result:** ok, 675 ms

```json
{"count": 1, "rows": [{"id": "6a3a8d48-4425-58e2-acf1-cc488d9cd7e8", "kind": "Table", "name": "business"}]}
```

### 195. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `business`  
**Arguments:** `{"id": "6a3a8d48-4425-58e2-acf1-cc488d9cd7e8"}`  
**Result:** ok, 5 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:18.081124909Z", "fragment": "CREATE TABLE business", "id": "ce69dc33-4ca1-45e9-896c-43d635c91bd8", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.510958009Z", "fragment": "COMMENT ON TABLE business IS Groups of Customers assigned joint discounts.", "id": "8e0b0720-ebfe-4742-bc35-e88bcc344a11", "location": {"column": null, "line": 1825, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.900044200Z", "evidence": ["ce69dc33-4ca1-45e9-896c-43d635c91bd8", "8e0b0720-ebfe-4742-bc35-e88bcc344a11"], "id": "6a3a8d48-4425-58e2-acf1-cc488d9cd7e8", "kind": "Table", "name": "business", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "description"}, {"data_type": "NUMERIC", "name": "discount"}], "description": "Groups of Customers assigned joint discounts.", "sql_comment": "Groups of Customers assigned joint discounts."}}, "relationships": [{"created_at": "2026-09-16T14:59:23.839534395Z", "evidence": ["941b72ff-1b7d-5f90-bb40-423759bceee8"], "from": "e22be6c2-402f-5a60-b753-e4cdcef9827f", "id": "18d9bb41-d196-5efe-87c2-98cfc84dd0fc", "kind": "ReadsFrom", "properties": {}, "to": "6a3a8d48-4425-58e2-acf1-cc488d9cd7e8", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:40:04.963153881Z", "evidence": ["f968f9e6-5e35-4e40-995a-369aca7a5e0e"], "from":  …
```

### 196. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `company`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'company'"}`  
**Result:** ok, 641 ms

```json
{"count": 1, "rows": [{"id": "ebaa9398-3b6a-597f-8b54-b5cecf3acec5", "kind": "Table", "name": "company"}]}
```

### 197. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `company`  
**Arguments:** `{"id": "ebaa9398-3b6a-597f-8b54-b5cecf3acec5"}`  
**Result:** ok, 5 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:00.210513634Z", "fragment": "CREATE TABLE company", "id": "efd1d4c0-6bc6-497a-8e77-6ee6a0ed4cc5", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:11.764702169Z", "fragment": "COMMENT ON COLUMN company.tax_id IS In the US this would be a EIN.", "id": "74a2ff23-3cd2-4536-a5d3-07ca9e1284de", "location": {"column": null, "line": 414, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.981971466Z", "evidence": ["efd1d4c0-6bc6-497a-8e77-6ee6a0ed4cc5", "74a2ff23-3cd2-4536-a5d3-07ca9e1284de"], "id": "ebaa9398-3b6a-597f-8b54-b5cecf3acec5", "kind": "Table", "name": "company", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "INTEGER", "name": "entity_id"}, {"data_type": "TEXT", "name": "legal_name"}, {"data_type": "TEXT", "description": "In the US this would be a EIN.", "name": "tax_id"}, {"data_type": "TEXT", "name": "sales_tax_id"}, {"data_type": "TEXT", "name": "license_number"}, {"data_type": "VARCHAR", "name": "sic_code"}, {"data_type": "DATE", "name": "created"}]}}, "relationships": [{"created_at": "2026-09-16T14:59:23.839521126Z", "evidence": ["0717a3ae-1326-53ad-83d9-07fe69d1256f"], "from": "03377bc4-ee2e-5328-b43b-0f1878c55835", "id": "0616e748-0f9e-5952-ac01-a81a9e4e95f6", "kind": "ReadsFrom", "properties": {}, "to": "ebaa9398-3b6a-597f-8b54-b5cecf3acec5", "valid_from": null …
```

### 198. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `country`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'country'"}`  
**Result:** ok, 645 ms

```json
{"count": 1, "rows": [{"id": "bb7c1236-8a1a-538d-9cb5-d51ef1653e94", "kind": "Table", "name": "country"}]}
```

### 199. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `country`  
**Arguments:** `{"id": "bb7c1236-8a1a-538d-9cb5-d51ef1653e94"}`  
**Result:** ok, 6 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:14.290304225Z", "fragment": "CREATE TABLE country", "id": "49621b00-c003-480c-a684-3c476fe4be5f", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:56.391536442Z", "fragment": "COMMENT ON COLUMN country.itu IS The ITU Telecommunication Standardization Sector code for calling internationally. For example, the US is 1, Great Britain is 44", "id": "1e466f4c-c775-45d4-940f-a7b57a99e778", "location": {"column": null, "line": 190, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.833355018Z", "evidence": ["49621b00-c003-480c-a684-3c476fe4be5f", "1e466f4c-c775-45d4-940f-a7b57a99e778"], "id": "bb7c1236-8a1a-538d-9cb5-d51ef1653e94", "kind": "Table", "name": "country", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "name"}, {"data_type": "TEXT", "name": "short_name"}, {"data_type": "TEXT", "description": "The ITU Telecommunication Standardization Sector code for calling internationally. For example, the US is 1, Great Britain is 44", "name": "itu"}]}}, "relationships": [{"created_at": "2026-09-28T14:39:52.829550636Z", "evidence": ["e52fcf59-e831-4782-a75c-dc199154b673"], "from": "3993d440-1c22-52d8-8367-30854bbe7119", "id": "03de8f51-34b5-58f1-a1f5-177743703d00", "kind": "ForeignKey", "properties": {"fk_desc": "entity.country_id → country.id"}, "to": "bb7c1236-8a1a-5 …
```

### 200. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `currency`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'currency'"}`  
**Result:** ok, 643 ms

```json
{"count": 1, "rows": [{"id": "9bcf0658-bb38-5118-9a5c-68d807745540", "kind": "Table", "name": "currency"}]}
```

### 201. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `currency`  
**Arguments:** `{"id": "9bcf0658-bb38-5118-9a5c-68d807745540"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:13.545981795Z", "fragment": "CREATE TABLE currency", "id": "1b5558af-c192-4753-8eec-1257ec210ce6", "location": {"column": null, "line": null, "path": "sql/changes/mc/new-tables.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.456529464Z", "fragment": "COMMENT ON TABLE currency IS This table holds the list of currencies available for posting in the system;\nit mostly serves as the canonical definition of currency codes.", "id": "b9bd907f-b461-443d-8ebe-a7d421524b8a", "location": {"column": null, "line": 7, "path": "sql/changes/mc/new-tables.sql"}}], "object": {"created_at": "2026-09-28T14:39:00.086631133Z", "evidence": ["1b5558af-c192-4753-8eec-1257ec210ce6", "b9bd907f-b461-443d-8ebe-a7d421524b8a"], "id": "9bcf0658-bb38-5118-9a5c-68d807745540", "kind": "Table", "name": "currency", "properties": {"columns": [{"data_type": "CHAR(3)", "name": "curr"}, {"data_type": "TEXT", "name": "description"}], "description": "This table holds the list of currencies available for posting in the system;\nit mostly serves as the canonical definition of currency codes.", "sql_comment": "This table holds the list of currencies available for posting in the system;\nit mostly serves as the canonical definition of currency codes."}}, "relationships": [{"created_at": "2026-09-16T14:59:23.838632881Z", "evidence": ["0f76037d-997f-51d9-9da2-0654671c0713"], "from": "0dc683d2-0579-50c5-bed3-a40f949379ad", "id": "414f75c0-1423-5 …
```

### 202. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `eca_to_location`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'eca_to_location'"}`  
**Result:** ok, 648 ms

```json
{"count": 1, "rows": [{"id": "be13d243-a016-5b14-ba59-545dae283bc3", "kind": "Table", "name": "eca_to_location"}]}
```

### 203. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `eca_to_location`  
**Arguments:** `{"id": "be13d243-a016-5b14-ba59-545dae283bc3"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:05.327246029Z", "fragment": "CREATE TABLE eca_to_location", "id": "0c6c9923-3125-4179-85ce-cd90906453ec", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:54.781874638Z", "fragment": "COMMENT ON TABLE eca_to_location IS This table is used for locations bound to contracts.  For generic contact\naddresses, use entity_to_location instead", "id": "3839507b-c8a2-4f69-a40d-a72087b63542", "location": {"column": null, "line": 597, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.110388505Z", "evidence": ["0c6c9923-3125-4179-85ce-cd90906453ec", "3839507b-c8a2-4f69-a40d-a72087b63542"], "id": "be13d243-a016-5b14-ba59-545dae283bc3", "kind": "Table", "name": "eca_to_location", "properties": {"columns": [{"data_type": "INTEGER", "name": "location_id"}, {"data_type": "INTEGER", "name": "location_class"}, {"data_type": "INTEGER", "name": "credit_id"}], "description": "This table is used for locations bound to contracts.  For generic contact\naddresses, use entity_to_location instead", "sql_comment": "This table is used for locations bound to contracts.  For generic contact\naddresses, use entity_to_location instead"}}, "relationships": [{"created_at": "2026-09-28T14:39:53.222215717Z", "evidence": ["c03e3eb4-0624-4e52-9a43-98f0e86e1da6"], "from": "be13d243-a016-5b14-ba59-545dae283bc3", "id": "2719fc74-00ed-5640-9744-c63 …
```

### 204. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `entity`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'entity'"}`  
**Result:** ok, 643 ms

```json
{"count": 1, "rows": [{"id": "3993d440-1c22-52d8-8367-30854bbe7119", "kind": "Table", "name": "entity"}]}
```

### 205. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `entity`  
**Arguments:** `{"id": "3993d440-1c22-52d8-8367-30854bbe7119"}`  
**Result:** ok, 14 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:02.267832258Z", "fragment": "CREATE TABLE entity", "id": "5c851e6d-bda6-41a6-8d14-66911cf88fdc", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:03.604420869Z", "fragment": "COMMENT ON TABLE entity IS The primary entity table to map to all contacts", "id": "4e4985f9-206c-4b2f-844a-871f88d0d2b1", "location": {"column": null, "line": 230, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:13.718224073Z", "fragment": "COMMENT ON COLUMN entity.name IS This is the common name of an entity. If it was a person it may be Joshua Drake, a company Acme Corp. You may also choose to use a domain such as commandprompt.com", "id": "5a8ceacd-4d5f-4e27-bfe7-b8e88239d301", "location": {"column": null, "line": 231, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.273744366Z", "fragment": "COMMENT ON TABLE entity IS The primary entity table to map to all contacts", "id": "e2cd50d7-4acd-4c5a-af06-8b2c7f12f841", "location": {"column": null, "line": 559, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.862471118Z", "evidence": ["5c851e6d-bda6-41a6-8d14-66911cf88fdc", "4e4985f9-206c-4b2f-844a-871f88d0d2b1", "5a8ceacd-4d5f-4e27-bfe7-b8e88239d301", "e2cd50d7-4acd-4c5a-af06-8b2c7f12f841"], "id": "3993d440-1c22-52d8-8367-30854bbe7119", "kind": "Table", "name …
```

### 206. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `entity_class`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'entity_class'"}`  
**Result:** ok, 646 ms

```json
{"count": 1, "rows": [{"id": "9a74248d-a8ff-5ba5-ae20-fd280d091bfc", "kind": "Table", "name": "entity_class"}]}
```

### 207. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `entity_class`  
**Arguments:** `{"id": "9a74248d-a8ff-5ba5-ae20-fd280d091bfc"}`  
**Result:** ok, 6 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:06.831680180Z", "fragment": "CREATE TABLE entity_class", "id": "4dd721b2-9e7b-4e78-95ba-3b1f0dd43f30", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:53.860772223Z", "fragment": "COMMENT ON TABLE entity_class IS Defines the class type such as vendor, customer, contact, employee", "id": "05143514-bf8c-429a-863b-6c9ee025241c", "location": {"column": null, "line": 214, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:12.464091797Z", "fragment": "COMMENT ON COLUMN entity_class.id IS The first 7 values are reserved and\npermanent.  Individuals who create new classes, however, should coordinate\nwith others for ranges to use.", "id": "41c88040-f4c1-4f25-a78c-85068a09af05", "location": {"column": null, "line": 215, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.851703971Z", "evidence": ["4dd721b2-9e7b-4e78-95ba-3b1f0dd43f30", "05143514-bf8c-429a-863b-6c9ee025241c", "41c88040-f4c1-4f25-a78c-85068a09af05"], "id": "9a74248d-a8ff-5ba5-ae20-fd280d091bfc", "kind": "Table", "name": "entity_class", "properties": {"columns": [{"data_type": "serial", "description": "The first 7 values are reserved and\npermanent.  Individuals who create new classes, however, should coordinate\nwith others for ranges to use.", "name": "id"}, {"data_type": "TEXT", "name": "class"}, {"data_type": "BO …
```

### 208. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `entity_credit_account`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'entity_credit_account'"}`  
**Result:** ok, 644 ms

```json
{"count": 1, "rows": [{"id": "dd5393ba-4a3d-54cb-a816-be338e0cc992", "kind": "Table", "name": "entity_credit_account"}]}
```

### 209. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `entity_credit_account`  
**Arguments:** `{"id": "dd5393ba-4a3d-54cb-a816-be338e0cc992"}`  
**Result:** ok, 11 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:16.607633312Z", "fragment": "CREATE TABLE entity_credit_account", "id": "3d6c370b-c39c-4980-b463-a18bbcfbb4b4", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.507475761Z", "fragment": "COMMENT ON TABLE entity_credit_account IS This table stores information relating to general relationships regarding\nmoneys owed on invoice.  Invoices, whether AR or AP, must be attached to\na record in this table.", "id": "5f5cebc4-5a6a-4eed-b65d-ac7af5bcfd5e", "location": {"column": null, "line": 560, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:17.063500019Z", "fragment": "COMMENT ON COLUMN entity_credit_account.meta_number IS This stores the human readable control code for the customer/vendor record.\nThis is typically called the customer/vendor \"account\" in the application.", "id": "a87dc35d-31db-458c-a07f-300dd503ce0e", "location": {"column": null, "line": 565, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.080923476Z", "evidence": ["3d6c370b-c39c-4980-b463-a18bbcfbb4b4", "5f5cebc4-5a6a-4eed-b65d-ac7af5bcfd5e", "a87dc35d-31db-458c-a07f-300dd503ce0e"], "id": "dd5393ba-4a3d-54cb-a816-be338e0cc992", "kind": "Table", "name": "entity_credit_account", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "INT", "name": "entity_id"}, {"data_type": " …
```

### 210. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `gl`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'gl'"}`  
**Result:** ok, 641 ms

```json
{"count": 1, "rows": [{"id": "411f9c4b-8946-54f1-8783-0b6c3adfcee7", "kind": "Table", "name": "gl"}]}
```

### 211. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `gl`  
**Arguments:** `{"id": "411f9c4b-8946-54f1-8783-0b6c3adfcee7"}`  
**Result:** ok, 5 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:56.720187449Z", "fragment": "CREATE TABLE gl", "id": "22e50473-40bb-473e-a864-ae50bd3be7b6", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:54.869622700Z", "fragment": "COMMENT ON TABLE gl IS This table holds summary information for entries in the general journal.\nDoes not hold summary information in 1.3 for AR or AP entries.", "id": "eec4d760-3787-4f2f-92da-e008f6f6f680", "location": {"column": null, "line": 991, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:02.853381365Z", "fragment": "COMMENT ON COLUMN gl.person_id IS the person_id of the employee who created\nthe entry.", "id": "2dbfe517-e828-47b5-aa22-146e06b687f8", "location": {"column": null, "line": 995, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.444194500Z", "evidence": ["22e50473-40bb-473e-a864-ae50bd3be7b6", "eec4d760-3787-4f2f-92da-e008f6f6f680", "2dbfe517-e828-47b5-aa22-146e06b687f8"], "id": "411f9c4b-8946-54f1-8783-0b6c3adfcee7", "kind": "Table", "name": "gl", "properties": {"columns": [{"data_type": "INT", "name": "id"}, {"data_type": "TEXT", "name": "reference"}, {"data_type": "TEXT", "name": "description"}, {"data_type": "DATE", "name": "transdate"}, {"data_type": "INTEGER", "description": "the person_id of the employee who created\nthe entry.", "name": "person_id"}, {"data_type": "TEXT",  …
```

### 212. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `inventory_report`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'inventory_report'"}`  
**Result:** ok, 640 ms

```json
{"count": 1, "rows": [{"id": "6b9e7416-2185-5be6-86c8-783c3aee5207", "kind": "Table", "name": "inventory_report"}]}
```

### 213. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `inventory_report`  
**Arguments:** `{"id": "6b9e7416-2185-5be6-86c8-783c3aee5207"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:16.399998263Z", "fragment": "CREATE TABLE inventory_report", "id": "fe528846-51cf-4087-9778-7790a5e6cccc", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.630904851Z", "evidence": ["fe528846-51cf-4087-9778-7790a5e6cccc"], "id": "6b9e7416-2185-5be6-86c8-783c3aee5207", "kind": "Table", "name": "inventory_report", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "DATE", "name": "transdate"}, {"data_type": "TEXT", "name": "source"}, {"data_type": "INT", "name": "ar_trans_id"}, {"data_type": "INT", "name": "ap_trans_id"}]}}, "relationships": [{"created_at": "2026-09-16T14:59:23.838880958Z", "evidence": ["f5e7e8b9-9b8e-5cc0-a38b-4b9dd138d86a"], "from": "f9909e05-f2e1-5e65-982f-ecce68ba1eb7", "id": "6d604d09-ccbc-55c5-a162-16ee277d6604", "kind": "ReadsFrom", "properties": {}, "to": "6b9e7416-2185-5be6-86c8-783c3aee5207", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.838430899Z", "evidence": ["7a1b6426-2dbe-5d90-9f03-78f55d32e58a"], "from": "6f642978-3e19-5182-af1f-b15ff1274232", "id": "96e665e5-38f5-5279-bba9-1c62b37476c2", "kind": "ReadsFrom", "properties": {}, "to": "6b9e7416-2185-5be6-86c8-783c3aee5207", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.839576440Z", "evidence": ["8cc02ec4-21e5-5907-b3b4-b7d59c38758b"], "from": "a6869a5e-5717-5a7d-90c8- …
```

### 214. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `inventory_report_line`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'inventory_report_line'"}`  
**Result:** ok, 644 ms

```json
{"count": 1, "rows": [{"id": "0f8e2bad-af2f-5d34-921c-14e60709a98b", "kind": "Table", "name": "inventory_report_line"}]}
```

### 215. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `inventory_report_line`  
**Arguments:** `{"id": "0f8e2bad-af2f-5d34-921c-14e60709a98b"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:04.616208076Z", "fragment": "CREATE TABLE inventory_report_line", "id": "ae72de2d-f711-4189-ba94-fbd1152ec16e", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.648577945Z", "evidence": ["ae72de2d-f711-4189-ba94-fbd1152ec16e"], "id": "0f8e2bad-af2f-5d34-921c-14e60709a98b", "kind": "Table", "name": "inventory_report_line", "properties": {"columns": [{"data_type": "INT", "name": "adjust_id"}, {"data_type": "INT", "name": "parts_id"}, {"data_type": "NUMERIC", "name": "counted"}, {"data_type": "NUMERIC", "name": "expected"}, {"data_type": "NUMERIC", "name": "variance"}]}}, "relationships": [{"created_at": "2026-09-28T14:39:54.081192994Z", "evidence": ["8c4b3513-fc60-4e46-b8bf-f1f4e3a685f5"], "from": "0f8e2bad-af2f-5d34-921c-14e60709a98b", "id": "63acbbec-841d-5a3b-a075-a08da5f3f657", "kind": "ForeignKey", "properties": {"fk_desc": "inventory_report_line.parts_id → parts.id"}, "to": "13575f92-6f74-5533-8a33-04ceabd3b710", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.838036434Z", "evidence": ["16dd4120-05e7-52ae-a8bc-8cf211309b2e"], "from": "478d75e3-12ec-507a-b90b-d0f04c793424", "id": "9fab1efa-9a77-5cd4-bb0a-a9897790552f", "kind": "ReadsFrom", "properties": {}, "to": "0f8e2bad-af2f-5d34-921c-14e60709a98b", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:39:54.073979811Z", "evidence": [" …
```

### 216. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `invoice`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'invoice'"}`  
**Result:** ok, 645 ms

```json
{"count": 1, "rows": [{"id": "007811f7-d983-545d-9927-998a016f81da", "kind": "Table", "name": "invoice"}]}
```

### 217. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `invoice`  
**Arguments:** `{"id": "007811f7-d983-545d-9927-998a016f81da"}`  
**Result:** ok, 5 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:10.287927477Z", "fragment": "CREATE TABLE invoice", "id": "55e8d31e-b7a0-43b0-8c4d-68f8f5eab0e5", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:14.875694948Z", "fragment": "COMMENT ON TABLE invoice IS Line items of invoices with goods/services attached.", "id": "e4b7a9cb-c277-439f-ae07-e95d4a483d0d", "location": {"column": null, "line": 1264, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:11.714116803Z", "fragment": "COMMENT ON COLUMN invoice.allocated IS Number of allocated items, negative relative to qty.\nWhen qty + allocated = 0, then the item is fully used for purposes of COGS\ncalculations.", "id": "9fbe2725-5e47-4db2-bc0a-925bf40d9a73", "location": {"column": null, "line": 1267, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:06.013662549Z", "fragment": "COMMENT ON COLUMN invoice.qty IS Positive is normal for sales invoices, negative for vendor invoices.", "id": "71a975b1-def0-4221-9cf4-9ad7af2a36b3", "location": {"column": null, "line": 1272, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.562350256Z", "evidence": ["55e8d31e-b7a0-43b0-8c4d-68f8f5eab0e5", "e4b7a9cb-c277-439f-ae07-e95d4a483d0d", "9fbe2725-5e47-4db2-bc0a-925bf40d9a73", "71a975b1-def0-4221-9cf4-9ad7af2a36b3"], "id": "007811f7-d983-545d-9927-998a016f81da", …
```

### 218. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `location`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'location'"}`  
**Result:** ok, 632 ms

```json
{"count": 1, "rows": [{"id": "4bd59c1f-3554-5637-8606-52cdb89bac7d", "kind": "Table", "name": "location"}]}
```

### 219. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `location`  
**Arguments:** `{"id": "4bd59c1f-3554-5637-8606-52cdb89bac7d"}`  
**Result:** ok, 6 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:07.136881077Z", "fragment": "CREATE TABLE location", "id": "e8c069a4-a94e-43b3-8225-c4aa8d50b8bd", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:05.502933454Z", "fragment": "COMMENT ON TABLE location IS This table stores addresses, such as shipto and bill to addresses.", "id": "114d6fe4-b607-4193-acbb-6ed378f12066", "location": {"column": null, "line": 399, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.962474595Z", "evidence": ["e8c069a4-a94e-43b3-8225-c4aa8d50b8bd", "114d6fe4-b607-4193-acbb-6ed378f12066"], "id": "4bd59c1f-3554-5637-8606-52cdb89bac7d", "kind": "Table", "name": "location", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "line_one"}, {"data_type": "TEXT", "name": "line_two"}, {"data_type": "TEXT", "name": "line_three"}, {"data_type": "TEXT", "name": "city"}, {"data_type": "TEXT", "name": "state"}, {"data_type": "INTEGER", "name": "country_id"}, {"data_type": "TEXT", "name": "mail_code"}, {"data_type": "DATE", "name": "created"}, {"data_type": "TIMESTAMP", "name": "inactive_date"}, {"data_type": "BOOLEAN", "name": "active"}], "description": "This table stores addresses, such as shipto and bill to addresses.", "sql_comment": "This table stores addresses, such as shipto and bill to addresses."}}, "relationships": [{"created_at": "2026-09- …
```

### 220. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `oe`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'oe'"}`  
**Result:** ok, 638 ms

```json
{"count": 1, "rows": [{"id": "d1b46d64-5445-5e88-ae13-d18e0e8fbb23", "kind": "Table", "name": "oe"}]}
```

### 221. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `oe`  
**Arguments:** `{"id": "d1b46d64-5445-5e88-ae13-d18e0e8fbb23"}`  
**Result:** ok, 6 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:14.923657131Z", "fragment": "CREATE TABLE oe", "id": "9d002a7c-9581-43e2-9c49-b12a5ca4ca80", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.151513715Z", "fragment": "COMMENT ON TABLE oe IS Header information for:\n* Sales orders\n* Purchase Orders\n* Quotations\n* Requests for Quotation", "id": "1520f399-106f-454a-8e78-103a80d912b0", "location": {"column": null, "line": 1614, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.710050521Z", "evidence": ["9d002a7c-9581-43e2-9c49-b12a5ca4ca80", "1520f399-106f-454a-8e78-103a80d912b0"], "id": "d1b46d64-5445-5e88-ae13-d18e0e8fbb23", "kind": "Table", "name": "oe", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "ordnumber"}, {"data_type": "DATE", "name": "transdate"}, {"data_type": "INTEGER", "name": "entity_id"}, {"data_type": "NUMERIC", "name": "amount"}, {"data_type": "NUMERIC", "name": "netamount"}, {"data_type": "DATE", "name": "reqdate"}, {"data_type": "BOOL", "name": "taxincluded"}, {"data_type": "TEXT", "name": "shippingpoint"}, {"data_type": "TEXT", "name": "notes"}, {"data_type": "CHAR(3)", "name": "curr"}, {"data_type": "INTEGER", "name": "person_id"}, {"data_type": "BOOL", "name": "closed"}, {"data_type": "BOOL", "name": "quotation"}, {"data_type": "TEXT", "name": "quonumber"}, {"data_type": "TEXT", …
```

### 222. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `oe_class`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'oe_class'"}`  
**Result:** ok, 639 ms

```json
{"count": 1, "rows": [{"id": "ee5ad1c8-a825-5255-a204-aa9e74be7ed6", "kind": "Table", "name": "oe_class"}]}
```

### 223. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `oe_class`  
**Arguments:** `{"id": "ee5ad1c8-a825-5255-a204-aa9e74be7ed6"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:05.306681071Z", "fragment": "CREATE TABLE oe_class", "id": "7d195ee5-d040-427d-89c5-74c7425ebd96", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:00.636558894Z", "fragment": "COMMENT ON TABLE oe_class IS Hardwired classifications for orders and quotations.\nCoordinate before adding.", "id": "95e861e3-b61e-4f1b-ae46-54e8256f3a75", "location": {"column": null, "line": 1585, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.699381572Z", "evidence": ["7d195ee5-d040-427d-89c5-74c7425ebd96", "95e861e3-b61e-4f1b-ae46-54e8256f3a75"], "id": "ee5ad1c8-a825-5255-a204-aa9e74be7ed6", "kind": "Table", "name": "oe_class", "properties": {"columns": [{"data_type": "SMALLINT", "name": "id"}, {"data_type": "TEXT", "name": "oe_class"}], "description": "Hardwired classifications for orders and quotations.\nCoordinate before adding.", "sql_comment": "Hardwired classifications for orders and quotations.\nCoordinate before adding."}}, "relationships": [{"created_at": "2026-09-16T14:59:23.839077143Z", "evidence": ["062ae994-abdb-56f7-b9e2-f430e4406ce2"], "from": "7bc096c6-f0ca-5b18-93d7-21a610c71769", "id": "8fdb48e9-989b-5f80-bf21-9eef77ee6115", "kind": "ReadsFrom", "properties": {}, "to": "ee5ad1c8-a825-5255-a204-aa9e74be7ed6", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:39:54.220069269Z", "eviden …
```

### 224. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `open_item`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'open_item'"}`  
**Result:** ok, 637 ms

```json
{"count": 1, "rows": [{"id": "4050340b-d85d-5da8-960c-74d76fc458a6", "kind": "Table", "name": "open_item"}]}
```

### 225. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `open_item`  
**Arguments:** `{"id": "4050340b-d85d-5da8-960c-74d76fc458a6"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:10.243642391Z", "fragment": "CREATE TABLE open_item", "id": "710bee82-0a22-4381-ba3f-6b87873220a7", "location": {"column": null, "line": null, "path": "sql/changes/1.14/open-item-tracking.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:56.524492477Z", "fragment": "COMMENT ON TABLE open_item IS Allows tracking of items to be cleared/handled in subsequent transactions.", "id": "9e1412c7-8c41-452d-adb0-fd0a62096f5f", "location": {"column": null, "line": 93, "path": "sql/changes/1.14/open-item-tracking.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.073688618Z", "fragment": "COMMENT ON COLUMN open_item.id IS Internal identifier for the open item.", "id": "4c822d38-09ed-47dd-8765-9154bd13f6f6", "location": {"column": null, "line": 96, "path": "sql/changes/1.14/open-item-tracking.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:08.713944458Z", "fragment": "COMMENT ON COLUMN open_item.item_number IS Identifier as presented in the user interface.", "id": "be611c6e-4fd7-47dc-802b-1ca006aac3e1", "location": {"column": null, "line": 98, "path": "sql/changes/1.14/open-item-tracking.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:13.359453678Z", "fragment": "COMMENT ON COLUMN open_item.item_type IS Type of open item; currently 'gl','ar' or 'ap'.", "id": "f7bb2ab8-8608-4988-a205-ed800481a7b9", "location": {"column": null, "line": 100, "path": "sql/changes/1.14/open-item-track …
```

### 226. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `orderitems`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'orderitems'"}`  
**Result:** ok, 640 ms

```json
{"count": 1, "rows": [{"id": "cd6546c8-7658-5a84-ab3a-1f557f383cd2", "kind": "Table", "name": "orderitems"}]}
```

### 227. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `orderitems`  
**Arguments:** `{"id": "cd6546c8-7658-5a84-ab3a-1f557f383cd2"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:05.652626008Z", "fragment": "CREATE TABLE orderitems", "id": "adcdc443-a64b-4351-b04b-a7ba035b536a", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:55.930779863Z", "fragment": "COMMENT ON TABLE orderitems IS Line items for sales/purchase orders and quotations.", "id": "3c007468-7d96-4d1c-87fb-e0835622e4bb", "location": {"column": null, "line": 1637, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.721288610Z", "evidence": ["adcdc443-a64b-4351-b04b-a7ba035b536a", "3c007468-7d96-4d1c-87fb-e0835622e4bb"], "id": "cd6546c8-7658-5a84-ab3a-1f557f383cd2", "kind": "Table", "name": "orderitems", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "INT", "name": "trans_id"}, {"data_type": "INT", "name": "parts_id"}, {"data_type": "TEXT", "name": "description"}, {"data_type": "NUMERIC", "name": "qty"}, {"data_type": "NUMERIC", "name": "sellprice"}, {"data_type": "INT", "name": "precision"}, {"data_type": "NUMERIC", "name": "discount"}, {"data_type": "VARCHAR(5)", "name": "unit"}, {"data_type": "DATE", "name": "reqdate"}, {"data_type": "NUMERIC", "name": "ship"}, {"data_type": "TEXT", "name": "serialnumber"}, {"data_type": "TEXT", "name": "notes"}], "description": "Line items for sales/purchase orders and quotations.", "sql_comment": "Line items for sales/purchase orders and quotations. …
```

### 228. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `parts`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'parts'"}`  
**Result:** ok, 645 ms

```json
{"count": 1, "rows": [{"id": "13575f92-6f74-5533-8a33-04ceabd3b710", "kind": "Table", "name": "parts"}]}
```

### 229. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `parts`  
**Arguments:** `{"id": "13575f92-6f74-5533-8a33-04ceabd3b710"}`  
**Result:** ok, 11 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:58.210491963Z", "fragment": "CREATE TABLE parts", "id": "a2332429-4a27-4cf6-b3b5-cc148b8e9562", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:59.758154187Z", "fragment": "COMMENT ON TABLE parts IS This stores detail information about goods and services.  The type of part\nis currently defined according to the following rules:\n* If assembly is true, then an assembly\n* If inventory_accno_id, income_accno_id, and expense_accno_id are not null then\n  a part.\n* If inventory_accno_id is null but the other two are not, then a service.\n* Otherwise, a labor/overhead entry.", "id": "b44c7fc0-1beb-49d1-8a11-1ba36e6977e1", "location": {"column": null, "line": 1195, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.797982446Z", "fragment": "COMMENT ON COLUMN parts.rop IS Re-order point.  Used to select parts for short inventory report.", "id": "96ee23a5-a002-4bd3-893a-93ffe0cb8691", "location": {"column": null, "line": 1205, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:15.986640429Z", "fragment": "COMMENT ON COLUMN parts.bin IS Text identifier for where a part is stored.", "id": "7e097481-3f74-4b2f-b2a5-d98ca4795070", "location": {"column": null, "line": 1208, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:16.071517373Z", "f …
```

### 230. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `partsgroup`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'partsgroup'"}`  
**Result:** ok, 641 ms

```json
{"count": 1, "rows": [{"id": "1feb9c21-7673-59d0-9266-ba8cf1c065ab", "kind": "Table", "name": "partsgroup"}]}
```

### 231. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `partsgroup`  
**Arguments:** `{"id": "1feb9c21-7673-59d0-9266-ba8cf1c065ab"}`  
**Result:** ok, 5 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:08.103866099Z", "fragment": "CREATE TABLE partsgroup", "id": "8b161ff4-b534-4223-8477-2d346e166d2c", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:08.371432587Z", "fragment": "COMMENT ON TABLE partsgroup IS Groups of parts for Point of Sale screen.", "id": "249043af-7b68-4f73-a6a3-a4e91fe8f1ef", "location": {"column": null, "line": 1803, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.877391182Z", "evidence": ["8b161ff4-b534-4223-8477-2d346e166d2c", "249043af-7b68-4f73-a6a3-a4e91fe8f1ef"], "id": "1feb9c21-7673-59d0-9266-ba8cf1c065ab", "kind": "Table", "name": "partsgroup", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "partsgroup"}, {"data_type": "INT", "name": "parent"}], "description": "Groups of parts for Point of Sale screen.", "sql_comment": "Groups of parts for Point of Sale screen."}}, "relationships": [{"created_at": "2026-09-16T14:59:23.839744968Z", "evidence": ["226187f4-0a33-5028-b2a0-edbb695e4a38"], "from": "2412ef55-d1f2-50be-9a60-b6a17caec760", "id": "1976c3d6-8fc8-5b4d-a67f-af72cd50cc47", "kind": "ReadsFrom", "properties": {}, "to": "1feb9c21-7673-59d0-9266-ba8cf1c065ab", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.838853370Z", "evidence": ["e76295cd-ff2c-566f-a85b-ab36d57d5635"], "from": "095d2cd5-623 …
```

### 232. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `partstax`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'partstax'"}`  
**Result:** ok, 643 ms

```json
{"count": 1, "rows": [{"id": "2ea7f176-56d7-5564-831c-2bb5449d91d4", "kind": "Table", "name": "partstax"}]}
```

### 233. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `partstax`  
**Arguments:** `{"id": "2ea7f176-56d7-5564-831c-2bb5449d91d4"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:14.551146428Z", "fragment": "CREATE TABLE partstax", "id": "b6d02f38-9460-458b-8844-3985c7e09a2e", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.317725090Z", "fragment": "COMMENT ON TABLE partstax IS Mapping of parts to taxes.", "id": "b71f19b3-6247-4545-8b58-bc673a08ccac", "location": {"column": null, "line": 1538, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.674916091Z", "evidence": ["b6d02f38-9460-458b-8844-3985c7e09a2e", "b71f19b3-6247-4545-8b58-bc673a08ccac"], "id": "2ea7f176-56d7-5564-831c-2bb5449d91d4", "kind": "Table", "name": "partstax", "properties": {"columns": [{"data_type": "INT", "name": "parts_id"}, {"data_type": "INT", "name": "chart_id"}, {"data_type": "INT", "name": "taxcategory_id"}], "description": "Mapping of parts to taxes.", "sql_comment": "Mapping of parts to taxes."}}, "relationships": [{"created_at": "2026-09-28T14:39:54.096064950Z", "evidence": ["162bfc25-ca81-454e-bd61-f4467ba91715"], "from": "2ea7f176-56d7-5564-831c-2bb5449d91d4", "id": "527c92bf-114e-5ce0-a713-5359d7b6688d", "kind": "ForeignKey", "properties": {"fk_desc": "partstax.parts_id → parts.id"}, "to": "13575f92-6f74-5533-8a33-04ceabd3b710", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-28T14:39:54.103943794Z", "evidence": ["7037b26f-7ccb-45ed-835b-e06698340d89"], "from": "2ea7f176-56d7 …
```

### 234. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `payment`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'payment'"}`  
**Result:** ok, 636 ms

```json
{"count": 1, "rows": [{"id": "c600e4f4-f88b-5d21-94ac-7d918d48dcf3", "kind": "Table", "name": "payment"}]}
```

### 235. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `payment`  
**Arguments:** `{"id": "c600e4f4-f88b-5d21-94ac-7d918d48dcf3"}`  
**Result:** ok, 5 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:12.343506048Z", "fragment": "CREATE TABLE payment", "id": "cbac2b83-c419-4fe7-ab7e-17bdb7ff463a", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:57.929682239Z", "fragment": "COMMENT ON TABLE payment IS This table will store the main data on a payment, prepayment, overpayment, et", "id": "ae6aeb42-84de-47ce-a828-ee0090b785b3", "location": {"column": null, "line": 3417, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:05.535891194Z", "fragment": "COMMENT ON COLUMN payment.reference IS This field will store the code for both receipts and payment order", "id": "cd400e8f-8e91-481a-910f-ee3dbc59644c", "location": {"column": null, "line": 3418, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:13.618236318Z", "fragment": "COMMENT ON COLUMN payment.closed IS This will store the current state of a payment/receipt order", "id": "b15ee1fa-ecb6-42e3-9e89-06e18ad48ca6", "location": {"column": null, "line": 3419, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:05.812947211Z", "fragment": "COMMENT ON COLUMN payment.gl_id IS A payment should always be linked to a GL movement", "id": "c78f5705-9edd-4d86-b9b6-941ac9c5ae1f", "location": {"column": null, "line": 3420, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:4 …
```

### 236. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `tax`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'tax'"}`  
**Result:** ok, 637 ms

```json
{"count": 1, "rows": [{"id": "1ae6e156-42d7-5a40-abda-6c86b441ef29", "kind": "Table", "name": "tax"}]}
```

### 237. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `tax`  
**Arguments:** `{"id": "1ae6e156-42d7-5a40-abda-6c86b441ef29"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:57.409108268Z", "fragment": "CREATE TABLE tax", "id": "1a1444e5-0e28-4ded-bcb6-d61ff9632956", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:37:56.921494202Z", "fragment": "COMMENT ON TABLE tax IS Information on tax rates.", "id": "afb65bc6-d20d-438e-b1cf-858e0df5f588", "location": {"column": null, "line": 1554, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:14.210512944Z", "fragment": "COMMENT ON COLUMN tax.pass IS This is an integer indicating the pass of the tax. This is to support\ncumultative sales tax rules (for example, Quebec charging taxes on the federal\ntaxes collected).", "id": "6eed3f9c-5003-454f-9219-7b2cb006007d", "location": {"column": null, "line": 1557, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.682271122Z", "evidence": ["1a1444e5-0e28-4ded-bcb6-d61ff9632956", "afb65bc6-d20d-438e-b1cf-858e0df5f588", "6eed3f9c-5003-454f-9219-7b2cb006007d"], "id": "1ae6e156-42d7-5a40-abda-6c86b441ef29", "kind": "Table", "name": "tax", "properties": {"columns": [{"data_type": "INT", "name": "chart_id"}, {"data_type": "NUMERIC", "name": "rate"}, {"data_type": "NUMERIC", "name": "minvalue"}, {"data_type": "NUMERIC", "name": "maxvalue"}, {"data_type": "TEXT", "name": "taxnumber"}, {"data_type": "TIMESTAMP", "name": "validto"}, {"data_type": "INTEGER", "description": …
```

### 238. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `trans_type`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'trans_type'"}`  
**Result:** ok, 640 ms

```json
{"count": 1, "rows": [{"id": "0d3c2be1-0fce-5594-bc86-61952763202b", "kind": "Table", "name": "trans_type"}]}
```

### 239. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `trans_type`  
**Arguments:** `{"id": "0d3c2be1-0fce-5594-bc86-61952763202b"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:13.408017267Z", "fragment": "CREATE TABLE trans_type", "id": "6bd3adc8-d7b4-4768-b765-434f3f560536", "location": {"column": null, "line": null, "path": "sql/changes/1.6/gl-trans-type.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:11.418074384Z", "fragment": "COMMENT ON TABLE trans_type IS Documents the transaction type codes used in the 'gl' table.\n\nPlease note that the codes in this table are hard-coded into other\n(SQL) parts of the application. As such, this table merely serves\nas documentation; do *not* modify its content other than inserting\nnew codes.", "id": "e468b5ec-cfed-49f2-ba52-3ab3ff359b08", "location": {"column": null, "line": 7, "path": "sql/changes/1.6/gl-trans-type.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:07.471039671Z", "fragment": "COMMENT ON COLUMN trans_type.code IS Code of the transaction type. The 72 alphanumeric codes starting\nwith 'x' or 'X' are reserved for custom internal extensions.\n\nFor extensions distributed for wide(r) use, please request a code\nfrom the LedgerSMB development team.", "id": "a7881b28-0d15-4ed0-8514-98308ab8343a", "location": {"column": null, "line": 15, "path": "sql/changes/1.6/gl-trans-type.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:07.420955838Z", "fragment": "COMMENT ON COLUMN trans_type.description IS This column contains the full documentation as to the origin\nand purpose of the transaction type.", "id" …
```

### 240. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `transactions`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'transactions'"}`  
**Result:** ok, 643 ms

```json
{"count": 1, "rows": [{"id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38", "kind": "Table", "name": "transactions"}]}
```

### 241. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `transactions`  
**Arguments:** `{"id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38"}`  
**Result:** ok, 9 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:38:12.691082215Z", "fragment": "CREATE TABLE transactions", "id": "971e753e-1515-4cd4-b0cb-9e45ba93bfef", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:12.686200978Z", "fragment": "COMMENT ON TABLE transactions IS This table provides referential integrity between AR, AP, GL tables on one\nhand and acc_trans on the other, pending the refactoring of those tables.  It\nalso is used to provide discretionary locking of financial transactions across\ndatabase connections, for example in batch payment workflows.", "id": "7caa0c59-3c1e-440b-852b-9e02132a0ef3", "location": {"column": null, "line": 308, "path": "sql/Pg-database.sql"}}, {"confidence": 1.0, "created_at": "2026-09-28T14:38:10.189559073Z", "fragment": "COMMENT ON COLUMN transactions.locked_by IS This should only be used in pessimistic locking measures as required by large\nbatch work flows.", "id": "58d32d2d-3afe-44f1-9201-eea476bc1d20", "location": {"column": null, "line": 338, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:46.908817167Z", "evidence": ["971e753e-1515-4cd4-b0cb-9e45ba93bfef", "7caa0c59-3c1e-440b-852b-9e02132a0ef3", "58d32d2d-3afe-44f1-9201-eea476bc1d20"], "id": "eeb63b84-6b6b-5bd7-8283-67bc35274b38", "kind": "Table", "name": "transactions", "properties": {"columns": [{"data_type": "INT", "name": "id"}, {"data_type": "TEXT", "name": "t …
```

### 242. `ekos_ekl` — 8-documentation

**Why:** dbt docs: locate `warehouse`  
**Arguments:** `{"query": "FIND Object WHERE kind = 'Table' AND name = 'warehouse'"}`  
**Result:** ok, 636 ms

```json
{"count": 1, "rows": [{"id": "cb63feeb-3d78-5175-8948-db542ce600da", "kind": "Table", "name": "warehouse"}]}
```

### 243. `ekos_state` — 8-documentation

**Why:** dbt docs: descriptions of `warehouse`  
**Arguments:** `{"id": "cb63feeb-3d78-5175-8948-db542ce600da"}`  
**Result:** ok, 4 ms

```json
{"evidence": [{"confidence": 1.0, "created_at": "2026-09-28T14:37:54.676679631Z", "fragment": "CREATE TABLE warehouse", "id": "f355a0d8-1bc2-4fde-9fff-c1afc4d94cb7", "location": {"column": null, "line": null, "path": "sql/Pg-database.sql"}}], "object": {"created_at": "2026-09-28T14:38:47.926357622Z", "evidence": ["f355a0d8-1bc2-4fde-9fff-c1afc4d94cb7"], "id": "cb63feeb-3d78-5175-8948-db542ce600da", "kind": "Table", "name": "warehouse", "properties": {"columns": [{"data_type": "serial", "name": "id"}, {"data_type": "TEXT", "name": "description"}]}}, "relationships": [{"created_at": "2026-09-28T14:39:54.792958459Z", "evidence": ["cfda4423-8e80-4f06-ae34-6cda8dfefbce"], "from": "6e2475a2-326b-529e-99dc-1eb7474eccbc", "id": "13a02980-74ea-5af7-8498-143387ee4e97", "kind": "ForeignKey", "properties": {"fk_desc": "asset_item.location_id → warehouse.id"}, "to": "cb63feeb-3d78-5175-8948-db542ce600da", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.839987458Z", "evidence": ["7409a82f-bf5e-591e-85fa-54d47c935330"], "from": "49312b51-74ab-5d74-b7dd-7fbf88d57aa2", "id": "7e01f7e3-49ab-586f-9c7f-0c7193c7070b", "kind": "ReadsFrom", "properties": {}, "to": "cb63feeb-3d78-5175-8948-db542ce600da", "valid_from": null, "valid_until": null}, {"created_at": "2026-09-16T14:59:23.840177497Z", "evidence": ["1591db61-4f66-54a5-9efb-9dd5d48df2f2"], "from": "465692b3-daca-5e4b-a4d5-8d046f435b7d", "id": "8ce0a240-c520-5e32-901e-0d51689a36e7", "kind": "ReadsFrom", "propertie …
```

### 244. `ekos ask` [cloud] — 2b-ask

**Question:** How does LedgerSMB compute the cost of goods sold for a sales invoice line?

**Why:** Needed to trust int_sales_lines: is COGS FIFO, and where is it posted?

**Answer** (851 ms, tokens None/None, 0 evidence refs):

> {"raw_stdout": "\u001b[2m2026-09-28T15:54:51.890341Z\u001b[0m \u001b[32m INFO\u001b[0m \u001b[2mekos::commands::recover\u001b[0m\u001b[2m:\u001b[0m using OpenAI provider with disk cache\n", "stderr": "w-full mx-auto mb-8 lg:px-8\">\n                        <div id=\"what-happened-section\" class=\"w-1/2 md:w-full\">\n                            <h2\n                                class=\"text-3xl leading-tight font-normal mb-4 text-black-dark antialiased\"\n                                data-translate=\"what_happened\"\n                            >\n                                What happened?\n                            </h2>\n                            \n        <p>The owner of this website (opencode.ai) has banned your access based on your browser's signature (a423eddefbb532e7-ua45).</p>\n    \n                            \n                            <p>\n                                Please see\n                                <a\n                                    rel=\"noopener noreferrer\"\n                                    href=\"https://developers.cloudflare.com/support/troubleshooting/http-status-codes/cloudflare-1xxx-errors/error-1010/\"\n                                    target=\"_blank\"\n                                    >https://developers.cloudflare.com/support/troubleshooting/http-status-codes/cloudflare-1xxx-errors/error-1010/</a\n                                >\n                                for more details.\n                         

### 245. `ekos ask` [cloud] — 2b-ask

**Question:** Which table stores general ledger journal lines, and how are debits and credits represented?

**Why:** Needed for the sign convention in stg_lsmb__journal_lines

**Answer** (715 ms, tokens None/None, 0 evidence refs):

> {"raw_stdout": "\u001b[2m2026-09-28T15:54:52.735113Z\u001b[0m \u001b[32m INFO\u001b[0m \u001b[2mekos::commands::recover\u001b[0m\u001b[2m:\u001b[0m using OpenAI provider with disk cache\n", "stderr": "w-full mx-auto mb-8 lg:px-8\">\n                        <div id=\"what-happened-section\" class=\"w-1/2 md:w-full\">\n                            <h2\n                                class=\"text-3xl leading-tight font-normal mb-4 text-black-dark antialiased\"\n                                data-translate=\"what_happened\"\n                            >\n                                What happened?\n                            </h2>\n                            \n        <p>The owner of this website (opencode.ai) has banned your access based on your browser's signature (a423ede37fb4063e-ua45).</p>\n    \n                            \n                            <p>\n                                Please see\n                                <a\n                                    rel=\"noopener noreferrer\"\n                                    href=\"https://developers.cloudflare.com/support/troubleshooting/http-status-codes/cloudflare-1xxx-errors/error-1010/\"\n                                    target=\"_blank\"\n                                    >https://developers.cloudflare.com/support/troubleshooting/http-status-codes/cloudflare-1xxx-errors/error-1010/</a\n                                >\n                                for more details.\n                         

### 246. `ekos ask` [cloud] — 2b-ask

**Question:** What is an open item in LedgerSMB and how are AR invoices settled by payments?

**Why:** Needed for int_open_item_balances and AR aging

**Answer** (720 ms, tokens None/None, 0 evidence refs):

> {"raw_stdout": "\u001b[2m2026-09-28T15:54:53.450454Z\u001b[0m \u001b[32m INFO\u001b[0m \u001b[2mekos::commands::recover\u001b[0m\u001b[2m:\u001b[0m using OpenAI provider with disk cache\n", "stderr": "w-full mx-auto mb-8 lg:px-8\">\n                        <div id=\"what-happened-section\" class=\"w-1/2 md:w-full\">\n                            <h2\n                                class=\"text-3xl leading-tight font-normal mb-4 text-black-dark antialiased\"\n                                data-translate=\"what_happened\"\n                            >\n                                What happened?\n                            </h2>\n                            \n        <p>The owner of this website (opencode.ai) has banned your access based on your browser's signature (a423ede7f9706aff-ua45).</p>\n    \n                            \n                            <p>\n                                Please see\n                                <a\n                                    rel=\"noopener noreferrer\"\n                                    href=\"https://developers.cloudflare.com/support/troubleshooting/http-status-codes/cloudflare-1xxx-errors/error-1010/\"\n                                    target=\"_blank\"\n                                    >https://developers.cloudflare.com/support/troubleshooting/http-status-codes/cloudflare-1xxx-errors/error-1010/</a\n                                >\n                                for more details.\n                         

### 247. `ekos ask` [cloud] — 2b-ask

**Question:** What does the inventory_report table record and how is a count variance posted?

**Why:** Needed for mart_stock_count_variance

**Answer** (752 ms, tokens None/None, 0 evidence refs):

> {"raw_stdout": "\u001b[2m2026-09-28T15:54:54.170779Z\u001b[0m \u001b[32m INFO\u001b[0m \u001b[2mekos::commands::recover\u001b[0m\u001b[2m:\u001b[0m using OpenAI provider with disk cache\n", "stderr": "w-full mx-auto mb-8 lg:px-8\">\n                        <div id=\"what-happened-section\" class=\"w-1/2 md:w-full\">\n                            <h2\n                                class=\"text-3xl leading-tight font-normal mb-4 text-black-dark antialiased\"\n                                data-translate=\"what_happened\"\n                            >\n                                What happened?\n                            </h2>\n                            \n        <p>The owner of this website (opencode.ai) has banned your access based on your browser's signature (a423edecafb93cd0-ua45).</p>\n    \n                            \n                            <p>\n                                Please see\n                                <a\n                                    rel=\"noopener noreferrer\"\n                                    href=\"https://developers.cloudflare.com/support/troubleshooting/http-status-codes/cloudflare-1xxx-errors/error-1010/\"\n                                    target=\"_blank\"\n                                    >https://developers.cloudflare.com/support/troubleshooting/http-status-codes/cloudflare-1xxx-errors/error-1010/</a\n                                >\n                                for more details.\n                         

### 248. `ekos ask` [cloud] — 2b-ask

**Question:** How does LedgerSMB distinguish customers from vendors in entity_credit_account?

**Why:** Needed for stg_lsmb__counterparties

**Answer** (728 ms, tokens None/None, 0 evidence refs):

> {"raw_stdout": "\u001b[2m2026-09-28T15:54:54.923067Z\u001b[0m \u001b[32m INFO\u001b[0m \u001b[2mekos::commands::recover\u001b[0m\u001b[2m:\u001b[0m using OpenAI provider with disk cache\n", "stderr": "w-full mx-auto mb-8 lg:px-8\">\n                        <div id=\"what-happened-section\" class=\"w-1/2 md:w-full\">\n                            <h2\n                                class=\"text-3xl leading-tight font-normal mb-4 text-black-dark antialiased\"\n                                data-translate=\"what_happened\"\n                            >\n                                What happened?\n                            </h2>\n                            \n        <p>The owner of this website (opencode.ai) has banned your access based on your browser's signature (a423edf14b9bf41a-ua45).</p>\n    \n                            \n                            <p>\n                                Please see\n                                <a\n                                    rel=\"noopener noreferrer\"\n                                    href=\"https://developers.cloudflare.com/support/troubleshooting/http-status-codes/cloudflare-1xxx-errors/error-1010/\"\n                                    target=\"_blank\"\n                                    >https://developers.cloudflare.com/support/troubleshooting/http-status-codes/cloudflare-1xxx-errors/error-1010/</a\n                                >\n                                for more details.\n                         

### 249. `ekos ask` [cloud] — 2b-ask

**Question:** Which database objects depend on the parts table?

**Why:** Blast radius of the parts migration unit

**Answer** (679 ms, tokens None/None, 0 evidence refs):

> {"raw_stdout": "\u001b[2m2026-09-28T15:54:55.651685Z\u001b[0m \u001b[32m INFO\u001b[0m \u001b[2mekos::commands::recover\u001b[0m\u001b[2m:\u001b[0m using OpenAI provider with disk cache\n", "stderr": "w-full mx-auto mb-8 lg:px-8\">\n                        <div id=\"what-happened-section\" class=\"w-1/2 md:w-full\">\n                            <h2\n                                class=\"text-3xl leading-tight font-normal mb-4 text-black-dark antialiased\"\n                                data-translate=\"what_happened\"\n                            >\n                                What happened?\n                            </h2>\n                            \n        <p>The owner of this website (opencode.ai) has banned your access based on your browser's signature (a423edf57ef7cb43-ua45).</p>\n    \n                            \n                            <p>\n                                Please see\n                                <a\n                                    rel=\"noopener noreferrer\"\n                                    href=\"https://developers.cloudflare.com/support/troubleshooting/http-status-codes/cloudflare-1xxx-errors/error-1010/\"\n                                    target=\"_blank\"\n                                    >https://developers.cloudflare.com/support/troubleshooting/http-status-codes/cloudflare-1xxx-errors/error-1010/</a\n                                >\n                                for more details.\n                         

### 250. `ekos ask` [local] — 2b-ask

**Question:** How does LedgerSMB compute the cost of goods sold for a sales invoice line?

**Why:** Needed to trust int_sales_lines: is COGS FIFO, and where is it posted?

**Answer** (48860 ms, tokens None/None, 0 evidence refs):

> {"raw_stdout": "\u001b[2m2026-09-28T15:54:56.330486Z\u001b[0m \u001b[32m INFO\u001b[0m \u001b[2mekos::commands::recover\u001b[0m\u001b[2m:\u001b[0m using local Ollama provider with disk cache\n{\n  \"answer\": \"LedgerSMB computes the cost of goods sold for a sales invoice line by considering the inventory activity screens, parts groups, price groups, and FIFO or First In, First Out method.\",\n  \"diagnostics\": [\n    {\n      \"code\": \"RSN007\",\n      \"location\": null,\n      \"message\": \"skipped supporting neighbourhood of LedgerSMB \u2014 67 neighbours exceeds the 40-item budget for background context; a hub entity's neighbourhood describes the corpus, not this question\",\n      \"severity\": \"Warning\"\n    }\n  ],\n  \"evidence_refs\": [\n    \"f88b6f29-1959-5191-8ad2-a9cd97c2e37b\",\n    \"0dd4803e-2474-5d3a-84aa-bcc497893876\"\n  ],\n  \"token_usage\": {\n    \"input_tokens\": 1632,\n    \"output_tokens\": 95\n  }\n}\n", "stderr": ""}

### 251. `ekos ask` [local] — 2b-ask

**Question:** Which table stores general ledger journal lines, and how are debits and credits represented?

**Why:** Needed for the sign convention in stg_lsmb__journal_lines

**Answer** (16292 ms, tokens None/None, 0 evidence refs):

> {"raw_stdout": "\u001b[2m2026-09-28T15:55:45.218386Z\u001b[0m \u001b[32m INFO\u001b[0m \u001b[2mekos::commands::recover\u001b[0m\u001b[2m:\u001b[0m using local Ollama provider with disk cache\n{\n  \"answer\": \"The table that stores general ledger journal lines is `public.journal_line`. Debits and credits are represented in this table.\",\n  \"diagnostics\": [],\n  \"evidence_refs\": [\n    \"9630dc39-ac76-4de6-9662-47baaa64a37c\",\n    \"3f4d5450-c2f8-441a-87b3-7cc80f6a5311\"\n  ],\n  \"token_usage\": {\n    \"input_tokens\": 869,\n    \"output_tokens\": 83\n  }\n}\n", "stderr": ""}

### 252. `ekos ask` [local] — 2b-ask

**Question:** What is an open item in LedgerSMB and how are AR invoices settled by payments?

**Why:** Needed for int_open_item_balances and AR aging

**Answer** (23925 ms, tokens None/None, 0 evidence refs):

> {"raw_stdout": "\u001b[2m2026-09-28T15:56:01.487953Z\u001b[0m \u001b[32m INFO\u001b[0m \u001b[2mekos::commands::recover\u001b[0m\u001b[2m:\u001b[0m using local Ollama provider with disk cache\n{\n  \"answer\": \"An open item in LedgerSMB is an item that has not been cleared or settled, allowing for tracking of items to be handled in subsequent transactions.\\n\\nAR invoices are settled by payments through the LedgerSMB::Report::Invoices::Payments class, which provides routines for searching payments and displaying the report in standard supported reporting formats.\",\n  \"diagnostics\": [\n    {\n      \"code\": \"RSN007\",\n      \"location\": null,\n      \"message\": \"skipped supporting neighbourhood of LedgerSMB \u2014 67 neighbours exceeds the 40-item budget for background context; a hub entity's neighbourhood describes the corpus, not this question\",\n      \"severity\": \"Warning\"\n    }\n  ],\n  \"evidence_refs\": [\n    \"be23d3bb-76bc-4cac-90bc-99149031d919\",\n    \"710bee82-0a22-4381-ba3f-6b87873220a7\",\n    \"6aeb150b-d300-5782-a6f4-7439078b13d6\"\n  ],\n  \"token_usage\": {\n    \"input_tokens\": 994,\n    \"output_tokens\": 143\n  }\n}\n", "stderr": ""}

### 253. `ekos ask` [local] — 2b-ask

**Question:** What does the inventory_report table record and how is a count variance posted?

**Why:** Needed for mart_stock_count_variance

**Answer** (51854 ms, tokens None/None, 0 evidence refs):

> {"raw_stdout": "\u001b[2m2026-09-28T15:56:25.413085Z\u001b[0m \u001b[32m INFO\u001b[0m \u001b[2mekos::commands::recover\u001b[0m\u001b[2m:\u001b[0m using local Ollama provider with disk cache\n{\n  \"answer\": \"The inventory_report table records the variance between budgeted and actual amounts for a given period, as well as other relevant information such as report dates.\\n\\nA count variance is posted by calculating the difference between the budgeted and actual amounts for each account or category, and then rounding this value to a specified number of decimal places. This process involves setting object properties such as their_total, our_total, decimal_places, and account_info, and then using these values to calculate the variance.\",\n  \"diagnostics\": [\n    {\n      \"code\": \"RSN005\",\n      \"location\": null,\n      \"message\": \"aggregate questions (\\\"how many \u2026\\\", \\\"list all \u2026 by \u2026\\\") are best answered by an EKL COUNT / GROUP BY query \u2014 this plan falls back to a keyword search\",\n      \"severity\": \"Info\"\n    }\n  ],\n  \"evidence_refs\": [\n    \"62ac052b-bcd4-425c-85b6-93ebe785d3bd\",\n    \"fe528846-51cf-4087-9778-7790a5e6cccc\",\n    \"5a360825-ea50-549c-b4a7-a1dc18f94029\",\n    \"ae72de2d-f711-4189-ba94-fbd1152ec16e\",\n    \"dcd35a4d-c5d6-4ab4-be00-c0a3f58efc59\",\n    \"a660d3de-1b95-49c8-bff6-26e789013093\"\n  ],\n  \"token_usage\": {\n    \"input_tokens\": 2042,\n    \"output_tokens\": 243\n  }\n}\n", "stderr": ""}

### 254. `ekos ask` [local] — 2b-ask

**Question:** How does LedgerSMB distinguish customers from vendors in entity_credit_account?

**Why:** Needed for stg_lsmb__counterparties

**Answer** (15993 ms, tokens None/None, 0 evidence refs):

> {"raw_stdout": "\u001b[2m2026-09-28T15:57:17.267835Z\u001b[0m \u001b[32m INFO\u001b[0m \u001b[2mekos::commands::recover\u001b[0m\u001b[2m:\u001b[0m using local Ollama provider with disk cache\n{\n  \"answer\": \"LedgerSMB distinguishes customers from vendors in the entity_credit_account by using the entity_class attribute, which specifies whether the credit account is for a customer or vendor.\",\n  \"diagnostics\": [\n    {\n      \"code\": \"RSN007\",\n      \"location\": null,\n      \"message\": \"skipped supporting neighbourhood of LedgerSMB \u2014 67 neighbours exceeds the 40-item budget for background context; a hub entity's neighbourhood describes the corpus, not this question\",\n      \"severity\": \"Warning\"\n    }\n  ],\n  \"evidence_refs\": [\n    \"05e56bf1-6fb7-5a35-af18-c0171a364cde\"\n  ],\n  \"token_usage\": {\n    \"input_tokens\": 1026,\n    \"output_tokens\": 66\n  }\n}\n", "stderr": ""}

### 255. `ekos ask` [local] — 2b-ask

**Question:** Which database objects depend on the parts table?

**Why:** Blast radius of the parts migration unit

**Answer** (8967 ms, tokens None/None, 0 evidence refs):

> {"raw_stdout": "\u001b[2m2026-09-28T15:57:33.261287Z\u001b[0m \u001b[32m INFO\u001b[0m \u001b[2mekos::commands::recover\u001b[0m\u001b[2m:\u001b[0m using local Ollama provider with disk cache\n{\n  \"answer\": \"The parts table depends on the database object.\",\n  \"diagnostics\": [],\n  \"evidence_refs\": [\n    \"bbc1d5e6-bcc2-44bb-96f6-63927b049831\"\n  ],\n  \"token_usage\": {\n    \"input_tokens\": 724,\n    \"output_tokens\": 40\n  }\n}\n", "stderr": ""}

### 256. `ekos ask` [cloud] — 2b-ask-final

**Question:** How does LedgerSMB compute the cost of goods sold for a sales invoice line?

**Why:** Needed to trust int_sales_lines: is COGS FIFO, and where is it posted?

**Answer** (7497 ms, tokens 1753/1089, 0 evidence refs):

> LedgerSMB computes cost of goods sold using the FIFO (First In, First Out) method: the first inventory in the system that is unallocated is the first inventory used for costs. This behavior is described in connection with the `LedgerSMB::Report::Invoices::COGS` report, which provides support for verifying and controlling that calculation. The claims do not give a more detailed line-by-line computation specific to a sales invoice line.

### 257. `ekos ask` [cloud] — 2b-ask-final

**Question:** Which table stores general ledger journal lines, and how are debits and credits represented?

**Why:** Needed for the sign convention in stg_lsmb__journal_lines

**Answer** (6654 ms, tokens 950/602, 1 evidence refs):

> The table is `journal_line` (also referenced as `public.journal_line`); it replaces `acc_trans` as the main account transaction line table. The evidence does not describe how debits and credits are represented in that table.

### 258. `ekos ask` [cloud] — 2b-ask-final

**Question:** What is an open item in LedgerSMB and how are AR invoices settled by payments?

**Why:** Needed for int_open_item_balances and AR aging

**Answer** (5114 ms, tokens 1077/451, 2 evidence refs):

> An open item in LedgerSMB is a tracking mechanism for items to be cleared or handled in subsequent transactions, as described in the open-item-tracking SQL change.
> 
> The evidence does not describe how AR invoices are settled by payments. It only identifies a payment search/report class, `LedgerSMB::Report::Invoices::Payments`, which provides routines for searching payments and displaying the report, not the settlement process itself.

### 259. `ekos ask` [cloud] — 2b-ask-final

**Question:** What does the inventory_report table record and how is a count variance posted?

**Why:** Needed for mart_stock_count_variance

**Answer** (4637 ms, tokens 2174/533, 0 evidence refs):

> Insufficient evidence. I looked for claims describing what the inventory_report table records and how a count variance is posted, but the available claims only contain partial term matches and no descriptive content about either.

### 260. `ekos ask` [cloud] — 2b-ask-final

**Question:** How does LedgerSMB distinguish customers from vendors in entity_credit_account?

**Why:** Needed for stg_lsmb__counterparties

**Answer** (7682 ms, tokens 1131/1173, 1 evidence refs):

> LedgerSMB's `entity_credit_account` table stores the general relationship for moneys owed on invoices, covering both AR and AP sides, and the claims show it has a column named `public.entity_credit_account.entity_class`. That column is the field that would carry the customer/vendor distinction. However, the provided evidence does not state the specific values stored in `entity_class` (for example, `'customer'` versus `'vendor'`) or the exact logic that sets it, so the precise mechanism is not fully documented in these claims.

### 261. `ekos ask` [cloud] — 2b-ask-final

**Question:** Which database objects depend on the parts table?

**Why:** Blast radius of the parts migration unit

**Answer** (2156 ms, tokens 817/128, 0 evidence refs):

> Insufficient evidence.
> 
> I looked for any claim naming database objects or a dependency on a "parts table"; the provided claims only describe a Perl subroutine named `database` in `xt/lib/PageObject/Setup/CredsSection.pm`.

### 262. `ekos ask` [local] — 2b-ask-final

**Question:** How does LedgerSMB compute the cost of goods sold for a sales invoice line?

**Why:** Needed to trust int_sales_lines: is COGS FIFO, and where is it posted?

**Answer** (352 ms, tokens 1632/95, 2 evidence refs):

> LedgerSMB computes the cost of goods sold for a sales invoice line by considering the inventory activity screens, parts groups, price groups, and FIFO or First In, First Out method.

### 263. `ekos ask` [local] — 2b-ask-final

**Question:** Which table stores general ledger journal lines, and how are debits and credits represented?

**Why:** Needed for the sign convention in stg_lsmb__journal_lines

**Answer** (318 ms, tokens 869/83, 2 evidence refs):

> The table that stores general ledger journal lines is `public.journal_line`. Debits and credits are represented in this table.

### 264. `ekos ask` [local] — 2b-ask-final

**Question:** What is an open item in LedgerSMB and how are AR invoices settled by payments?

**Why:** Needed for int_open_item_balances and AR aging

**Answer** (319 ms, tokens 994/143, 3 evidence refs):

> An open item in LedgerSMB is an item that has not been cleared or settled, allowing for tracking of items to be handled in subsequent transactions.
> 
> AR invoices are settled by payments through the LedgerSMB::Report::Invoices::Payments class, which provides routines for searching payments and displaying the report in standard supported reporting formats.

### 265. `ekos ask` [local] — 2b-ask-final

**Question:** What does the inventory_report table record and how is a count variance posted?

**Why:** Needed for mart_stock_count_variance

**Answer** (331 ms, tokens 2042/243, 6 evidence refs):

> The inventory_report table records the variance between budgeted and actual amounts for a given period, as well as other relevant information such as report dates.
> 
> A count variance is posted by calculating the difference between the budgeted and actual amounts for each account or category, and then rounding this value to a specified number of decimal places. This process involves setting object properties such as their_total, our_total, decimal_places, and account_info, and then using these values to calculate the variance.

### 266. `ekos ask` [local] — 2b-ask-final

**Question:** How does LedgerSMB distinguish customers from vendors in entity_credit_account?

**Why:** Needed for stg_lsmb__counterparties

**Answer** (354 ms, tokens 1026/66, 1 evidence refs):

> LedgerSMB distinguishes customers from vendors in the entity_credit_account by using the entity_class attribute, which specifies whether the credit account is for a customer or vendor.

### 267. `ekos ask` [local] — 2b-ask-final

**Question:** Which database objects depend on the parts table?

**Why:** Blast radius of the parts migration unit

**Answer** (277 ms, tokens 724/40, 1 evidence refs):

> The parts table depends on the database object.

