-- ClickHouse DDL deployed in database lsmb_raw, dumped 2026-09-28T16:13:14Z by clickhouse/dump_ddl.sh

CREATE TABLE lsmb_raw.acc_trans
(
    `trans_id` Int32,
    `chart_id` Int32,
    `transdate` Date32,
    `source` LowCardinality(Nullable(String)),
    `cleared` Bool,
    `memo` LowCardinality(Nullable(String)),
    `invoice_id` Nullable(Int32),
    `approved` Bool,
    `deprecated-voucher_id` Nullable(Int32),
    `entry_id` Int32,
    `amount_bc` Decimal(38, 22),
    `amount_tc` Decimal(18, 2),
    `curr` String,
    `open_item_id` Nullable(Int32),
    `additional_data` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (chart_id, entry_id)
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.account
(
    `id` Int32,
    `accno` String,
    `description` String,
    `is_temp` Bool,
    `category` String,
    `gifi_accno` Nullable(String),
    `heading` Int32,
    `contra` Bool,
    `tax` Bool,
    `obsolete` Bool,
    `heading_negative_balance` Nullable(Int32),
    `custom_attributes` Nullable(String),
    `open_item_managed` Bool
)
ENGINE = MergeTree
ORDER BY accno
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.account_heading
(
    `id` Int32,
    `accno` String,
    `parent_id` Nullable(Int32),
    `description` String,
    `category` Nullable(String)
)
ENGINE = MergeTree
ORDER BY accno
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.account_link
(
    `account_id` Int32,
    `description` String
)
ENGINE = MergeTree
ORDER BY (account_id, description)
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.ap
(
    `trans_id` Int32,
    `invnumber` String,
    `taxincluded` Bool,
    `duedate` Date32,
    `invoice` Bool,
    `ordnumber` Nullable(String),
    `curr` String,
    `notes` Nullable(String),
    `person_id` Nullable(Int32),
    `quonumber` Nullable(String),
    `shipvia` Nullable(String),
    `language_code` Nullable(String),
    `ponumber` Nullable(String),
    `shippingpoint` Nullable(String),
    `on_hold` Bool,
    `reverse` Bool,
    `terms` Int16,
    `force_closed` Nullable(Bool),
    `crdate` Date32,
    `is_return` Bool,
    `entity_credit_account` Int32,
    `amount_bc` Decimal(18, 2),
    `amount_tc` Decimal(18, 2),
    `netamount_bc` Decimal(18, 2),
    `netamount_tc` Decimal(18, 2),
    `shipto` Nullable(Int32),
    `shipto_attn` Nullable(String),
    `open_item_id` Int32
)
ENGINE = MergeTree
ORDER BY trans_id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.ar
(
    `trans_id` Int32,
    `invnumber` String,
    `taxincluded` Bool,
    `duedate` Date32,
    `invoice` Bool,
    `shippingpoint` Nullable(String),
    `terms` Int16,
    `notes` Nullable(String),
    `curr` String,
    `ordnumber` Nullable(String),
    `person_id` Nullable(Int32),
    `quonumber` Nullable(String),
    `shipvia` Nullable(String),
    `language_code` Nullable(String),
    `ponumber` Nullable(String),
    `on_hold` Bool,
    `reverse` Bool,
    `entity_credit_account` Int32,
    `force_closed` Nullable(Bool),
    `is_return` Bool,
    `crdate` Date32,
    `setting_sequence` Nullable(String),
    `amount_bc` Decimal(18, 2),
    `amount_tc` Decimal(18, 2),
    `netamount_bc` Decimal(18, 2),
    `netamount_tc` Decimal(18, 2),
    `shipto` Nullable(Int32),
    `shipto_attn` Nullable(String),
    `open_item_id` Int32
)
ENGINE = MergeTree
ORDER BY trans_id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.business
(
    `id` Int32,
    `description` String,
    `discount` Decimal(18, 0),
    `last_updated` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.company
(
    `id` Int32,
    `entity_id` Int32,
    `legal_name` String,
    `tax_id` String,
    `sales_tax_id` Nullable(String),
    `license_number` Nullable(String),
    `sic_code` Nullable(String),
    `created` Date32
)
ENGINE = MergeTree
ORDER BY (entity_id, legal_name)
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.country
(
    `id` Int32,
    `name` String,
    `short_name` String,
    `itu` Nullable(String),
    `last_updated` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.currency
(
    `curr` String,
    `description` String
)
ENGINE = MergeTree
ORDER BY curr
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.eca_to_location
(
    `location_id` Int32,
    `location_class` Int32,
    `credit_id` Int32,
    `created` Date32,
    `inactive_date` Nullable(DateTime64(6)),
    `active` Bool
)
ENGINE = MergeTree
ORDER BY (location_id, location_class, credit_id)
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.entity
(
    `id` Int32,
    `name` String,
    `created` Date32,
    `control_code` String,
    `country_id` Int32,
    `custom_attributes` Nullable(String)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.entity_class
(
    `id` Int32,
    `class` String,
    `active` Bool
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.entity_credit_account
(
    `id` Int32,
    `entity_id` Int32,
    `entity_class` Int32,
    `pay_to_name` String,
    `discount` Decimal(18, 0),
    `description` String,
    `discount_terms` Int32,
    `discount_account_id` Nullable(Int32),
    `taxincluded` Bool,
    `creditlimit` Decimal(18, 2),
    `terms` Int16,
    `meta_number` String,
    `business_id` Nullable(Int32),
    `language_code` LowCardinality(String),
    `pricegroup_id` Nullable(Int32),
    `curr` String,
    `startdate` Date32,
    `enddate` Nullable(Date32),
    `threshold` Decimal(18, 0),
    `employee_id` Nullable(Int32),
    `primary_contact` Nullable(Int32),
    `ar_ap_account_id` Int32,
    `cash_account_id` Int32,
    `bank_account` Nullable(Int32),
    `taxform_id` Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY (entity_id, entity_class, meta_number)
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.gl
(
    `id` Int32
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.inventory_report
(
    `id` Int32,
    `report_date` Date32,
    `source` String,
    `trans_id` Int32
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.inventory_report_line
(
    `adjust_id` Int32,
    `parts_id` Int32,
    `counted` Decimal(18, 0),
    `expected` Decimal(18, 0),
    `variance` Decimal(18, 0)
)
ENGINE = MergeTree
ORDER BY (adjust_id, parts_id)
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.invoice
(
    `id` Int32,
    `trans_id` Int32,
    `parts_id` Int32,
    `description` LowCardinality(String),
    `qty` Decimal(18, 0),
    `allocated` Decimal(18, 0),
    `sellprice` Decimal(18, 2),
    `precision` Int32,
    `fxsellprice` Decimal(18, 2),
    `discount` Decimal(18, 0),
    `assemblyitem` Bool,
    `unit` LowCardinality(String),
    `deliverydate` Date32,
    `serialnumber` Nullable(String),
    `vendor_sku` Nullable(String),
    `notes` Nullable(String)
)
ENGINE = ReplacingMergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.location
(
    `id` Int32,
    `line_one` String,
    `line_two` Nullable(String),
    `line_three` Nullable(String),
    `city` LowCardinality(String),
    `state` LowCardinality(String),
    `country_id` Int32,
    `mail_code` String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.oe
(
    `id` Int32,
    `ordnumber` String,
    `transdate` Date32,
    `entity_id` Nullable(Int32),
    `amount_tc` Decimal(18, 2),
    `netamount_tc` Decimal(18, 2),
    `reqdate` Date32,
    `taxincluded` Bool,
    `shippingpoint` Nullable(String),
    `notes` Nullable(String),
    `curr` String,
    `person_id` Nullable(Int32),
    `closed` Bool,
    `quotation` Bool,
    `quonumber` Nullable(String),
    `intnotes` Nullable(String),
    `shipvia` Nullable(String),
    `language_code` Nullable(String),
    `ponumber` Nullable(String),
    `terms` Int16,
    `entity_credit_account` Int32,
    `oe_class_id` Int32,
    `workflow_id` Nullable(Int32),
    `shipto` Nullable(Int32),
    `shipto_attn` Nullable(String)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.oe_class
(
    `id` Int16,
    `oe_class` String
)
ENGINE = MergeTree
ORDER BY oe_class
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.open_item
(
    `id` Int32,
    `item_number` String,
    `item_type` String,
    `account_id` Int32
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.orderitems
(
    `id` Int32,
    `trans_id` Int32,
    `parts_id` Int32,
    `description` LowCardinality(String),
    `qty` Decimal(18, 0),
    `sellprice` Decimal(18, 2),
    `precision` Int32,
    `discount` Decimal(18, 0),
    `unit` LowCardinality(String),
    `reqdate` Date32,
    `ship` Decimal(18, 0),
    `serialnumber` Nullable(String),
    `notes` Nullable(String)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.parts
(
    `id` Int32,
    `partnumber` String,
    `description` String,
    `unit` LowCardinality(String),
    `listprice` Decimal(18, 2),
    `sellprice` Decimal(18, 2),
    `lastcost` Decimal(18, 2),
    `priceupdate` Date32,
    `weight` Nullable(Decimal(18, 2)),
    `onhand` Decimal(18, 0),
    `notes` LowCardinality(String),
    `makemodel` Bool,
    `assembly` Bool,
    `alternate` Bool,
    `rop` Decimal(18, 0),
    `inventory_accno_id` Nullable(Int32),
    `income_accno_id` Int32,
    `expense_accno_id` Int32,
    `returns_accno_id` Nullable(Int32),
    `bin` Nullable(String),
    `obsolete` Bool,
    `bom` Bool,
    `image` Nullable(String),
    `drawing` Nullable(String),
    `microfiche` Nullable(String),
    `partsgroup_id` Int32,
    `avgcost` Nullable(Decimal(38, 4)),
    `custom_attributes` Nullable(String)
)
ENGINE = ReplacingMergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.partsgroup
(
    `id` Int32,
    `partsgroup` String,
    `parent` Nullable(Int32),
    `last_updated` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.partstax
(
    `parts_id` Int32,
    `chart_id` Int32,
    `taxcategory_id` Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY (parts_id, chart_id)
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.payment
(
    `id` Int32,
    `reference` String,
    `payment_class` Int32,
    `payment_date` Date32,
    `closed` Bool,
    `entity_credit_id` Int32,
    `employee_id` Nullable(Int32),
    `currency` String,
    `notes` LowCardinality(String),
    `trans_id` Int32,
    `account_id` Int32
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.tax
(
    `chart_id` Int32,
    `rate` Nullable(Decimal(18, 6)),
    `minvalue` Nullable(Decimal(18, 2)),
    `maxvalue` Nullable(Decimal(18, 2)),
    `taxnumber` Nullable(String),
    `validto` Nullable(DateTime64(6)) COMMENT 'NULL = no end date (source: PostgreSQL infinity)',
    `pass` Nullable(Int32),
    `taxmodule_id` Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY chart_id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.trans_type
(
    `code` String,
    `description` String,
    `details_table` Nullable(String)
)
ENGINE = ReplacingMergeTree
ORDER BY code
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.transactions
(
    `id` Int32,
    `locked_by` Nullable(Int32),
    `approved` Bool,
    `approved_by` Nullable(Int32),
    `approved_at` Nullable(DateTime64(6)),
    `transdate` Date32,
    `workflow_id` Nullable(Int32),
    `reversing` Nullable(Int32),
    `reference` String,
    `description` Nullable(String),
    `trans_type_code` String,
    `entered_by` Nullable(Int32),
    `notes` Nullable(String),
    `batch_id` Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;

CREATE TABLE lsmb_raw.warehouse
(
    `id` Int32,
    `description` Nullable(String),
    `last_updated` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192
;
