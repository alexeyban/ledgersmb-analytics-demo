-- source: public.ac_tax_form
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   entry_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`ac_tax_form` (
    `entry_id` Int32,
    `reportable` Nullable(Bool)
)
ENGINE = MergeTree
ORDER BY (`entry_id`);

-- source: public.acc_trans
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: derived from observed filter predicates (chart_id in 108 call(s)); the primary key follows for uniqueness
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   trans_id: CODEC(Delta, ZSTD(1))
--   source: CODEC(ZSTD(1))
--   memo: CODEC(ZSTD(1))
--   invoice_id: CODEC(Delta, ZSTD(1))
--   deprecated-voucher_id: CODEC(Delta, ZSTD(1))
--   entry_id: CODEC(Delta, ZSTD(1))
--   curr: CODEC(ZSTD(1))
--   open_item_id: CODEC(Delta, ZSTD(1))
--   additional_data: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`acc_trans` (
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
    `amount_bc` Decimal128(22),
    `amount_tc` Decimal64(2),
    `curr` String,
    `open_item_id` Nullable(Int32),
    `additional_data` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`chart_id`, `entry_id`);

-- source: public.account
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   accno: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   category: CODEC(ZSTD(1))
--   gifi_accno: CODEC(ZSTD(1))
--   heading: CODEC(Delta, ZSTD(1))
--   heading_negative_balance: CODEC(Delta, ZSTD(1))
--   custom_attributes: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`account` (
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
ORDER BY (`accno`);

-- source: public.account_checkpoint
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   account_id: CODEC(Delta, ZSTD(1))
--   id: CODEC(Delta, ZSTD(1))
--   curr: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`account_checkpoint` (
    `end_date` Date32,
    `account_id` Int32,
    `id` Int32,
    `debits` Nullable(Decimal128(4)),
    `credits` Nullable(Decimal128(4)),
    `amount_bc` Decimal128(4),
    `amount_tc` Decimal128(4),
    `curr` String
)
ENGINE = MergeTree
ORDER BY (`end_date`, `account_id`, `curr`);

-- source: public.account_heading
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   accno: CODEC(ZSTD(1))
--   parent_id: CODEC(Delta, ZSTD(1))
--   description: CODEC(ZSTD(1))
--   category: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`account_heading` (
    `id` Int32,
    `accno` String,
    `parent_id` Nullable(Int32),
    `description` String,
    `category` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`accno`);

-- source: public.account_heading_translation
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   trans_id: CODEC(Delta, ZSTD(1))
--   language_code: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`account_heading_translation` (
    `trans_id` Int32,
    `language_code` String,
    `description` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`trans_id`, `language_code`);

-- source: public.account_link
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   account_id: CODEC(Delta, ZSTD(1))
--   description: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`account_link` (
    `account_id` Int32,
    `description` String
)
ENGINE = MergeTree
ORDER BY (`account_id`, `description`);

-- source: public.account_link_description
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   description: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`account_link_description` (
    `description` String,
    `summary` Bool,
    `custom` Bool
)
ENGINE = MergeTree
ORDER BY (`description`);

-- source: public.account_translation
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   trans_id: CODEC(Delta, ZSTD(1))
--   language_code: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`account_translation` (
    `trans_id` Int32,
    `language_code` String,
    `description` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`trans_id`, `language_code`);

-- source: public.ap
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   trans_id: CODEC(Delta, ZSTD(1))
--   invnumber: CODEC(ZSTD(1))
--   ordnumber: CODEC(ZSTD(1))
--   curr: CODEC(ZSTD(1))
--   notes: CODEC(ZSTD(1))
--   person_id: CODEC(Delta, ZSTD(1))
--   quonumber: CODEC(ZSTD(1))
--   shipvia: CODEC(ZSTD(1))
--   language_code: CODEC(ZSTD(1))
--   ponumber: CODEC(ZSTD(1))
--   shippingpoint: CODEC(ZSTD(1))
--   shipto: CODEC(Delta, ZSTD(1))
--   shipto_attn: CODEC(ZSTD(1))
--   open_item_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`ap` (
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
    `amount_bc` Decimal64(2),
    `amount_tc` Decimal64(2),
    `netamount_bc` Decimal64(2),
    `netamount_tc` Decimal64(2),
    `shipto` Nullable(Int32),
    `shipto_attn` Nullable(String),
    `open_item_id` Int32
)
ENGINE = MergeTree
ORDER BY (`trans_id`);

-- source: public.ar
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   trans_id: CODEC(Delta, ZSTD(1))
--   invnumber: CODEC(ZSTD(1))
--   shippingpoint: CODEC(ZSTD(1))
--   notes: CODEC(ZSTD(1))
--   curr: CODEC(ZSTD(1))
--   ordnumber: CODEC(ZSTD(1))
--   person_id: CODEC(Delta, ZSTD(1))
--   quonumber: CODEC(ZSTD(1))
--   shipvia: CODEC(ZSTD(1))
--   language_code: CODEC(ZSTD(1))
--   ponumber: CODEC(ZSTD(1))
--   setting_sequence: CODEC(ZSTD(1))
--   shipto: CODEC(Delta, ZSTD(1))
--   shipto_attn: CODEC(ZSTD(1))
--   open_item_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`ar` (
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
    `amount_bc` Decimal64(2),
    `amount_tc` Decimal64(2),
    `netamount_bc` Decimal64(2),
    `netamount_tc` Decimal64(2),
    `shipto` Nullable(Int32),
    `shipto_attn` Nullable(String),
    `open_item_id` Int32
)
ENGINE = MergeTree
ORDER BY (`trans_id`);

-- source: public.assembly
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   parts_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`assembly` (
    `id` Int32,
    `parts_id` Int32,
    `qty` Nullable(Decimal128(4)),
    `bom` Nullable(Bool),
    `adj` Nullable(Bool)
)
ENGINE = MergeTree
ORDER BY (`id`, `parts_id`);

-- source: public.asset_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   label: CODEC(ZSTD(1))
--   asset_account_id: CODEC(Delta, ZSTD(1))
--   dep_account_id: CODEC(Delta, ZSTD(1))
--   method: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`asset_class` (
    `id` Int32,
    `label` String,
    `asset_account_id` Nullable(Int32),
    `dep_account_id` Nullable(Int32),
    `method` Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY (`label`);

-- source: public.asset_dep_method
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   method: CODEC(ZSTD(1))
--   sproc: CODEC(ZSTD(1))
--   unit_label: CODEC(ZSTD(1))
--   short_name: CODEC(ZSTD(1))
--   unit_class: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`asset_dep_method` (
    `id` Int32,
    `method` String,
    `sproc` String,
    `unit_label` String,
    `short_name` String,
    `unit_class` Int32
)
ENGINE = MergeTree
ORDER BY (`method`);

-- source: public.asset_disposal_method
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   label: CODEC(ZSTD(1))
--   id: CODEC(Delta, ZSTD(1))
--   multiple: CODEC(Delta, ZSTD(1))
--   short_label: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`asset_disposal_method` (
    `label` String,
    `id` Int32,
    `multiple` Int32,
    `short_label` String
)
ENGINE = MergeTree
ORDER BY (`label`);

-- source: public.asset_item
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   description: CODEC(ZSTD(1))
--   tag: CODEC(ZSTD(1))
--   location_id: CODEC(Delta, ZSTD(1))
--   department_id: CODEC(Delta, ZSTD(1))
--   invoice_id: CODEC(Delta, ZSTD(1))
--   asset_account_id: CODEC(Delta, ZSTD(1))
--   dep_account_id: CODEC(Delta, ZSTD(1))
--   exp_account_id: CODEC(Delta, ZSTD(1))
--   obsolete_by: CODEC(Delta, ZSTD(1))
--   asset_class_id: CODEC(Delta, ZSTD(1))
--   custom_attributes: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`asset_item` (
    `id` Int32,
    `description` Nullable(String),
    `tag` String,
    `purchase_value` Decimal128(4),
    `salvage_value` Decimal128(4),
    `usable_life` Decimal128(4),
    `purchase_date` Date32,
    `start_depreciation` Date32,
    `location_id` Nullable(Int32),
    `department_id` Nullable(Int32),
    `invoice_id` Nullable(Int32),
    `asset_account_id` Nullable(Int32),
    `dep_account_id` Nullable(Int32),
    `exp_account_id` Nullable(Int32),
    `obsolete_by` Nullable(Int32),
    `asset_class_id` Nullable(Int32),
    `custom_attributes` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.asset_report
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   asset_class: CODEC(Delta, ZSTD(1))
--   report_class: CODEC(Delta, ZSTD(1))
--   entered_by: CODEC(Delta, ZSTD(1))
--   approved_by: CODEC(Delta, ZSTD(1))
--   entered_at: CODEC(Delta, ZSTD(1))
--   approved_at: CODEC(Delta, ZSTD(1))
--   trans_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`asset_report` (
    `id` Int32,
    `report_date` Nullable(Date32),
    `asset_class` Nullable(Int64),
    `report_class` Nullable(Int32),
    `entered_by` Int64,
    `approved_by` Nullable(Int64),
    `entered_at` Nullable(DateTime64(6)),
    `approved_at` Nullable(DateTime64(6)),
    `depreciated_qty` Nullable(Decimal128(4)),
    `dont_approve` Nullable(Bool),
    `submitted` Bool,
    `trans_id` Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.asset_report_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   class: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`asset_report_class` (
    `id` Int32,
    `class` String
)
ENGINE = MergeTree
ORDER BY (`class`);

-- source: public.asset_report_line
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   asset_id: CODEC(Delta, ZSTD(1))
--   report_id: CODEC(Delta, ZSTD(1))
--   department_id: CODEC(Delta, ZSTD(1))
--   warehouse_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`asset_report_line` (
    `asset_id` Int64,
    `report_id` Int64,
    `amount` Nullable(Decimal128(4)),
    `department_id` Nullable(Int32),
    `warehouse_id` Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY (`asset_id`, `report_id`);

-- source: public.asset_rl_to_disposal_method
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   report_id: CODEC(Delta, ZSTD(1))
--   asset_id: CODEC(Delta, ZSTD(1))
--   disposal_method_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`asset_rl_to_disposal_method` (
    `report_id` Int32,
    `asset_id` Int32,
    `disposal_method_id` Int32,
    `percent_disposed` Nullable(Decimal128(4))
)
ENGINE = MergeTree
ORDER BY (`report_id`, `asset_id`, `disposal_method_id`);

-- source: public.asset_unit_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   class: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`asset_unit_class` (
    `id` Int32,
    `class` String
)
ENGINE = MergeTree
ORDER BY (`class`);

-- source: public.audittrail
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   trans_id: CODEC(Delta, ZSTD(1))
--   tablename: CODEC(ZSTD(1))
--   reference: CODEC(ZSTD(1))
--   formname: CODEC(ZSTD(1))
--   action: CODEC(ZSTD(1))
--   transdate: CODEC(Delta, ZSTD(1))
--   person_id: CODEC(Delta, ZSTD(1))
--   entry_id: CODEC(Delta, ZSTD(1))
--   rolname: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`audittrail` (
    `trans_id` Int32,
    `tablename` LowCardinality(String),
    `reference` String,
    `formname` Nullable(String),
    `action` LowCardinality(String),
    `transdate` DateTime64(6),
    `person_id` Nullable(Int32),
    `entry_id` Int64,
    `rolname` LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY (`entry_id`);

-- source: public.batch
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   batch_class_id: CODEC(Delta, ZSTD(1))
--   control_code: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   approved_by: CODEC(Delta, ZSTD(1))
--   created_by: CODEC(Delta, ZSTD(1))
--   locked_by: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`batch` (
    `id` Int32,
    `batch_class_id` Int32,
    `control_code` String,
    `description` Nullable(String),
    `default_date` Date32,
    `approved_on` Nullable(Date32),
    `approved_by` Nullable(Int32),
    `created_by` Nullable(Int32),
    `locked_by` Nullable(Int32),
    `created_on` Nullable(Date32)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.batch_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   class: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`batch_class` (
    `id` Int32,
    `class` String
)
ENGINE = MergeTree
ORDER BY (`class`);

-- source: public.bu_class_to_module
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   module_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`bu_class_to_module` (
    `bu_class_id` Int32,
    `module_id` Int32
)
ENGINE = MergeTree
ORDER BY (`bu_class_id`, `module_id`);

-- source: public.budget_info
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   reference: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   entered_by: CODEC(Delta, ZSTD(1))
--   approved_by: CODEC(Delta, ZSTD(1))
--   obsolete_by: CODEC(Delta, ZSTD(1))
--   entered_at: CODEC(Delta, ZSTD(1))
--   approved_at: CODEC(Delta, ZSTD(1))
--   obsolete_at: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`budget_info` (
    `id` Int32,
    `start_date` Date32,
    `end_date` Date32,
    `reference` String,
    `description` String,
    `entered_by` Int32,
    `approved_by` Nullable(Int32),
    `obsolete_by` Nullable(Int32),
    `entered_at` DateTime64(6),
    `approved_at` Nullable(DateTime64(6)),
    `obsolete_at` Nullable(DateTime64(6))
)
ENGINE = MergeTree
ORDER BY (`reference`);

-- source: public.budget_line
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   budget_id: CODEC(Delta, ZSTD(1))
--   account_id: CODEC(Delta, ZSTD(1))
--   description: CODEC(ZSTD(1))
--   curr: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`budget_line` (
    `budget_id` Int32,
    `account_id` Int32,
    `description` Nullable(String),
    `amount` Decimal128(4),
    `amount_tc` Decimal128(4),
    `curr` String
)
ENGINE = MergeTree
ORDER BY (`budget_id`, `account_id`);

-- source: public.budget_note
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   note_class: CODEC(Delta, ZSTD(1))
--   note: CODEC(ZSTD(1))
--   vector: CODEC(ZSTD(1))
--   created: CODEC(Delta, ZSTD(1))
--   created_by: CODEC(ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   subject: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`budget_note` (
    `id` Int32,
    `note_class` Int32,
    `note` String,
    `vector` String,
    `created` DateTime64(6),
    `created_by` Nullable(String),
    `ref_key` Int32,
    `subject` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.budget_to_business_unit
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   budget_id: CODEC(Delta, ZSTD(1))
--   bu_id: CODEC(Delta, ZSTD(1))
--   bu_class: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`budget_to_business_unit` (
    `budget_id` Int32,
    `bu_id` Int32,
    `bu_class` Int32
)
ENGINE = MergeTree
ORDER BY (`budget_id`, `bu_class`);

-- source: public.business
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   description: CODEC(ZSTD(1))
--   last_updated: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`business` (
    `id` Int32,
    `description` String,
    `discount` Decimal64(0),
    `last_updated` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.business_unit
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   class_id: CODEC(Delta, ZSTD(1))
--   control_code: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   parent_id: CODEC(Delta, ZSTD(1))
--   credit_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`business_unit` (
    `id` Int32,
    `class_id` Int32,
    `control_code` String,
    `description` String,
    `start_date` Nullable(Date32),
    `end_date` Nullable(Date32),
    `parent_id` Nullable(Int32),
    `credit_id` Int32
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.business_unit_ac
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   entry_id: CODEC(Delta, ZSTD(1))
--   class_id: CODEC(Delta, ZSTD(1))
--   bu_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`business_unit_ac` (
    `entry_id` Int32,
    `class_id` Int32,
    `bu_id` Int32
)
ENGINE = MergeTree
ORDER BY (`entry_id`, `class_id`);

-- source: public.business_unit_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   label: CODEC(ZSTD(1))
--   ordering: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`business_unit_class` (
    `id` Int32,
    `label` String,
    `active` Bool,
    `ordering` Int32
)
ENGINE = MergeTree
ORDER BY (`label`);

-- source: public.business_unit_inv
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   entry_id: CODEC(Delta, ZSTD(1))
--   class_id: CODEC(Delta, ZSTD(1))
--   bu_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`business_unit_inv` (
    `entry_id` Int32,
    `class_id` Int32,
    `bu_id` Int32
)
ENGINE = MergeTree
ORDER BY (`entry_id`, `class_id`);

-- source: public.business_unit_jl
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   entry_id: CODEC(Delta, ZSTD(1))
--   bu_class: CODEC(Delta, ZSTD(1))
--   bu_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`business_unit_jl` (
    `entry_id` Int32,
    `bu_class` Int32,
    `bu_id` Int32
)
ENGINE = MergeTree
ORDER BY (`entry_id`, `bu_class`);

-- source: public.business_unit_oitem
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   entry_id: CODEC(Delta, ZSTD(1))
--   class_id: CODEC(Delta, ZSTD(1))
--   bu_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`business_unit_oitem` (
    `entry_id` Int32,
    `class_id` Int32,
    `bu_id` Int32
)
ENGINE = MergeTree
ORDER BY (`entry_id`, `class_id`);

-- source: public.business_unit_translation
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   trans_id: CODEC(Delta, ZSTD(1))
--   language_code: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`business_unit_translation` (
    `trans_id` Int32,
    `language_code` String,
    `description` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`trans_id`, `language_code`);

-- source: public.company
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   entity_id: CODEC(Delta, ZSTD(1))
--   legal_name: CODEC(ZSTD(1))
--   tax_id: CODEC(ZSTD(1))
--   sales_tax_id: CODEC(ZSTD(1))
--   license_number: CODEC(ZSTD(1))
--   sic_code: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`company` (
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
ORDER BY (`entity_id`, `legal_name`);

-- source: public.contact_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   class: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`contact_class` (
    `id` Int32,
    `class` String
)
ENGINE = MergeTree
ORDER BY (`class`);

-- source: public.country
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   name: CODEC(ZSTD(1))
--   short_name: CODEC(ZSTD(1))
--   itu: CODEC(ZSTD(1))
--   last_updated: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`country` (
    `id` Int32,
    `name` String,
    `short_name` String,
    `itu` Nullable(String),
    `last_updated` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.country_tax_form
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   country_id: CODEC(Delta, ZSTD(1))
--   form_name: CODEC(ZSTD(1))
--   id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`country_tax_form` (
    `country_id` Int32,
    `form_name` String,
    `id` Int32,
    `default_reportable` Bool,
    `is_accrual` Bool
)
ENGINE = MergeTree
ORDER BY (`country_id`, `form_name`);

-- source: public.cr_coa_to_account
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   chart_id: CODEC(Delta, ZSTD(1))
--   account: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`cr_coa_to_account` (
    `chart_id` Int32,
    `account` String
)
ENGINE = MergeTree
ORDER BY (`chart_id`);

-- source: public.cr_report
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   chart_id: CODEC(Delta, ZSTD(1))
--   updated: CODEC(Delta, ZSTD(1))
--   entered_by: CODEC(Delta, ZSTD(1))
--   entered_username: CODEC(ZSTD(1))
--   deleted_by: CODEC(Delta, ZSTD(1))
--   approved_by: CODEC(Delta, ZSTD(1))
--   approved_username: CODEC(ZSTD(1))
--   workflow_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`cr_report` (
    `id` Int64,
    `chart_id` Int32,
    `their_total` Decimal128(4),
    `approved` Bool,
    `submitted` Bool,
    `end_date` Date32,
    `updated` DateTime64(6),
    `entered_by` Int32,
    `entered_username` String,
    `deleted` Bool,
    `deleted_by` Nullable(Int32),
    `approved_by` Nullable(Int32),
    `approved_username` Nullable(String),
    `recon_fx` Nullable(Bool),
    `workflow_id` Int64
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.cr_report_line
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   report_id: CODEC(Delta, ZSTD(1))
--   scn: CODEC(ZSTD(1))
--   user: CODEC(Delta, ZSTD(1))
--   insert_time: CODEC(Delta, ZSTD(1))
--   trans_type: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`cr_report_line` (
    `id` Int64,
    `report_id` Int32,
    `scn` Nullable(String),
    `their_balance` Nullable(Decimal128(4)),
    `our_balance` Nullable(Decimal128(4)),
    `user` Int32,
    `clear_time` Nullable(Date32),
    `insert_time` DateTime64(6, 'UTC'),
    `trans_type` Nullable(String),
    `post_date` Nullable(Date32),
    `cleared` Bool
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.cr_report_line_links
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   report_line_id: CODEC(Delta, ZSTD(1))
--   entry_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`cr_report_line_links` (
    `report_line_id` Int32,
    `entry_id` Int32,
    `unique_exempt` Bool,
    `cleared` Bool
)
ENGINE = MergeTree
ORDER BY (`report_line_id`, `entry_id`);

-- source: public.currency
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   curr: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`currency` (
    `curr` String,
    `description` String
)
ENGINE = MergeTree
ORDER BY (`curr`);

-- source: public.custom_attribute_metadata
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   name: CODEC(ZSTD(1))
--   type: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   config: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`custom_attribute_metadata` (
    `id` UUID,
    `name` String,
    `obsolete` Nullable(Date32),
    `type` String,
    `description` Nullable(String),
    `config` String
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.defaults
-- engine: the source updates rows in place, but no column advances on update
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   setting_key: CODEC(ZSTD(1))
--   value: CODEC(ZSTD(1))
-- NEEDS A DECISION: No version column: without one ClickHouse keeps an arbitrary row per key on merge. Inventing a now() would make the load non-deterministic and unvalidatable, so this needs a decision — add an updated_at to the source, or accept last-writer-wins by insertion order.
CREATE TABLE `lsmb_raw`.`defaults` (
    `setting_key` String,
    `value` String
)
ENGINE = ReplacingMergeTree
ORDER BY (`setting_key`);

-- source: public.eca_invoice
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   order_id: CODEC(Delta, ZSTD(1))
--   journal_id: CODEC(Delta, ZSTD(1))
--   credit_id: CODEC(Delta, ZSTD(1))
--   language_code: CODEC(ZSTD(1))
--   order_number: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`eca_invoice` (
    `order_id` Nullable(Int32),
    `journal_id` Int32,
    `on_hold` Nullable(Bool),
    `reverse` Nullable(Bool),
    `credit_id` Int32,
    `due` Date32,
    `language_code` Nullable(String),
    `force_closed` Bool,
    `order_number` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`journal_id`);

-- source: public.eca_note
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   note_class: CODEC(Delta, ZSTD(1))
--   note: CODEC(ZSTD(1))
--   vector: CODEC(ZSTD(1))
--   created: CODEC(Delta, ZSTD(1))
--   created_by: CODEC(ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   subject: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`eca_note` (
    `id` Int32,
    `note_class` Int32,
    `note` String,
    `vector` String,
    `created` DateTime64(6),
    `created_by` Nullable(String),
    `ref_key` Int32,
    `subject` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.eca_tax
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   eca_id: CODEC(Delta, ZSTD(1))
--   chart_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`eca_tax` (
    `eca_id` Int32,
    `chart_id` Int32
)
ENGINE = MergeTree
ORDER BY (`eca_id`, `chart_id`);

-- source: public.eca_to_contact
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   credit_id: CODEC(Delta, ZSTD(1))
--   contact_class_id: CODEC(Delta, ZSTD(1))
--   contact: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`eca_to_contact` (
    `credit_id` Int32,
    `contact_class_id` Int32,
    `contact` String,
    `description` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`credit_id`, `contact_class_id`, `contact`);

-- source: public.eca_to_location
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   location_id: CODEC(Delta, ZSTD(1))
--   location_class: CODEC(Delta, ZSTD(1))
--   credit_id: CODEC(Delta, ZSTD(1))
--   inactive_date: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`eca_to_location` (
    `location_id` Int32,
    `location_class` Int32,
    `credit_id` Int32,
    `created` Date32,
    `inactive_date` Nullable(DateTime64(6)),
    `active` Bool
)
ENGINE = MergeTree
ORDER BY (`location_id`, `location_class`, `credit_id`);

-- source: public.email
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   workflow_id: CODEC(Delta, ZSTD(1))
--   from: CODEC(ZSTD(1))
--   to: CODEC(ZSTD(1))
--   cc: CODEC(ZSTD(1))
--   bcc: CODEC(ZSTD(1))
--   subject: CODEC(ZSTD(1))
--   body: CODEC(ZSTD(1))
--   expansions: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`email` (
    `workflow_id` Int32,
    `from` Nullable(String),
    `to` Nullable(String),
    `cc` Nullable(String),
    `bcc` Nullable(String),
    `notify` Nullable(Bool),
    `subject` Nullable(String),
    `body` Nullable(String),
    `sent_date` Nullable(Date32),
    `expansions` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`workflow_id`);

-- source: public.employee_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   label: CODEC(ZSTD(1))
--   id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`employee_class` (
    `label` String,
    `id` Int32
)
ENGINE = MergeTree
ORDER BY (`label`);

-- source: public.employee_to_ec
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   employee_id: CODEC(Delta, ZSTD(1))
--   ec_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`employee_to_ec` (
    `employee_id` Int32,
    `ec_id` Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY (`employee_id`);

-- source: public.entity
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   name: CODEC(ZSTD(1))
--   control_code: CODEC(ZSTD(1))
--   country_id: CODEC(Delta, ZSTD(1))
--   custom_attributes: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`entity` (
    `id` Int32,
    `name` String,
    `created` Date32,
    `control_code` String,
    `country_id` Int32,
    `custom_attributes` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.entity_bank_account
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   entity_id: CODEC(Delta, ZSTD(1))
--   bic: CODEC(ZSTD(1))
--   iban: CODEC(ZSTD(1))
--   remark: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`entity_bank_account` (
    `id` Int32,
    `entity_id` Int32,
    `bic` String,
    `iban` String,
    `remark` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`entity_id`, `bic`, `iban`);

-- source: public.entity_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   class: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`entity_class` (
    `id` Int32,
    `class` String,
    `active` Bool
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.entity_credit_account
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   entity_id: CODEC(Delta, ZSTD(1))
--   pay_to_name: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   discount_terms: CODEC(Delta, ZSTD(1))
--   discount_account_id: CODEC(Delta, ZSTD(1))
--   meta_number: CODEC(ZSTD(1))
--   language_code: CODEC(ZSTD(1))
--   pricegroup_id: CODEC(Delta, ZSTD(1))
--   curr: CODEC(ZSTD(1))
--   employee_id: CODEC(Delta, ZSTD(1))
--   primary_contact: CODEC(Delta, ZSTD(1))
--   ar_ap_account_id: CODEC(Delta, ZSTD(1))
--   cash_account_id: CODEC(Delta, ZSTD(1))
--   bank_account: CODEC(Delta, ZSTD(1))
--   taxform_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`entity_credit_account` (
    `id` Int32,
    `entity_id` Int32,
    `entity_class` Int32,
    `pay_to_name` String,
    `discount` Decimal64(0),
    `description` String,
    `discount_terms` Int32,
    `discount_account_id` Nullable(Int32),
    `taxincluded` Bool,
    `creditlimit` Decimal64(2),
    `terms` Int16,
    `meta_number` String,
    `business_id` Nullable(Int32),
    `language_code` LowCardinality(String),
    `pricegroup_id` Nullable(Int32),
    `curr` String,
    `startdate` Date32,
    `enddate` Nullable(Date32),
    `threshold` Decimal64(0),
    `employee_id` Nullable(Int32),
    `primary_contact` Nullable(Int32),
    `ar_ap_account_id` Int32,
    `cash_account_id` Int32,
    `bank_account` Nullable(Int32),
    `taxform_id` Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY (`entity_id`, `entity_class`, `meta_number`);

-- source: public.entity_employee
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   entity_id: CODEC(Delta, ZSTD(1))
--   role: CODEC(ZSTD(1))
--   ssn: CODEC(ZSTD(1))
--   manager_id: CODEC(Delta, ZSTD(1))
--   employeenumber: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`entity_employee` (
    `entity_id` Int32,
    `startdate` Date32,
    `enddate` Nullable(Date32),
    `role` Nullable(String),
    `ssn` Nullable(String),
    `sales` Nullable(Bool),
    `manager_id` Nullable(Int32),
    `employeenumber` Nullable(String),
    `dob` Nullable(Date32),
    `is_manager` Nullable(Bool)
)
ENGINE = MergeTree
ORDER BY (`entity_id`);

-- source: public.entity_note
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   note_class: CODEC(Delta, ZSTD(1))
--   note: CODEC(ZSTD(1))
--   vector: CODEC(ZSTD(1))
--   created: CODEC(Delta, ZSTD(1))
--   created_by: CODEC(ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   subject: CODEC(ZSTD(1))
--   entity_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`entity_note` (
    `id` Int32,
    `note_class` Int32,
    `note` String,
    `vector` String,
    `created` DateTime64(6),
    `created_by` Nullable(String),
    `ref_key` Int32,
    `subject` Nullable(String),
    `entity_id` Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.entity_other_name
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   entity_id: CODEC(Delta, ZSTD(1))
--   other_name: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`entity_other_name` (
    `entity_id` Int32,
    `other_name` String
)
ENGINE = MergeTree
ORDER BY (`entity_id`, `other_name`);

-- source: public.entity_to_contact
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   entity_id: CODEC(Delta, ZSTD(1))
--   contact_class_id: CODEC(Delta, ZSTD(1))
--   contact: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`entity_to_contact` (
    `entity_id` Int32,
    `contact_class_id` Int32,
    `contact` String,
    `description` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`entity_id`, `contact_class_id`, `contact`);

-- source: public.entity_to_location
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   location_id: CODEC(Delta, ZSTD(1))
--   location_class: CODEC(Delta, ZSTD(1))
--   entity_id: CODEC(Delta, ZSTD(1))
--   inactive_date: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`entity_to_location` (
    `location_id` Int32,
    `location_class` Int32,
    `entity_id` Int32,
    `created` Date32,
    `inactive_date` Nullable(DateTime64(6)),
    `active` Bool
)
ENGINE = MergeTree
ORDER BY (`location_id`, `location_class`, `entity_id`);

-- source: public.exchangerate_default
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   rate_type: CODEC(Delta, ZSTD(1))
--   curr: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`exchangerate_default` (
    `rate_type` Int32,
    `curr` String,
    `valid_from` Date32,
    `valid_to` Date32,
    `rate` Decimal128(4)
)
ENGINE = MergeTree
ORDER BY (`rate_type`, `curr`, `valid_from`);

-- source: public.exchangerate_type
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   description: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`exchangerate_type` (
    `id` Int32,
    `description` String,
    `builtin` Bool
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.file_base
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   content: CODEC(ZSTD(1))
--   mime_type_id: CODEC(Delta, ZSTD(1))
--   file_name: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   uploaded_by: CODEC(Delta, ZSTD(1))
--   uploaded_at: CODEC(Delta, ZSTD(1))
--   id: CODEC(Delta, ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   file_class: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_base` (
    `content` String,
    `mime_type_id` Int32,
    `file_name` String,
    `description` Nullable(String),
    `uploaded_by` Int32,
    `uploaded_at` DateTime64(6),
    `id` Int32,
    `ref_key` Int32,
    `file_class` Int32
)
ENGINE = MergeTree
ORDER BY (`file_name`, `ref_key`, `file_class`);

-- source: public.file_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   class: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_class` (
    `id` Int32,
    `class` String
)
ENGINE = MergeTree
ORDER BY (`class`);

-- source: public.file_eca
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   content: CODEC(ZSTD(1))
--   mime_type_id: CODEC(Delta, ZSTD(1))
--   file_name: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   uploaded_by: CODEC(Delta, ZSTD(1))
--   uploaded_at: CODEC(Delta, ZSTD(1))
--   id: CODEC(Delta, ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   file_class: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_eca` (
    `content` String,
    `mime_type_id` Int32,
    `file_name` String,
    `description` Nullable(String),
    `uploaded_by` Int32,
    `uploaded_at` DateTime64(6),
    `id` Int32,
    `ref_key` Int32,
    `file_class` Int32
)
ENGINE = MergeTree
ORDER BY (`file_name`, `ref_key`, `file_class`);

-- source: public.file_email
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   content: CODEC(ZSTD(1))
--   mime_type_id: CODEC(Delta, ZSTD(1))
--   file_name: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   uploaded_by: CODEC(Delta, ZSTD(1))
--   uploaded_at: CODEC(Delta, ZSTD(1))
--   id: CODEC(Delta, ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   file_class: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_email` (
    `content` String,
    `mime_type_id` Int32,
    `file_name` String,
    `description` Nullable(String),
    `uploaded_by` Int32,
    `uploaded_at` DateTime64(6),
    `id` Int32,
    `ref_key` Int32,
    `file_class` Int32
)
ENGINE = MergeTree
ORDER BY (`file_name`, `ref_key`, `file_class`);

-- source: public.file_entity
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   content: CODEC(ZSTD(1))
--   mime_type_id: CODEC(Delta, ZSTD(1))
--   file_name: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   uploaded_by: CODEC(Delta, ZSTD(1))
--   uploaded_at: CODEC(Delta, ZSTD(1))
--   id: CODEC(Delta, ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   file_class: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_entity` (
    `content` String,
    `mime_type_id` Int32,
    `file_name` String,
    `description` Nullable(String),
    `uploaded_by` Int32,
    `uploaded_at` DateTime64(6),
    `id` Int32,
    `ref_key` Int32,
    `file_class` Int32
)
ENGINE = MergeTree
ORDER BY (`file_name`, `ref_key`, `file_class`);

-- source: public.file_incoming
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   content: CODEC(ZSTD(1))
--   mime_type_id: CODEC(Delta, ZSTD(1))
--   file_name: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   uploaded_by: CODEC(Delta, ZSTD(1))
--   uploaded_at: CODEC(Delta, ZSTD(1))
--   id: CODEC(Delta, ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   file_class: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_incoming` (
    `content` String,
    `mime_type_id` Int32,
    `file_name` String,
    `description` Nullable(String),
    `uploaded_by` Int32,
    `uploaded_at` DateTime64(6),
    `id` Int32,
    `ref_key` Int32,
    `file_class` Int32
)
ENGINE = MergeTree
ORDER BY (`file_name`, `ref_key`, `file_class`);

-- source: public.file_internal
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   content: CODEC(ZSTD(1))
--   mime_type_id: CODEC(Delta, ZSTD(1))
--   file_name: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   uploaded_by: CODEC(Delta, ZSTD(1))
--   uploaded_at: CODEC(Delta, ZSTD(1))
--   id: CODEC(Delta, ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   file_class: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_internal` (
    `content` String,
    `mime_type_id` Int32,
    `file_name` String,
    `description` Nullable(String),
    `uploaded_by` Int32,
    `uploaded_at` DateTime64(6),
    `id` Int32,
    `ref_key` Int32,
    `file_class` Int32
)
ENGINE = MergeTree
ORDER BY (`file_name`, `ref_key`, `file_class`);

-- source: public.file_order
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   content: CODEC(ZSTD(1))
--   mime_type_id: CODEC(Delta, ZSTD(1))
--   file_name: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   uploaded_by: CODEC(Delta, ZSTD(1))
--   uploaded_at: CODEC(Delta, ZSTD(1))
--   id: CODEC(Delta, ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   file_class: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_order` (
    `content` String,
    `mime_type_id` Int32,
    `file_name` String,
    `description` Nullable(String),
    `uploaded_by` Int32,
    `uploaded_at` DateTime64(6),
    `id` Int32,
    `ref_key` Int32,
    `file_class` Int32
)
ENGINE = MergeTree
ORDER BY (`file_name`, `ref_key`, `file_class`);

-- source: public.file_order_to_order
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   file_id: CODEC(Delta, ZSTD(1))
--   source_class: CODEC(Delta, ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   dest_class: CODEC(Delta, ZSTD(1))
--   attached_by: CODEC(Delta, ZSTD(1))
--   attached_at: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_order_to_order` (
    `file_id` Int32,
    `source_class` Int32,
    `ref_key` Int32,
    `dest_class` Int32,
    `attached_by` Int32,
    `attached_at` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY (`file_id`, `source_class`, `ref_key`, `dest_class`);

-- source: public.file_order_to_tx
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   file_id: CODEC(Delta, ZSTD(1))
--   source_class: CODEC(Delta, ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   dest_class: CODEC(Delta, ZSTD(1))
--   attached_by: CODEC(Delta, ZSTD(1))
--   attached_at: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_order_to_tx` (
    `file_id` Int32,
    `source_class` Int32,
    `ref_key` Int32,
    `dest_class` Int32,
    `attached_by` Int32,
    `attached_at` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY (`file_id`, `source_class`, `ref_key`, `dest_class`);

-- source: public.file_part
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   content: CODEC(ZSTD(1))
--   mime_type_id: CODEC(Delta, ZSTD(1))
--   file_name: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   uploaded_by: CODEC(Delta, ZSTD(1))
--   uploaded_at: CODEC(Delta, ZSTD(1))
--   id: CODEC(Delta, ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   file_class: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_part` (
    `content` String,
    `mime_type_id` Int32,
    `file_name` String,
    `description` Nullable(String),
    `uploaded_by` Int32,
    `uploaded_at` DateTime64(6),
    `id` Int32,
    `ref_key` Int32,
    `file_class` Int32
)
ENGINE = MergeTree
ORDER BY (`file_name`, `ref_key`, `file_class`);

-- source: public.file_reconciliation
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   content: CODEC(ZSTD(1))
--   mime_type_id: CODEC(Delta, ZSTD(1))
--   file_name: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   uploaded_by: CODEC(Delta, ZSTD(1))
--   uploaded_at: CODEC(Delta, ZSTD(1))
--   id: CODEC(Delta, ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   file_class: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_reconciliation` (
    `content` String,
    `mime_type_id` Int32,
    `file_name` String,
    `description` Nullable(String),
    `uploaded_by` Int32,
    `uploaded_at` DateTime64(6),
    `id` Int32,
    `ref_key` Int32,
    `file_class` Int32
)
ENGINE = MergeTree
ORDER BY (`file_name`, `ref_key`, `file_class`);

-- source: public.file_secondary_attachment
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   file_id: CODEC(Delta, ZSTD(1))
--   source_class: CODEC(Delta, ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   dest_class: CODEC(Delta, ZSTD(1))
--   attached_by: CODEC(Delta, ZSTD(1))
--   attached_at: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_secondary_attachment` (
    `file_id` Int32,
    `source_class` Int32,
    `ref_key` Int32,
    `dest_class` Int32,
    `attached_by` Int32,
    `attached_at` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY (`file_id`, `source_class`, `ref_key`, `dest_class`);

-- source: public.file_transaction
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   content: CODEC(ZSTD(1))
--   mime_type_id: CODEC(Delta, ZSTD(1))
--   file_name: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   uploaded_by: CODEC(Delta, ZSTD(1))
--   uploaded_at: CODEC(Delta, ZSTD(1))
--   id: CODEC(Delta, ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   file_class: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_transaction` (
    `content` String,
    `mime_type_id` Int32,
    `file_name` String,
    `description` Nullable(String),
    `uploaded_by` Int32,
    `uploaded_at` DateTime64(6),
    `id` Int32,
    `ref_key` Int32,
    `file_class` Int32
)
ENGINE = MergeTree
ORDER BY (`file_name`, `ref_key`, `file_class`);

-- source: public.file_tx_to_order
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   file_id: CODEC(Delta, ZSTD(1))
--   source_class: CODEC(Delta, ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   dest_class: CODEC(Delta, ZSTD(1))
--   attached_by: CODEC(Delta, ZSTD(1))
--   attached_at: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_tx_to_order` (
    `file_id` Int32,
    `source_class` Int32,
    `ref_key` Int32,
    `dest_class` Int32,
    `attached_by` Int32,
    `attached_at` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY (`file_id`, `source_class`, `ref_key`, `dest_class`);

-- source: public.file_view_catalog
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   file_class: CODEC(Delta, ZSTD(1))
--   view_name: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`file_view_catalog` (
    `file_class` Int32,
    `view_name` String
)
ENGINE = MergeTree
ORDER BY (`file_class`);

-- source: public.gifi
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   accno: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   last_updated: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`gifi` (
    `accno` String,
    `description` Nullable(String),
    `last_updated` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY (`accno`);

-- source: public.gl
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`gl` (
    `id` Int32
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.inventory_report
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   source: CODEC(ZSTD(1))
--   trans_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`inventory_report` (
    `id` Int32,
    `report_date` Date32,
    `source` String,
    `trans_id` Int32
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.inventory_report_line
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   adjust_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`inventory_report_line` (
    `adjust_id` Int32,
    `parts_id` Int32,
    `counted` Decimal64(0),
    `expected` Decimal64(0),
    `variance` Decimal64(0)
)
ENGINE = MergeTree
ORDER BY (`adjust_id`, `parts_id`);

-- source: public.invoice
-- engine: the source updates rows in place, but no column advances on update
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   description: CODEC(ZSTD(1))
--   precision: CODEC(Delta, ZSTD(1))
--   unit: CODEC(ZSTD(1))
--   serialnumber: CODEC(ZSTD(1))
--   vendor_sku: CODEC(ZSTD(1))
--   notes: CODEC(ZSTD(1))
-- NEEDS A DECISION: No version column: without one ClickHouse keeps an arbitrary row per key on merge. Inventing a now() would make the load non-deterministic and unvalidatable, so this needs a decision — add an updated_at to the source, or accept last-writer-wins by insertion order.
CREATE TABLE `lsmb_raw`.`invoice` (
    `id` Int32,
    `trans_id` Int32,
    `parts_id` Int32,
    `description` LowCardinality(String),
    `qty` Decimal64(0),
    `allocated` Decimal64(0),
    `sellprice` Decimal64(2),
    `precision` Int32,
    `fxsellprice` Decimal64(2),
    `discount` Decimal64(0),
    `assemblyitem` Bool,
    `unit` LowCardinality(String),
    `deliverydate` Date32,
    `serialnumber` Nullable(String),
    `vendor_sku` Nullable(String),
    `notes` Nullable(String)
)
ENGINE = ReplacingMergeTree
ORDER BY (`id`);

-- source: public.invoice_note
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   note_class: CODEC(Delta, ZSTD(1))
--   note: CODEC(ZSTD(1))
--   vector: CODEC(ZSTD(1))
--   created: CODEC(Delta, ZSTD(1))
--   created_by: CODEC(ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   subject: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`invoice_note` (
    `id` Int32,
    `note_class` Int32,
    `note` String,
    `vector` String,
    `created` DateTime64(6),
    `created_by` Nullable(String),
    `ref_key` Int32,
    `subject` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.invoice_tax_form
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   invoice_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`invoice_tax_form` (
    `invoice_id` Int32,
    `reportable` Nullable(Bool)
)
ENGINE = MergeTree
ORDER BY (`invoice_id`);

-- source: public.jcitems
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   business_unit_id: CODEC(Delta, ZSTD(1))
--   parts_id: CODEC(Delta, ZSTD(1))
--   description: CODEC(ZSTD(1))
--   serialnumber: CODEC(ZSTD(1))
--   checkedin: CODEC(Delta, ZSTD(1))
--   checkedout: CODEC(Delta, ZSTD(1))
--   person_id: CODEC(Delta, ZSTD(1))
--   notes: CODEC(ZSTD(1))
--   jctype: CODEC(Delta, ZSTD(1))
--   curr: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`jcitems` (
    `id` Int32,
    `business_unit_id` Nullable(Int32),
    `parts_id` Nullable(Int32),
    `description` Nullable(String),
    `qty` Nullable(Decimal128(4)),
    `allocated` Nullable(Decimal128(4)),
    `sellprice` Nullable(Decimal128(4)),
    `fxsellprice` Nullable(Decimal128(4)),
    `serialnumber` Nullable(String),
    `checkedin` Nullable(DateTime64(6, 'UTC')),
    `checkedout` Nullable(DateTime64(6, 'UTC')),
    `person_id` Int32,
    `notes` Nullable(String),
    `total` Decimal128(4),
    `non_billable` Decimal128(4),
    `jctype` Int32,
    `curr` String
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.jctype
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   label: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`jctype` (
    `id` Int32,
    `label` String,
    `description` String,
    `is_service` Bool,
    `is_timecard` Bool
)
ENGINE = MergeTree
ORDER BY (`label`);

-- source: public.job
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   bu_id: CODEC(Delta, ZSTD(1))
--   parts_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`job` (
    `bu_id` Int32,
    `parts_id` Nullable(Int32),
    `production` Nullable(Decimal128(4)),
    `completed` Nullable(Decimal128(4))
)
ENGINE = MergeTree
ORDER BY (`bu_id`);

-- source: public.journal_entry
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   reference: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   locked_by: CODEC(Delta, ZSTD(1))
--   journal: CODEC(Delta, ZSTD(1))
--   currency: CODEC(ZSTD(1))
--   entered_by: CODEC(Delta, ZSTD(1))
--   approved_by: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`journal_entry` (
    `id` Int32,
    `reference` Nullable(String),
    `description` Nullable(String),
    `locked_by` Nullable(Int32),
    `journal` Nullable(Int32),
    `post_date` Nullable(Date32),
    `effective_start` Nullable(Date32),
    `effective_end` Nullable(Date32),
    `currency` String,
    `approved` Nullable(Bool),
    `is_template` Nullable(Bool),
    `entered_by` Int32,
    `approved_by` Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.journal_line
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   account_id: CODEC(Delta, ZSTD(1))
--   journal_id: CODEC(Delta, ZSTD(1))
--   reconciliation_report: CODEC(Delta, ZSTD(1))
--   line_type: CODEC(ZSTD(1))
--   curr: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`journal_line` (
    `id` Int32,
    `account_id` Int32,
    `journal_id` Int32,
    `amount` Decimal128(4),
    `cleared` Bool,
    `reconciliation_report` Nullable(Int32),
    `line_type` Nullable(String),
    `amount_tc` Decimal128(4),
    `curr` String
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.journal_note
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   note_class: CODEC(Delta, ZSTD(1))
--   note: CODEC(ZSTD(1))
--   vector: CODEC(ZSTD(1))
--   created: CODEC(Delta, ZSTD(1))
--   created_by: CODEC(ZSTD(1))
--   ref_key: CODEC(Delta, ZSTD(1))
--   subject: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`journal_note` (
    `id` Int32,
    `note_class` Int32,
    `note` String,
    `vector` String,
    `created` DateTime64(6),
    `created_by` Nullable(String),
    `ref_key` Int32,
    `subject` Nullable(String),
    `internal_only` Bool
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.journal_type
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   name: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`journal_type` (
    `id` Int32,
    `name` String
)
ENGINE = MergeTree
ORDER BY (`name`);

-- source: public.language
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   code: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   last_updated: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`language` (
    `code` String,
    `description` String,
    `last_updated` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY (`code`);

-- source: public.location
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   line_one: CODEC(ZSTD(1))
--   line_two: CODEC(ZSTD(1))
--   line_three: CODEC(ZSTD(1))
--   city: CODEC(ZSTD(1))
--   state: CODEC(ZSTD(1))
--   country_id: CODEC(Delta, ZSTD(1))
--   mail_code: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`location` (
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
ORDER BY (`id`);

-- source: public.location_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   class: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`location_class` (
    `id` Int32,
    `class` String,
    `authoritative` Bool
)
ENGINE = MergeTree
ORDER BY (`class`, `authoritative`);

-- source: public.lsmb_module
-- engine: the source updates rows in place, but no column advances on update
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   label: CODEC(ZSTD(1))
-- NEEDS A DECISION: No version column: without one ClickHouse keeps an arbitrary row per key on merge. Inventing a now() would make the load non-deterministic and unvalidatable, so this needs a decision — add an updated_at to the source, or accept last-writer-wins by insertion order.
CREATE TABLE `lsmb_raw`.`lsmb_module` (
    `id` Int32,
    `label` String
)
ENGINE = ReplacingMergeTree
ORDER BY (`label`);

-- source: public.lsmb_sequence
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   label: CODEC(ZSTD(1))
--   setting_key: CODEC(ZSTD(1))
--   prefix: CODEC(ZSTD(1))
--   suffix: CODEC(ZSTD(1))
--   sequence: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`lsmb_sequence` (
    `label` String,
    `setting_key` String,
    `prefix` Nullable(String),
    `suffix` Nullable(String),
    `sequence` String,
    `accept_input` Nullable(Bool)
)
ENGINE = MergeTree
ORDER BY (`label`);

-- source: public.makemodel
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   parts_id: CODEC(Delta, ZSTD(1))
--   barcode: CODEC(ZSTD(1))
--   make: CODEC(ZSTD(1))
--   model: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`makemodel` (
    `parts_id` Int32,
    `barcode` Nullable(String),
    `make` String,
    `model` String
)
ENGINE = MergeTree
ORDER BY (`parts_id`, `make`, `model`);

-- source: public.menu_acl
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   role_name: CODEC(ZSTD(1))
--   acl_type: CODEC(ZSTD(1))
--   node_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`menu_acl` (
    `id` Int32,
    `role_name` String,
    `acl_type` Nullable(String),
    `node_id` Int32
)
ENGINE = MergeTree
ORDER BY (`role_name`, `node_id`);

-- source: public.menu_node
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   label: CODEC(ZSTD(1))
--   parent: CODEC(Delta, ZSTD(1))
--   position: CODEC(Delta, ZSTD(1))
--   url: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`menu_node` (
    `id` Int32,
    `label` String,
    `parent` Nullable(Int32),
    `position` Int32,
    `url` Nullable(String),
    `standalone` Nullable(Bool),
    `menu` Nullable(Bool)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.mime_type
-- engine: the source updates rows in place, but no column advances on update
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   mime_type: CODEC(ZSTD(1))
-- NEEDS A DECISION: No version column: without one ClickHouse keeps an arbitrary row per key on merge. Inventing a now() would make the load non-deterministic and unvalidatable, so this needs a decision — add an updated_at to the source, or accept last-writer-wins by insertion order.
CREATE TABLE `lsmb_raw`.`mime_type` (
    `id` Int32,
    `mime_type` String,
    `invoice_include` Bool
)
ENGINE = ReplacingMergeTree
ORDER BY (`mime_type`);

-- source: public.note_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   class: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`note_class` (
    `id` Int32,
    `class` String
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.oe
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   ordnumber: CODEC(ZSTD(1))
--   entity_id: CODEC(Delta, ZSTD(1))
--   shippingpoint: CODEC(ZSTD(1))
--   notes: CODEC(ZSTD(1))
--   curr: CODEC(ZSTD(1))
--   person_id: CODEC(Delta, ZSTD(1))
--   quonumber: CODEC(ZSTD(1))
--   intnotes: CODEC(ZSTD(1))
--   shipvia: CODEC(ZSTD(1))
--   language_code: CODEC(ZSTD(1))
--   ponumber: CODEC(ZSTD(1))
--   oe_class_id: CODEC(Delta, ZSTD(1))
--   workflow_id: CODEC(Delta, ZSTD(1))
--   shipto: CODEC(Delta, ZSTD(1))
--   shipto_attn: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`oe` (
    `id` Int32,
    `ordnumber` String,
    `transdate` Date32,
    `entity_id` Nullable(Int32),
    `amount_tc` Decimal64(2),
    `netamount_tc` Decimal64(2),
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
ORDER BY (`id`);

-- source: public.oe_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   oe_class: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`oe_class` (
    `id` Int16,
    `oe_class` String
)
ENGINE = MergeTree
ORDER BY (`oe_class`);

-- source: public.oe_tax
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   oe_id: CODEC(Delta, ZSTD(1))
--   tax_id: CODEC(Delta, ZSTD(1))
--   source: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`oe_tax` (
    `oe_id` Int32,
    `tax_id` Int32,
    `basis` Decimal128(4),
    `exempt` Int16,
    `rate` Nullable(Decimal128(4)),
    `amount` Nullable(Decimal128(4)),
    `source` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`oe_id`, `tax_id`);

-- source: public.open_forms
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   session_id: CODEC(Delta, ZSTD(1))
--   form_name: CODEC(ZSTD(1))
--   last_used: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`open_forms` (
    `id` Int32,
    `session_id` Nullable(Int32),
    `form_name` Nullable(String),
    `last_used` Nullable(DateTime64(6))
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.open_item
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   item_number: CODEC(ZSTD(1))
--   item_type: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`open_item` (
    `id` Int32,
    `item_number` String,
    `item_type` String,
    `account_id` Int32
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.orderitems
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   trans_id: CODEC(Delta, ZSTD(1))
--   description: CODEC(ZSTD(1))
--   precision: CODEC(Delta, ZSTD(1))
--   unit: CODEC(ZSTD(1))
--   serialnumber: CODEC(ZSTD(1))
--   notes: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`orderitems` (
    `id` Int32,
    `trans_id` Int32,
    `parts_id` Int32,
    `description` LowCardinality(String),
    `qty` Decimal64(0),
    `sellprice` Decimal64(2),
    `precision` Int32,
    `discount` Decimal64(0),
    `unit` LowCardinality(String),
    `reqdate` Date32,
    `ship` Decimal64(0),
    `serialnumber` Nullable(String),
    `notes` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.overpayment
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   open_item_id: CODEC(Delta, ZSTD(1))
--   eca_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`overpayment` (
    `id` Int32,
    `open_item_id` Int32,
    `eca_id` Int32
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.parts
-- engine: the source updates rows in place, but no column advances on update
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   partnumber: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   unit: CODEC(ZSTD(1))
--   notes: CODEC(ZSTD(1))
--   inventory_accno_id: CODEC(Delta, ZSTD(1))
--   income_accno_id: CODEC(Delta, ZSTD(1))
--   expense_accno_id: CODEC(Delta, ZSTD(1))
--   returns_accno_id: CODEC(Delta, ZSTD(1))
--   bin: CODEC(ZSTD(1))
--   image: CODEC(ZSTD(1))
--   drawing: CODEC(ZSTD(1))
--   microfiche: CODEC(ZSTD(1))
--   custom_attributes: CODEC(ZSTD(1))
-- NEEDS A DECISION: No version column: without one ClickHouse keeps an arbitrary row per key on merge. Inventing a now() would make the load non-deterministic and unvalidatable, so this needs a decision — add an updated_at to the source, or accept last-writer-wins by insertion order.
CREATE TABLE `lsmb_raw`.`parts` (
    `id` Int32,
    `partnumber` String,
    `description` String,
    `unit` LowCardinality(String),
    `listprice` Decimal64(2),
    `sellprice` Decimal64(2),
    `lastcost` Decimal64(2),
    `priceupdate` Date32,
    `weight` Nullable(Decimal64(2)),
    `onhand` Decimal64(0),
    `notes` LowCardinality(String),
    `makemodel` Bool,
    `assembly` Bool,
    `alternate` Bool,
    `rop` Decimal64(0),
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
    `avgcost` Nullable(Decimal128(4)),
    `custom_attributes` Nullable(String)
)
ENGINE = ReplacingMergeTree
ORDER BY (`id`);

-- source: public.parts_translation
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   trans_id: CODEC(Delta, ZSTD(1))
--   language_code: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`parts_translation` (
    `trans_id` Int32,
    `language_code` String,
    `description` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`trans_id`, `language_code`);

-- source: public.partscustomer
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   parts_id: CODEC(Delta, ZSTD(1))
--   credit_id: CODEC(Delta, ZSTD(1))
--   pricegroup_id: CODEC(Delta, ZSTD(1))
--   curr: CODEC(ZSTD(1))
--   entry_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`partscustomer` (
    `parts_id` Nullable(Int32),
    `credit_id` Nullable(Int32),
    `pricegroup_id` Nullable(Int32),
    `pricebreak` Nullable(Decimal128(4)),
    `sellprice` Nullable(Decimal128(4)),
    `validfrom` Nullable(Date32),
    `validto` Nullable(Date32),
    `curr` String,
    `entry_id` Int32,
    `qty` Nullable(Decimal128(4))
)
ENGINE = MergeTree
ORDER BY (`entry_id`);

-- source: public.partsgroup
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   partsgroup: CODEC(ZSTD(1))
--   parent: CODEC(Delta, ZSTD(1))
--   last_updated: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`partsgroup` (
    `id` Int32,
    `partsgroup` String,
    `parent` Nullable(Int32),
    `last_updated` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.partsgroup_translation
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   trans_id: CODEC(Delta, ZSTD(1))
--   language_code: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`partsgroup_translation` (
    `trans_id` Int32,
    `language_code` String,
    `description` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`trans_id`, `language_code`);

-- source: public.partstax
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   parts_id: CODEC(Delta, ZSTD(1))
--   chart_id: CODEC(Delta, ZSTD(1))
--   taxcategory_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`partstax` (
    `parts_id` Int32,
    `chart_id` Int32,
    `taxcategory_id` Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY (`parts_id`, `chart_id`);

-- source: public.partsvendor
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   credit_id: CODEC(Delta, ZSTD(1))
--   parts_id: CODEC(Delta, ZSTD(1))
--   partnumber: CODEC(ZSTD(1))
--   curr: CODEC(ZSTD(1))
--   entry_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`partsvendor` (
    `credit_id` Int32,
    `parts_id` Nullable(Int32),
    `partnumber` Nullable(String),
    `leadtime` Nullable(Int16),
    `lastcost` Nullable(Decimal128(4)),
    `curr` String,
    `entry_id` Int32
)
ENGINE = MergeTree
ORDER BY (`entry_id`);

-- source: public.payment
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   reference: CODEC(ZSTD(1))
--   employee_id: CODEC(Delta, ZSTD(1))
--   currency: CODEC(ZSTD(1))
--   notes: CODEC(ZSTD(1))
--   trans_id: CODEC(Delta, ZSTD(1))
--   account_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`payment` (
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
ORDER BY (`id`);

-- source: public.payment_type
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   label: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`payment_type` (
    `id` Int32,
    `label` String
)
ENGINE = MergeTree
ORDER BY (`label`);

-- source: public.payroll_deduction
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   entry_id: CODEC(Delta, ZSTD(1))
--   entity_id: CODEC(Delta, ZSTD(1))
--   type_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`payroll_deduction` (
    `entry_id` Int32,
    `entity_id` Int32,
    `type_id` Int32,
    `rate` Decimal128(4)
)
ENGINE = MergeTree
ORDER BY (`entity_id`, `type_id`);

-- source: public.payroll_deduction_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   country_id: CODEC(Delta, ZSTD(1))
--   label: CODEC(ZSTD(1))
--   stored_proc_name: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`payroll_deduction_class` (
    `id` Int32,
    `country_id` Int32,
    `label` String,
    `stored_proc_name` String
)
ENGINE = MergeTree
ORDER BY (`country_id`, `label`);

-- source: public.payroll_employee_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   label: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`payroll_employee_class` (
    `id` Int32,
    `label` String
)
ENGINE = MergeTree
ORDER BY (`label`);

-- source: public.payroll_employee_class_to_income_type
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   ec_id: CODEC(Delta, ZSTD(1))
--   it_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`payroll_employee_class_to_income_type` (
    `ec_id` Int32,
    `it_id` Int32
)
ENGINE = MergeTree
ORDER BY (`ec_id`, `it_id`);

-- source: public.payroll_income_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   country_id: CODEC(Delta, ZSTD(1))
--   label: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`payroll_income_class` (
    `id` Int32,
    `country_id` Int32,
    `label` String
)
ENGINE = MergeTree
ORDER BY (`country_id`, `label`);

-- source: public.payroll_pto_class
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   label: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`payroll_pto_class` (
    `id` Int32,
    `label` String
)
ENGINE = MergeTree
ORDER BY (`label`);

-- source: public.payroll_report
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   ec_id: CODEC(Delta, ZSTD(1))
--   created_by: CODEC(Delta, ZSTD(1))
--   approved_by: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`payroll_report` (
    `id` Int32,
    `ec_id` Int32,
    `payment_date` Date32,
    `created_by` Nullable(Int32),
    `approved_by` Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.payroll_report_line
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   report_id: CODEC(Delta, ZSTD(1))
--   employee_id: CODEC(Delta, ZSTD(1))
--   it_id: CODEC(Delta, ZSTD(1))
--   description: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`payroll_report_line` (
    `id` Int32,
    `report_id` Int32,
    `employee_id` Int32,
    `it_id` Int32,
    `qty` Decimal128(4),
    `rate` Decimal128(4),
    `description` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`report_id`, `employee_id`, `it_id`);

-- source: public.payroll_wage
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   entry_id: CODEC(Delta, ZSTD(1))
--   entity_id: CODEC(Delta, ZSTD(1))
--   type_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`payroll_wage` (
    `entry_id` Int32,
    `entity_id` Int32,
    `type_id` Int32,
    `rate` Decimal128(4)
)
ENGINE = MergeTree
ORDER BY (`entity_id`, `type_id`);

-- source: public.person
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   entity_id: CODEC(Delta, ZSTD(1))
--   salutation_id: CODEC(Delta, ZSTD(1))
--   first_name: CODEC(ZSTD(1))
--   middle_name: CODEC(ZSTD(1))
--   last_name: CODEC(ZSTD(1))
--   personal_id: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`person` (
    `id` Int32,
    `entity_id` Int32,
    `salutation_id` Nullable(Int32),
    `first_name` String,
    `middle_name` Nullable(String),
    `last_name` String,
    `created` Date32,
    `birthdate` Nullable(Date32),
    `personal_id` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.person_to_company
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   location_id: CODEC(Delta, ZSTD(1))
--   person_id: CODEC(Delta, ZSTD(1))
--   company_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`person_to_company` (
    `location_id` Int32,
    `person_id` Int32,
    `company_id` Int32
)
ENGINE = MergeTree
ORDER BY (`location_id`, `person_id`);

-- source: public.pricegroup
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   pricegroup: CODEC(ZSTD(1))
--   last_updated: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`pricegroup` (
    `id` Int32,
    `pricegroup` Nullable(String),
    `last_updated` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.recurringemail
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   formname: CODEC(ZSTD(1))
--   format: CODEC(ZSTD(1))
--   message: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`recurringemail` (
    `id` Int32,
    `formname` String,
    `format` Nullable(String),
    `message` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`id`, `formname`);

-- source: public.recurringprint
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   formname: CODEC(ZSTD(1))
--   format: CODEC(ZSTD(1))
--   printer: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`recurringprint` (
    `id` Int32,
    `formname` String,
    `format` Nullable(String),
    `printer` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`id`, `formname`);

-- source: public.robot
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   entity_id: CODEC(Delta, ZSTD(1))
--   first_name: CODEC(ZSTD(1))
--   middle_name: CODEC(ZSTD(1))
--   last_name: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`robot` (
    `id` Int32,
    `entity_id` Int32,
    `first_name` Nullable(String),
    `middle_name` Nullable(String),
    `last_name` String,
    `created` Date32
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.salutation
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   salutation: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`salutation` (
    `id` Int32,
    `salutation` String
)
ENGINE = MergeTree
ORDER BY (`salutation`);

-- source: public.session
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   session_id: CODEC(Delta, ZSTD(1))
--   token: CODEC(ZSTD(1))
--   last_used: CODEC(Delta, ZSTD(1))
--   ttl: CODEC(Delta, ZSTD(1))
--   users_id: CODEC(Delta, ZSTD(1))
--   notify_pasword: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`session` (
    `session_id` Int32,
    `token` Nullable(String),
    `last_used` Nullable(DateTime64(6)),
    `ttl` Int32,
    `users_id` Int32,
    `notify_pasword` String
)
ENGINE = MergeTree
ORDER BY (`session_id`);

-- source: public.session_history
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   session_id: CODEC(Delta, ZSTD(1))
--   users_id: CODEC(Delta, ZSTD(1))
--   created: CODEC(Delta, ZSTD(1))
--   last_used: CODEC(Delta, ZSTD(1))
--   ended: CODEC(Delta, ZSTD(1))
--   termination_reason: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`session_history` (
    `session_id` Int32,
    `users_id` Int32,
    `created` DateTime64(6),
    `last_used` Nullable(DateTime64(6)),
    `ended` Nullable(DateTime64(6)),
    `termination_reason` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`session_id`);

-- source: public.sic
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   code: CODEC(ZSTD(1))
--   sictype: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   last_updated: CODEC(Delta, ZSTD(1))
--   custom_attributes: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`sic` (
    `code` String,
    `sictype` Nullable(String),
    `description` Nullable(String),
    `last_updated` DateTime64(6),
    `custom_attributes` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`code`);

-- source: public.tax
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   chart_id: CODEC(Delta, ZSTD(1))
--   taxnumber: CODEC(ZSTD(1))
--   validto: CODEC(Delta, ZSTD(1))
--   pass: CODEC(Delta, ZSTD(1))
--   taxmodule_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`tax` (
    `chart_id` Int32,
    `rate` Decimal128(4),
    `minvalue` Nullable(Decimal128(4)),
    `maxvalue` Nullable(Decimal128(4)),
    `taxnumber` String,
    `validto` DateTime64(6),
    `pass` Int32,
    `taxmodule_id` Int32
)
ENGINE = MergeTree
ORDER BY (`chart_id`, `validto`);

-- source: public.tax_exempt_reason
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   description: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`tax_exempt_reason` (
    `id` Int32,
    `description` String
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.tax_extended
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   entry_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`tax_extended` (
    `tax_basis` Nullable(Decimal128(4)),
    `rate` Nullable(Decimal128(4)),
    `entry_id` Int32
)
ENGINE = MergeTree
ORDER BY (`entry_id`);

-- source: public.taxcategory
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   taxcategory_id: CODEC(Delta, ZSTD(1))
--   taxcategoryname: CODEC(ZSTD(1))
--   taxmodule_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`taxcategory` (
    `taxcategory_id` Int32,
    `taxcategoryname` String,
    `taxmodule_id` Int32
)
ENGINE = MergeTree
ORDER BY (`taxcategory_id`);

-- source: public.taxmodule
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   taxmodule_id: CODEC(Delta, ZSTD(1))
--   taxmodulename: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`taxmodule` (
    `taxmodule_id` Int32,
    `taxmodulename` String
)
ENGINE = MergeTree
ORDER BY (`taxmodule_id`);

-- source: public.trans_type
-- engine: the source updates rows in place, but no column advances on update
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   code: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   details_table: CODEC(ZSTD(1))
-- NEEDS A DECISION: No version column: without one ClickHouse keeps an arbitrary row per key on merge. Inventing a now() would make the load non-deterministic and unvalidatable, so this needs a decision — add an updated_at to the source, or accept last-writer-wins by insertion order.
CREATE TABLE `lsmb_raw`.`trans_type` (
    `code` String,
    `description` String,
    `details_table` Nullable(String)
)
ENGINE = ReplacingMergeTree
ORDER BY (`code`);

-- source: public.transactions
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   locked_by: CODEC(Delta, ZSTD(1))
--   approved_by: CODEC(Delta, ZSTD(1))
--   approved_at: CODEC(Delta, ZSTD(1))
--   workflow_id: CODEC(Delta, ZSTD(1))
--   reversing: CODEC(Delta, ZSTD(1))
--   reference: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   trans_type_code: CODEC(ZSTD(1))
--   entered_by: CODEC(Delta, ZSTD(1))
--   notes: CODEC(ZSTD(1))
--   batch_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`transactions` (
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
ORDER BY (`id`);

-- source: public.trial_balance__yearend_types
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   type: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`trial_balance__yearend_types` (
    `type` String
)
ENGINE = MergeTree
ORDER BY (`type`);

-- source: public.user_preference
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   user_id: CODEC(Delta, ZSTD(1))
--   name: CODEC(ZSTD(1))
--   value: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`user_preference` (
    `id` Int32,
    `user_id` Nullable(Int32),
    `name` String,
    `value` String
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.users
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   username: CODEC(ZSTD(1))
--   notify_password: CODEC(ZSTD(1))
--   entity_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`users` (
    `id` Int32,
    `username` String,
    `notify_password` String,
    `entity_id` Int32
)
ENGINE = MergeTree
ORDER BY (`username`);

-- source: public.warehouse
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   id: CODEC(Delta, ZSTD(1))
--   description: CODEC(ZSTD(1))
--   last_updated: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`warehouse` (
    `id` Int32,
    `description` Nullable(String),
    `last_updated` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY (`id`);

-- source: public.warehouse_inventory
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   entity_id: CODEC(Delta, ZSTD(1))
--   warehouse_id: CODEC(Delta, ZSTD(1))
--   parts_id: CODEC(Delta, ZSTD(1))
--   trans_id: CODEC(Delta, ZSTD(1))
--   orderitems_id: CODEC(Delta, ZSTD(1))
--   entry_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`warehouse_inventory` (
    `entity_id` Nullable(Int32),
    `warehouse_id` Nullable(Int32),
    `parts_id` Nullable(Int32),
    `trans_id` Nullable(Int32),
    `orderitems_id` Nullable(Int32),
    `qty` Nullable(Decimal128(4)),
    `shippingdate` Nullable(Date32),
    `entry_id` Int32
)
ENGINE = MergeTree
ORDER BY (`entry_id`);

-- source: public.workflow
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   workflow_id: CODEC(Delta, ZSTD(1))
--   type: CODEC(ZSTD(1))
--   state: CODEC(ZSTD(1))
--   last_update: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`workflow` (
    `workflow_id` Int32,
    `type` LowCardinality(String),
    `state` LowCardinality(String),
    `last_update` DateTime64(6)
)
ENGINE = MergeTree
ORDER BY (`workflow_id`);

-- source: public.workflow_context
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   workflow_id: CODEC(Delta, ZSTD(1))
--   context: CODEC(ZSTD(1))
CREATE TABLE `lsmb_raw`.`workflow_context` (
    `workflow_id` Int32,
    `context` Nullable(String)
)
ENGINE = MergeTree
ORDER BY (`workflow_id`);

-- source: public.workflow_history
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   workflow_hist_id: CODEC(Delta, ZSTD(1))
--   workflow_id: CODEC(Delta, ZSTD(1))
--   action: CODEC(ZSTD(1))
--   description: CODEC(ZSTD(1))
--   state: CODEC(ZSTD(1))
--   workflow_user: CODEC(ZSTD(1))
--   history_date: CODEC(Delta, ZSTD(1))
--   workflow_entity_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`workflow_history` (
    `workflow_hist_id` Int32,
    `workflow_id` Int32,
    `action` String,
    `description` Nullable(String),
    `state` String,
    `workflow_user` Nullable(String),
    `history_date` Nullable(DateTime64(6)),
    `workflow_entity_id` Nullable(Int32)
)
ENGINE = MergeTree
ORDER BY (`workflow_hist_id`);

-- source: public.yearend
-- engine: no updates or deletes recorded against the source, so the table is append-only
-- order by: no query-shape evidence available for this table, so this is the primary key rather than a derivation. Populate pg_stat_statements, or compile the application's queries, and re-map before relying on it.
-- partitioning: no low-cardinality time column; an unpartitioned table is the right default
-- codecs chosen from the profile, NOT emitted: the RFC 0160 classifier cannot parse a
-- CODEC clause, and the control is worth more than the compression.
--   trans_id: CODEC(Delta, ZSTD(1))
CREATE TABLE `lsmb_raw`.`yearend` (
    `trans_id` Int32,
    `reversed` Nullable(Bool),
    `transdate` Nullable(Date32)
)
ENGINE = MergeTree
ORDER BY (`trans_id`);
