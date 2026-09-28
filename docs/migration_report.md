# Migration report — ledgersmb-analytics-official

**Snapshot:** `2214 facts #5ada06149834`

**Not signable.** The blockers are listed below, before the content.

## Blockers

- **units not validated** — 168 unit(s) are not validated or signed off: public.ac_tax_form, public.acc_trans, public.account, … and 165 more
- **unexplained divergences** — 520 divergence(s) have neither an approved disposition nor an explaining rule
- **planted control missed** — 1 control(s) did not fire: no planted controls were run through `ekos migrate validate`. A tier that cannot catch a planted defect does not get to report green.

**Groundedness:** 1.000 (coverage 1.000 × validity 1.000 × grounded rate 1.000), threshold 0.950

## Scope

Every unit under migration, with the state it has reached.

public.ac_tax_form is profiled. [MigrationUnit:public.ac_tax_form]

public.acc_trans is profiled. [MigrationUnit:public.acc_trans]

public.account is profiled. [MigrationUnit:public.account]

public.account_checkpoint is profiled. [MigrationUnit:public.account_checkpoint]

public.account_heading is profiled. [MigrationUnit:public.account_heading]

public.account_heading_translation is profiled. [MigrationUnit:public.account_heading_translation]

public.account_link is profiled. [MigrationUnit:public.account_link]

public.account_link_description is profiled. [MigrationUnit:public.account_link_description]

public.account_translation is profiled. [MigrationUnit:public.account_translation]

public.ap is profiled. [MigrationUnit:public.ap]

public.ar is profiled. [MigrationUnit:public.ar]

public.assembly is profiled. [MigrationUnit:public.assembly]

public.asset_class is profiled. [MigrationUnit:public.asset_class]

public.asset_dep_method is profiled. [MigrationUnit:public.asset_dep_method]

public.asset_disposal_method is profiled. [MigrationUnit:public.asset_disposal_method]

public.asset_item is profiled. [MigrationUnit:public.asset_item]

public.asset_note is assessed. [MigrationUnit:public.asset_note]

public.asset_report is profiled. [MigrationUnit:public.asset_report]

public.asset_report_class is profiled. [MigrationUnit:public.asset_report_class]

public.asset_report_line is profiled. [MigrationUnit:public.asset_report_line]

public.asset_rl_to_disposal_method is profiled. [MigrationUnit:public.asset_rl_to_disposal_method]

public.asset_unit_class is profiled. [MigrationUnit:public.asset_unit_class]

public.audittrail is profiled. [MigrationUnit:public.audittrail]

public.batch is profiled. [MigrationUnit:public.batch]

public.batch_class is profiled. [MigrationUnit:public.batch_class]

public.bu_class_to_module is profiled. [MigrationUnit:public.bu_class_to_module]

public.budget_info is profiled. [MigrationUnit:public.budget_info]

public.budget_line is profiled. [MigrationUnit:public.budget_line]

public.budget_note is profiled. [MigrationUnit:public.budget_note]

public.budget_to_business_unit is profiled. [MigrationUnit:public.budget_to_business_unit]

public.business is profiled. [MigrationUnit:public.business]

public.business_unit is profiled. [MigrationUnit:public.business_unit]

public.business_unit_ac is profiled. [MigrationUnit:public.business_unit_ac]

public.business_unit_class is profiled. [MigrationUnit:public.business_unit_class]

public.business_unit_inv is profiled. [MigrationUnit:public.business_unit_inv]

public.business_unit_jl is profiled. [MigrationUnit:public.business_unit_jl]

public.business_unit_oitem is profiled. [MigrationUnit:public.business_unit_oitem]

public.business_unit_translation is profiled. [MigrationUnit:public.business_unit_translation]

public.company is profiled. [MigrationUnit:public.company]

public.contact_class is profiled. [MigrationUnit:public.contact_class]

public.country is profiled. [MigrationUnit:public.country]

public.country_tax_form is profiled. [MigrationUnit:public.country_tax_form]

public.cr_coa_to_account is profiled. [MigrationUnit:public.cr_coa_to_account]

public.cr_report is profiled. [MigrationUnit:public.cr_report]

public.cr_report_line is profiled. [MigrationUnit:public.cr_report_line]

public.cr_report_line_links is profiled. [MigrationUnit:public.cr_report_line_links]

public.currency is profiled. [MigrationUnit:public.currency]

public.custom_attribute_metadata is profiled. [MigrationUnit:public.custom_attribute_metadata]

public.defaults is profiled. [MigrationUnit:public.defaults]

public.eca_invoice is profiled. [MigrationUnit:public.eca_invoice]

public.eca_note is profiled. [MigrationUnit:public.eca_note]

public.eca_tax is profiled. [MigrationUnit:public.eca_tax]

public.eca_to_contact is profiled. [MigrationUnit:public.eca_to_contact]

public.eca_to_location is profiled. [MigrationUnit:public.eca_to_location]

public.email is profiled. [MigrationUnit:public.email]

public.employee_class is profiled. [MigrationUnit:public.employee_class]

public.employee_to_ec is profiled. [MigrationUnit:public.employee_to_ec]

public.entity is profiled. [MigrationUnit:public.entity]

public.entity_bank_account is profiled. [MigrationUnit:public.entity_bank_account]

public.entity_class is profiled. [MigrationUnit:public.entity_class]

public.entity_credit_account is profiled. [MigrationUnit:public.entity_credit_account]

public.entity_employee is profiled. [MigrationUnit:public.entity_employee]

public.entity_note is profiled. [MigrationUnit:public.entity_note]

public.entity_other_name is profiled. [MigrationUnit:public.entity_other_name]

public.entity_to_contact is profiled. [MigrationUnit:public.entity_to_contact]

public.entity_to_location is profiled. [MigrationUnit:public.entity_to_location]

public.exchangerate_default is profiled. [MigrationUnit:public.exchangerate_default]

public.exchangerate_type is profiled. [MigrationUnit:public.exchangerate_type]

public.file_base is profiled. [MigrationUnit:public.file_base]

public.file_class is profiled. [MigrationUnit:public.file_class]

public.file_eca is profiled. [MigrationUnit:public.file_eca]

public.file_email is profiled. [MigrationUnit:public.file_email]

public.file_entity is profiled. [MigrationUnit:public.file_entity]

public.file_incoming is profiled. [MigrationUnit:public.file_incoming]

public.file_internal is profiled. [MigrationUnit:public.file_internal]

public.file_order is profiled. [MigrationUnit:public.file_order]

public.file_order_to_order is profiled. [MigrationUnit:public.file_order_to_order]

public.file_order_to_tx is profiled. [MigrationUnit:public.file_order_to_tx]

public.file_part is profiled. [MigrationUnit:public.file_part]

public.file_reconciliation is profiled. [MigrationUnit:public.file_reconciliation]

public.file_secondary_attachment is profiled. [MigrationUnit:public.file_secondary_attachment]

public.file_transaction is profiled. [MigrationUnit:public.file_transaction]

public.file_tx_to_order is profiled. [MigrationUnit:public.file_tx_to_order]

public.file_view_catalog is profiled. [MigrationUnit:public.file_view_catalog]

public.gifi is profiled. [MigrationUnit:public.gifi]

public.gl is profiled. [MigrationUnit:public.gl]

public.inventory_report is profiled. [MigrationUnit:public.inventory_report]

public.inventory_report_line is profiled. [MigrationUnit:public.inventory_report_line]

public.invoice is profiled. [MigrationUnit:public.invoice]

public.invoice_note is profiled. [MigrationUnit:public.invoice_note]

public.invoice_tax_form is profiled. [MigrationUnit:public.invoice_tax_form]

public.jcitems is profiled. [MigrationUnit:public.jcitems]

public.jctype is profiled. [MigrationUnit:public.jctype]

public.job is profiled. [MigrationUnit:public.job]

public.journal_entry is profiled. [MigrationUnit:public.journal_entry]

public.journal_line is profiled. [MigrationUnit:public.journal_line]

public.journal_note is profiled. [MigrationUnit:public.journal_note]

public.journal_type is profiled. [MigrationUnit:public.journal_type]

public.language is profiled. [MigrationUnit:public.language]

public.location is profiled. [MigrationUnit:public.location]

public.location_class is profiled. [MigrationUnit:public.location_class]

public.location_class_to_entity_class is assessed. [MigrationUnit:public.location_class_to_entity_class]

public.lsmb_module is profiled. [MigrationUnit:public.lsmb_module]

public.lsmb_sequence is profiled. [MigrationUnit:public.lsmb_sequence]

public.makemodel is profiled. [MigrationUnit:public.makemodel]

public.menu_acl is profiled. [MigrationUnit:public.menu_acl]

public.menu_node is profiled. [MigrationUnit:public.menu_node]

public.mfg_lot is profiled. [MigrationUnit:public.mfg_lot]

public.mfg_lot_item is profiled. [MigrationUnit:public.mfg_lot_item]

public.mime_type is profiled. [MigrationUnit:public.mime_type]

public.note_class is profiled. [MigrationUnit:public.note_class]

public.oe is profiled. [MigrationUnit:public.oe]

public.oe_class is profiled. [MigrationUnit:public.oe_class]

public.oe_tax is profiled. [MigrationUnit:public.oe_tax]

public.open_forms is profiled. [MigrationUnit:public.open_forms]

public.open_item is profiled. [MigrationUnit:public.open_item]

public.orderitems is profiled. [MigrationUnit:public.orderitems]

public.overpayment is profiled. [MigrationUnit:public.overpayment]

public.parts is profiled. [MigrationUnit:public.parts]

public.parts_translation is profiled. [MigrationUnit:public.parts_translation]

public.partscustomer is profiled. [MigrationUnit:public.partscustomer]

public.partsgroup is profiled. [MigrationUnit:public.partsgroup]

public.partsgroup_translation is profiled. [MigrationUnit:public.partsgroup_translation]

public.partstax is profiled. [MigrationUnit:public.partstax]

public.partsvendor is profiled. [MigrationUnit:public.partsvendor]

public.payment is profiled. [MigrationUnit:public.payment]

public.payment_type is profiled. [MigrationUnit:public.payment_type]

public.payroll_deduction is profiled. [MigrationUnit:public.payroll_deduction]

public.payroll_deduction_class is profiled. [MigrationUnit:public.payroll_deduction_class]

public.payroll_deduction_type is profiled. [MigrationUnit:public.payroll_deduction_type]

public.payroll_employee_class is profiled. [MigrationUnit:public.payroll_employee_class]

public.payroll_employee_class_to_income_type is profiled. [MigrationUnit:public.payroll_employee_class_to_income_type]

public.payroll_income_category is assessed. [MigrationUnit:public.payroll_income_category]

public.payroll_income_class is profiled. [MigrationUnit:public.payroll_income_class]

public.payroll_income_type is profiled. [MigrationUnit:public.payroll_income_type]

public.payroll_paid_timeoff is profiled. [MigrationUnit:public.payroll_paid_timeoff]

public.payroll_pto_class is profiled. [MigrationUnit:public.payroll_pto_class]

public.payroll_report is profiled. [MigrationUnit:public.payroll_report]

public.payroll_report_line is profiled. [MigrationUnit:public.payroll_report_line]

public.payroll_wage is profiled. [MigrationUnit:public.payroll_wage]

public.person is profiled. [MigrationUnit:public.person]

public.person_to_company is profiled. [MigrationUnit:public.person_to_company]

public.pricegroup is profiled. [MigrationUnit:public.pricegroup]

public.recurring is profiled. [MigrationUnit:public.recurring]

public.recurringemail is profiled. [MigrationUnit:public.recurringemail]

public.recurringprint is profiled. [MigrationUnit:public.recurringprint]

public.robot is profiled. [MigrationUnit:public.robot]

public.salutation is profiled. [MigrationUnit:public.salutation]

public.session is profiled. [MigrationUnit:public.session]

public.session_history is profiled. [MigrationUnit:public.session_history]

public.sic is profiled. [MigrationUnit:public.sic]

public.tax is profiled. [MigrationUnit:public.tax]

public.tax_exempt_reason is profiled. [MigrationUnit:public.tax_exempt_reason]

public.tax_extended is profiled. [MigrationUnit:public.tax_extended]

public.taxcategory is profiled. [MigrationUnit:public.taxcategory]

public.taxmodule is profiled. [MigrationUnit:public.taxmodule]

public.template is assessed. [MigrationUnit:public.template]

public.trans_type is profiled. [MigrationUnit:public.trans_type]

public.transactions is profiled. [MigrationUnit:public.transactions]

public.trial_balance__yearend_types is profiled. [MigrationUnit:public.trial_balance__yearend_types]

public.user_preference is profiled. [MigrationUnit:public.user_preference]

public.users is profiled. [MigrationUnit:public.users]

public.warehouse is profiled. [MigrationUnit:public.warehouse]

public.warehouse_inventory is profiled. [MigrationUnit:public.warehouse_inventory]

public.workflow is profiled. [MigrationUnit:public.workflow]

public.workflow_context is profiled. [MigrationUnit:public.workflow_context]

public.workflow_history is profiled. [MigrationUnit:public.workflow_history]

public.yearend is profiled. [MigrationUnit:public.yearend]

## Findings

Data-quality and target-compatibility findings, with the rows each affects, where that was measured.

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.ac_tax_form: not measured. [MigrationFinding:public.ac_tax_form]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.acc_trans: not measured. [MigrationFinding:public.acc_trans]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.acc_trans.amount_bc: not measured. [MigrationFinding:public.acc_trans.amount_bc]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.acc_trans.amount_tc: not measured. [MigrationFinding:public.acc_trans.amount_tc]

DQ.UNIQ.001 on public.acc_trans.chart_id: 43471 row(s) affected. [MigrationFinding:public.acc_trans.chart_id]

COMPAT.CH.CHAR_PADDING on public.acc_trans.curr: 0 row(s) affected. [MigrationFinding:public.acc_trans.curr]

DQ.UNIQ.001 on public.acc_trans.entry_id: 0 row(s) affected. [MigrationFinding:public.acc_trans.entry_id]

DQ.UNIQ.001 on public.acc_trans.invoice_id: 18758 row(s) affected. [MigrationFinding:public.acc_trans.invoice_id]

DQ.COMPLETE.001 on public.acc_trans.memo: 0 row(s) affected. [MigrationFinding:public.acc_trans.memo]

DQ.UNIQ.001 on public.acc_trans.open_item_id: 3286 row(s) affected. [MigrationFinding:public.acc_trans.open_item_id]

DQ.COMPLETE.001 on public.acc_trans.source: 0 row(s) affected. [MigrationFinding:public.acc_trans.source]

DQ.UNIQ.001 on public.acc_trans.trans_id: 36384 row(s) affected. [MigrationFinding:public.acc_trans.trans_id]

COMPAT.CH.DATE_BEFORE_1900 on public.acc_trans.transdate: 0 row(s) affected. [MigrationFinding:public.acc_trans.transdate]

DQ.COMPLETE.002 on public.acc_trans.transdate: 0 row(s) affected. [MigrationFinding:public.acc_trans.transdate]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.account: not measured. [MigrationFinding:public.account]

COMPAT.CH.CHAR_PADDING on public.account.category: 0 row(s) affected. [MigrationFinding:public.account.category]

DQ.COMPLETE.001 on public.account.gifi_accno: 0 row(s) affected. [MigrationFinding:public.account.gifi_accno]

DQ.UNIQ.001 on public.account.id: 0 row(s) affected. [MigrationFinding:public.account.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.account_checkpoint: not measured. [MigrationFinding:public.account_checkpoint]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.account_checkpoint.amount_bc: not measured. [MigrationFinding:public.account_checkpoint.amount_bc]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.account_checkpoint.amount_tc: not measured. [MigrationFinding:public.account_checkpoint.amount_tc]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.account_checkpoint.credits: not measured. [MigrationFinding:public.account_checkpoint.credits]

COMPAT.CH.CHAR_PADDING on public.account_checkpoint.curr: 0 row(s) affected. [MigrationFinding:public.account_checkpoint.curr]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.account_checkpoint.debits: not measured. [MigrationFinding:public.account_checkpoint.debits]

COMPAT.CH.DATE_BEFORE_1900 on public.account_checkpoint.end_date: 0 row(s) affected. [MigrationFinding:public.account_checkpoint.end_date]

DQ.COMPLETE.002 on public.account_checkpoint.end_date: 0 row(s) affected. [MigrationFinding:public.account_checkpoint.end_date]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.account_heading: not measured. [MigrationFinding:public.account_heading]

COMPAT.CH.CHAR_PADDING on public.account_heading.category: 0 row(s) affected. [MigrationFinding:public.account_heading.category]

DQ.COMPLETE.001 on public.account_heading.category: 0 row(s) affected. [MigrationFinding:public.account_heading.category]

DQ.UNIQ.001 on public.account_heading.id: 0 row(s) affected. [MigrationFinding:public.account_heading.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.account_heading_translation: not measured. [MigrationFinding:public.account_heading_translation]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.account_link: not measured. [MigrationFinding:public.account_link]

DQ.UNIQ.001 on public.account_link.account_id: 10 row(s) affected. [MigrationFinding:public.account_link.account_id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.account_link_description: not measured. [MigrationFinding:public.account_link_description]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.account_translation: not measured. [MigrationFinding:public.account_translation]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.ap: not measured. [MigrationFinding:public.ap]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.ap.amount_bc: not measured. [MigrationFinding:public.ap.amount_bc]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.ap.amount_tc: not measured. [MigrationFinding:public.ap.amount_tc]

COMPAT.CH.DATE_BEFORE_1900 on public.ap.crdate: 0 row(s) affected. [MigrationFinding:public.ap.crdate]

DQ.COMPLETE.002 on public.ap.crdate: 0 row(s) affected. [MigrationFinding:public.ap.crdate]

COMPAT.CH.CHAR_PADDING on public.ap.curr: 0 row(s) affected. [MigrationFinding:public.ap.curr]

COMPAT.CH.DATE_BEFORE_1900 on public.ap.duedate: 0 row(s) affected. [MigrationFinding:public.ap.duedate]

DQ.COMPLETE.002 on public.ap.duedate: 0 row(s) affected. [MigrationFinding:public.ap.duedate]

DQ.COMPLETE.001 on public.ap.language_code: 0 row(s) affected. [MigrationFinding:public.ap.language_code]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.ap.netamount_bc: not measured. [MigrationFinding:public.ap.netamount_bc]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.ap.netamount_tc: not measured. [MigrationFinding:public.ap.netamount_tc]

DQ.COMPLETE.001 on public.ap.notes: 0 row(s) affected. [MigrationFinding:public.ap.notes]

DQ.UNIQ.001 on public.ap.open_item_id: 0 row(s) affected. [MigrationFinding:public.ap.open_item_id]

DQ.COMPLETE.001 on public.ap.ordnumber: 0 row(s) affected. [MigrationFinding:public.ap.ordnumber]

DQ.COMPLETE.001 on public.ap.ponumber: 0 row(s) affected. [MigrationFinding:public.ap.ponumber]

DQ.COMPLETE.001 on public.ap.quonumber: 0 row(s) affected. [MigrationFinding:public.ap.quonumber]

DQ.COMPLETE.001 on public.ap.shippingpoint: 0 row(s) affected. [MigrationFinding:public.ap.shippingpoint]

DQ.COMPLETE.001 on public.ap.shipto_attn: 0 row(s) affected. [MigrationFinding:public.ap.shipto_attn]

DQ.COMPLETE.001 on public.ap.shipvia: 0 row(s) affected. [MigrationFinding:public.ap.shipvia]

DQ.UNIQ.001 on public.ap.trans_id: 0 row(s) affected. [MigrationFinding:public.ap.trans_id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.ar: not measured. [MigrationFinding:public.ar]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.ar.amount_bc: not measured. [MigrationFinding:public.ar.amount_bc]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.ar.amount_tc: not measured. [MigrationFinding:public.ar.amount_tc]

COMPAT.CH.DATE_BEFORE_1900 on public.ar.crdate: 0 row(s) affected. [MigrationFinding:public.ar.crdate]

DQ.COMPLETE.002 on public.ar.crdate: 0 row(s) affected. [MigrationFinding:public.ar.crdate]

COMPAT.CH.CHAR_PADDING on public.ar.curr: 0 row(s) affected. [MigrationFinding:public.ar.curr]

COMPAT.CH.DATE_BEFORE_1900 on public.ar.duedate: 0 row(s) affected. [MigrationFinding:public.ar.duedate]

DQ.COMPLETE.002 on public.ar.duedate: 0 row(s) affected. [MigrationFinding:public.ar.duedate]

DQ.COMPLETE.001 on public.ar.language_code: 0 row(s) affected. [MigrationFinding:public.ar.language_code]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.ar.netamount_bc: not measured. [MigrationFinding:public.ar.netamount_bc]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.ar.netamount_tc: not measured. [MigrationFinding:public.ar.netamount_tc]

DQ.COMPLETE.001 on public.ar.notes: 0 row(s) affected. [MigrationFinding:public.ar.notes]

DQ.UNIQ.001 on public.ar.open_item_id: 0 row(s) affected. [MigrationFinding:public.ar.open_item_id]

DQ.COMPLETE.001 on public.ar.ordnumber: 0 row(s) affected. [MigrationFinding:public.ar.ordnumber]

DQ.COMPLETE.001 on public.ar.ponumber: 0 row(s) affected. [MigrationFinding:public.ar.ponumber]

DQ.COMPLETE.001 on public.ar.quonumber: 0 row(s) affected. [MigrationFinding:public.ar.quonumber]

DQ.COMPLETE.001 on public.ar.setting_sequence: 0 row(s) affected. [MigrationFinding:public.ar.setting_sequence]

DQ.COMPLETE.001 on public.ar.shippingpoint: 0 row(s) affected. [MigrationFinding:public.ar.shippingpoint]

DQ.COMPLETE.001 on public.ar.shipto_attn: 0 row(s) affected. [MigrationFinding:public.ar.shipto_attn]

DQ.COMPLETE.001 on public.ar.shipvia: 0 row(s) affected. [MigrationFinding:public.ar.shipvia]

DQ.UNIQ.001 on public.ar.trans_id: 0 row(s) affected. [MigrationFinding:public.ar.trans_id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.assembly: not measured. [MigrationFinding:public.assembly]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.assembly.qty: not measured. [MigrationFinding:public.assembly.qty]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.asset_class: not measured. [MigrationFinding:public.asset_class]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.asset_dep_method: not measured. [MigrationFinding:public.asset_dep_method]

DQ.UNIQ.001 on public.asset_dep_method.id: 0 row(s) affected. [MigrationFinding:public.asset_dep_method.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.asset_disposal_method: not measured. [MigrationFinding:public.asset_disposal_method]

DQ.UNIQ.001 on public.asset_disposal_method.id: 0 row(s) affected. [MigrationFinding:public.asset_disposal_method.id]

COMPAT.CH.CHAR_PADDING on public.asset_disposal_method.short_label: 0 row(s) affected. [MigrationFinding:public.asset_disposal_method.short_label]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.asset_item: not measured. [MigrationFinding:public.asset_item]

COMPAT.CH.DATE_BEFORE_1900 on public.asset_item.purchase_date: 0 row(s) affected. [MigrationFinding:public.asset_item.purchase_date]

DQ.COMPLETE.002 on public.asset_item.purchase_date: 0 row(s) affected. [MigrationFinding:public.asset_item.purchase_date]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.asset_item.purchase_value: not measured. [MigrationFinding:public.asset_item.purchase_value]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.asset_item.salvage_value: not measured. [MigrationFinding:public.asset_item.salvage_value]

COMPAT.CH.DATE_BEFORE_1900 on public.asset_item.start_depreciation: 0 row(s) affected. [MigrationFinding:public.asset_item.start_depreciation]

DQ.COMPLETE.002 on public.asset_item.start_depreciation: 0 row(s) affected. [MigrationFinding:public.asset_item.start_depreciation]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.asset_item.usable_life: not measured. [MigrationFinding:public.asset_item.usable_life]

COMPAT.CH.DATE_BEFORE_1900 on public.asset_note.created: 0 row(s) affected. [MigrationFinding:public.asset_note.created]

COMPAT.CH.INFINITE_TIMESTAMP on public.asset_note.created: 0 row(s) affected. [MigrationFinding:public.asset_note.created]

DQ.COMPLETE.002 on public.asset_note.created: 0 row(s) affected. [MigrationFinding:public.asset_note.created]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.asset_report: not measured. [MigrationFinding:public.asset_report]

COMPAT.CH.DATE_BEFORE_1900 on public.asset_report.approved_at: 0 row(s) affected. [MigrationFinding:public.asset_report.approved_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.asset_report.approved_at: 0 row(s) affected. [MigrationFinding:public.asset_report.approved_at]

DQ.COMPLETE.002 on public.asset_report.approved_at: 0 row(s) affected. [MigrationFinding:public.asset_report.approved_at]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.asset_report.depreciated_qty: not measured. [MigrationFinding:public.asset_report.depreciated_qty]

COMPAT.CH.DATE_BEFORE_1900 on public.asset_report.entered_at: 0 row(s) affected. [MigrationFinding:public.asset_report.entered_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.asset_report.entered_at: 0 row(s) affected. [MigrationFinding:public.asset_report.entered_at]

DQ.COMPLETE.002 on public.asset_report.entered_at: 0 row(s) affected. [MigrationFinding:public.asset_report.entered_at]

COMPAT.CH.DATE_BEFORE_1900 on public.asset_report.report_date: 0 row(s) affected. [MigrationFinding:public.asset_report.report_date]

DQ.COMPLETE.002 on public.asset_report.report_date: 0 row(s) affected. [MigrationFinding:public.asset_report.report_date]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.asset_report_class: not measured. [MigrationFinding:public.asset_report_class]

DQ.UNIQ.001 on public.asset_report_class.id: 0 row(s) affected. [MigrationFinding:public.asset_report_class.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.asset_report_line: not measured. [MigrationFinding:public.asset_report_line]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.asset_report_line.amount: not measured. [MigrationFinding:public.asset_report_line.amount]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.asset_rl_to_disposal_method: not measured. [MigrationFinding:public.asset_rl_to_disposal_method]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.asset_rl_to_disposal_method.percent_disposed: not measured. [MigrationFinding:public.asset_rl_to_disposal_method.percent_disposed]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.asset_unit_class: not measured. [MigrationFinding:public.asset_unit_class]

DQ.UNIQ.001 on public.asset_unit_class.id: 0 row(s) affected. [MigrationFinding:public.asset_unit_class.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.audittrail: not measured. [MigrationFinding:public.audittrail]

DQ.UNIQ.001 on public.audittrail.entry_id: 0 row(s) affected. [MigrationFinding:public.audittrail.entry_id]

DQ.COMPLETE.001 on public.audittrail.formname: 0 row(s) affected. [MigrationFinding:public.audittrail.formname]

DQ.UNIQ.001 on public.audittrail.trans_id: 0 row(s) affected. [MigrationFinding:public.audittrail.trans_id]

COMPAT.CH.DATE_BEFORE_1900 on public.audittrail.transdate: 0 row(s) affected. [MigrationFinding:public.audittrail.transdate]

COMPAT.CH.INFINITE_TIMESTAMP on public.audittrail.transdate: 0 row(s) affected. [MigrationFinding:public.audittrail.transdate]

DQ.COMPLETE.002 on public.audittrail.transdate: 0 row(s) affected. [MigrationFinding:public.audittrail.transdate]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.batch: not measured. [MigrationFinding:public.batch]

COMPAT.CH.DATE_BEFORE_1900 on public.batch.approved_on: 0 row(s) affected. [MigrationFinding:public.batch.approved_on]

DQ.COMPLETE.002 on public.batch.approved_on: 0 row(s) affected. [MigrationFinding:public.batch.approved_on]

COMPAT.CH.DATE_BEFORE_1900 on public.batch.created_on: 0 row(s) affected. [MigrationFinding:public.batch.created_on]

DQ.COMPLETE.002 on public.batch.created_on: 0 row(s) affected. [MigrationFinding:public.batch.created_on]

COMPAT.CH.DATE_BEFORE_1900 on public.batch.default_date: 0 row(s) affected. [MigrationFinding:public.batch.default_date]

DQ.COMPLETE.002 on public.batch.default_date: 0 row(s) affected. [MigrationFinding:public.batch.default_date]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.batch_class: not measured. [MigrationFinding:public.batch_class]

DQ.UNIQ.001 on public.batch_class.id: 0 row(s) affected. [MigrationFinding:public.batch_class.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.bu_class_to_module: not measured. [MigrationFinding:public.bu_class_to_module]

DQ.UNIQ.001 on public.bu_class_to_module.bu_class_id: 42 row(s) affected. [MigrationFinding:public.bu_class_to_module.bu_class_id]

DQ.UNIQ.001 on public.bu_class_to_module.module_id: 42 row(s) affected. [MigrationFinding:public.bu_class_to_module.module_id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.budget_info: not measured. [MigrationFinding:public.budget_info]

COMPAT.CH.DATE_BEFORE_1900 on public.budget_info.approved_at: 0 row(s) affected. [MigrationFinding:public.budget_info.approved_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.budget_info.approved_at: 0 row(s) affected. [MigrationFinding:public.budget_info.approved_at]

DQ.COMPLETE.002 on public.budget_info.approved_at: 0 row(s) affected. [MigrationFinding:public.budget_info.approved_at]

COMPAT.CH.DATE_BEFORE_1900 on public.budget_info.end_date: 0 row(s) affected. [MigrationFinding:public.budget_info.end_date]

DQ.COMPLETE.002 on public.budget_info.end_date: 0 row(s) affected. [MigrationFinding:public.budget_info.end_date]

COMPAT.CH.DATE_BEFORE_1900 on public.budget_info.entered_at: 0 row(s) affected. [MigrationFinding:public.budget_info.entered_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.budget_info.entered_at: 0 row(s) affected. [MigrationFinding:public.budget_info.entered_at]

DQ.COMPLETE.002 on public.budget_info.entered_at: 0 row(s) affected. [MigrationFinding:public.budget_info.entered_at]

COMPAT.CH.DATE_BEFORE_1900 on public.budget_info.obsolete_at: 0 row(s) affected. [MigrationFinding:public.budget_info.obsolete_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.budget_info.obsolete_at: 0 row(s) affected. [MigrationFinding:public.budget_info.obsolete_at]

DQ.COMPLETE.002 on public.budget_info.obsolete_at: 0 row(s) affected. [MigrationFinding:public.budget_info.obsolete_at]

COMPAT.CH.DATE_BEFORE_1900 on public.budget_info.start_date: 0 row(s) affected. [MigrationFinding:public.budget_info.start_date]

DQ.COMPLETE.002 on public.budget_info.start_date: 0 row(s) affected. [MigrationFinding:public.budget_info.start_date]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.budget_line: not measured. [MigrationFinding:public.budget_line]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.budget_line.amount: not measured. [MigrationFinding:public.budget_line.amount]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.budget_line.amount_tc: not measured. [MigrationFinding:public.budget_line.amount_tc]

COMPAT.CH.CHAR_PADDING on public.budget_line.curr: 0 row(s) affected. [MigrationFinding:public.budget_line.curr]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.budget_note: not measured. [MigrationFinding:public.budget_note]

COMPAT.CH.DATE_BEFORE_1900 on public.budget_note.created: 0 row(s) affected. [MigrationFinding:public.budget_note.created]

COMPAT.CH.INFINITE_TIMESTAMP on public.budget_note.created: 0 row(s) affected. [MigrationFinding:public.budget_note.created]

DQ.COMPLETE.002 on public.budget_note.created: 0 row(s) affected. [MigrationFinding:public.budget_note.created]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.budget_to_business_unit: not measured. [MigrationFinding:public.budget_to_business_unit]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.business: not measured. [MigrationFinding:public.business]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.business.discount: not measured. [MigrationFinding:public.business.discount]

DQ.UNIQ.001 on public.business.id: 0 row(s) affected. [MigrationFinding:public.business.id]

COMPAT.CH.DATE_BEFORE_1900 on public.business.last_updated: 0 row(s) affected. [MigrationFinding:public.business.last_updated]

COMPAT.CH.INFINITE_TIMESTAMP on public.business.last_updated: 0 row(s) affected. [MigrationFinding:public.business.last_updated]

DQ.COMPLETE.002 on public.business.last_updated: 0 row(s) affected. [MigrationFinding:public.business.last_updated]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.business_unit: not measured. [MigrationFinding:public.business_unit]

DQ.UNIQ.001 on public.business_unit.class_id: 83 row(s) affected. [MigrationFinding:public.business_unit.class_id]

DQ.UNIQ.001 on public.business_unit.control_code: 0 row(s) affected. [MigrationFinding:public.business_unit.control_code]

DQ.UNIQ.001 on public.business_unit.credit_id: 0 row(s) affected. [MigrationFinding:public.business_unit.credit_id]

COMPAT.CH.DATE_BEFORE_1900 on public.business_unit.end_date: 0 row(s) affected. [MigrationFinding:public.business_unit.end_date]

DQ.COMPLETE.002 on public.business_unit.end_date: 0 row(s) affected. [MigrationFinding:public.business_unit.end_date]

DQ.UNIQ.001 on public.business_unit.id: 0 row(s) affected. [MigrationFinding:public.business_unit.id]

COMPAT.CH.DATE_BEFORE_1900 on public.business_unit.start_date: 0 row(s) affected. [MigrationFinding:public.business_unit.start_date]

DQ.COMPLETE.002 on public.business_unit.start_date: 0 row(s) affected. [MigrationFinding:public.business_unit.start_date]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.business_unit_ac: not measured. [MigrationFinding:public.business_unit_ac]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.business_unit_class: not measured. [MigrationFinding:public.business_unit_class]

DQ.UNIQ.001 on public.business_unit_class.id: 0 row(s) affected. [MigrationFinding:public.business_unit_class.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.business_unit_inv: not measured. [MigrationFinding:public.business_unit_inv]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.business_unit_jl: not measured. [MigrationFinding:public.business_unit_jl]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.business_unit_oitem: not measured. [MigrationFinding:public.business_unit_oitem]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.business_unit_translation: not measured. [MigrationFinding:public.business_unit_translation]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.company: not measured. [MigrationFinding:public.company]

COMPAT.CH.DATE_BEFORE_1900 on public.company.created: 0 row(s) affected. [MigrationFinding:public.company.created]

DQ.COMPLETE.002 on public.company.created: 0 row(s) affected. [MigrationFinding:public.company.created]

DQ.UNIQ.001 on public.company.entity_id: 0 row(s) affected. [MigrationFinding:public.company.entity_id]

DQ.UNIQ.001 on public.company.id: 0 row(s) affected. [MigrationFinding:public.company.id]

DQ.COMPLETE.001 on public.company.license_number: 0 row(s) affected. [MigrationFinding:public.company.license_number]

DQ.COMPLETE.001 on public.company.sales_tax_id: 0 row(s) affected. [MigrationFinding:public.company.sales_tax_id]

DQ.COMPLETE.001 on public.company.sic_code: 0 row(s) affected. [MigrationFinding:public.company.sic_code]

DQ.UNIQ.001 on public.company.tax_id: 0 row(s) affected. [MigrationFinding:public.company.tax_id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.contact_class: not measured. [MigrationFinding:public.contact_class]

DQ.UNIQ.001 on public.contact_class.id: 0 row(s) affected. [MigrationFinding:public.contact_class.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.country: not measured. [MigrationFinding:public.country]

DQ.UNIQ.001 on public.country.id: 0 row(s) affected. [MigrationFinding:public.country.id]

DQ.COMPLETE.001 on public.country.itu: 0 row(s) affected. [MigrationFinding:public.country.itu]

COMPAT.CH.DATE_BEFORE_1900 on public.country.last_updated: 0 row(s) affected. [MigrationFinding:public.country.last_updated]

COMPAT.CH.INFINITE_TIMESTAMP on public.country.last_updated: 0 row(s) affected. [MigrationFinding:public.country.last_updated]

DQ.COMPLETE.002 on public.country.last_updated: 0 row(s) affected. [MigrationFinding:public.country.last_updated]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.country_tax_form: not measured. [MigrationFinding:public.country_tax_form]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.cr_coa_to_account: not measured. [MigrationFinding:public.cr_coa_to_account]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.cr_report: not measured. [MigrationFinding:public.cr_report]

COMPAT.CH.DATE_BEFORE_1900 on public.cr_report.end_date: 0 row(s) affected. [MigrationFinding:public.cr_report.end_date]

DQ.COMPLETE.002 on public.cr_report.end_date: 0 row(s) affected. [MigrationFinding:public.cr_report.end_date]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.cr_report.their_total: not measured. [MigrationFinding:public.cr_report.their_total]

COMPAT.CH.DATE_BEFORE_1900 on public.cr_report.updated: 0 row(s) affected. [MigrationFinding:public.cr_report.updated]

COMPAT.CH.INFINITE_TIMESTAMP on public.cr_report.updated: 0 row(s) affected. [MigrationFinding:public.cr_report.updated]

DQ.COMPLETE.002 on public.cr_report.updated: 0 row(s) affected. [MigrationFinding:public.cr_report.updated]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.cr_report_line: not measured. [MigrationFinding:public.cr_report_line]

COMPAT.CH.DATE_BEFORE_1900 on public.cr_report_line.clear_time: 0 row(s) affected. [MigrationFinding:public.cr_report_line.clear_time]

DQ.COMPLETE.002 on public.cr_report_line.clear_time: 0 row(s) affected. [MigrationFinding:public.cr_report_line.clear_time]

COMPAT.CH.DATE_BEFORE_1900 on public.cr_report_line.insert_time: 0 row(s) affected. [MigrationFinding:public.cr_report_line.insert_time]

COMPAT.CH.INFINITE_TIMESTAMP on public.cr_report_line.insert_time: 0 row(s) affected. [MigrationFinding:public.cr_report_line.insert_time]

DQ.COMPLETE.002 on public.cr_report_line.insert_time: 0 row(s) affected. [MigrationFinding:public.cr_report_line.insert_time]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.cr_report_line.our_balance: not measured. [MigrationFinding:public.cr_report_line.our_balance]

COMPAT.CH.DATE_BEFORE_1900 on public.cr_report_line.post_date: 0 row(s) affected. [MigrationFinding:public.cr_report_line.post_date]

DQ.COMPLETE.002 on public.cr_report_line.post_date: 0 row(s) affected. [MigrationFinding:public.cr_report_line.post_date]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.cr_report_line.their_balance: not measured. [MigrationFinding:public.cr_report_line.their_balance]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.cr_report_line_links: not measured. [MigrationFinding:public.cr_report_line_links]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.currency: not measured. [MigrationFinding:public.currency]

COMPAT.CH.CHAR_PADDING on public.currency.curr: 0 row(s) affected. [MigrationFinding:public.currency.curr]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.custom_attribute_metadata: not measured. [MigrationFinding:public.custom_attribute_metadata]

COMPAT.CH.DATE_BEFORE_1900 on public.custom_attribute_metadata.obsolete: 0 row(s) affected. [MigrationFinding:public.custom_attribute_metadata.obsolete]

DQ.COMPLETE.002 on public.custom_attribute_metadata.obsolete: 0 row(s) affected. [MigrationFinding:public.custom_attribute_metadata.obsolete]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.defaults: not measured. [MigrationFinding:public.defaults]

DQ.UNIQ.001 on public.defaults.setting_key: 0 row(s) affected. [MigrationFinding:public.defaults.setting_key]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.eca_invoice: not measured. [MigrationFinding:public.eca_invoice]

COMPAT.CH.DATE_BEFORE_1900 on public.eca_invoice.due: 0 row(s) affected. [MigrationFinding:public.eca_invoice.due]

DQ.COMPLETE.002 on public.eca_invoice.due: 0 row(s) affected. [MigrationFinding:public.eca_invoice.due]

COMPAT.CH.CHAR_PADDING on public.eca_invoice.language_code: 0 row(s) affected. [MigrationFinding:public.eca_invoice.language_code]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.eca_note: not measured. [MigrationFinding:public.eca_note]

COMPAT.CH.DATE_BEFORE_1900 on public.eca_note.created: 0 row(s) affected. [MigrationFinding:public.eca_note.created]

COMPAT.CH.INFINITE_TIMESTAMP on public.eca_note.created: 0 row(s) affected. [MigrationFinding:public.eca_note.created]

DQ.COMPLETE.002 on public.eca_note.created: 0 row(s) affected. [MigrationFinding:public.eca_note.created]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.eca_tax: not measured. [MigrationFinding:public.eca_tax]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.eca_to_contact: not measured. [MigrationFinding:public.eca_to_contact]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.eca_to_location: not measured. [MigrationFinding:public.eca_to_location]

COMPAT.CH.DATE_BEFORE_1900 on public.eca_to_location.created: 0 row(s) affected. [MigrationFinding:public.eca_to_location.created]

DQ.COMPLETE.002 on public.eca_to_location.created: 0 row(s) affected. [MigrationFinding:public.eca_to_location.created]

DQ.UNIQ.001 on public.eca_to_location.credit_id: 0 row(s) affected. [MigrationFinding:public.eca_to_location.credit_id]

COMPAT.CH.DATE_BEFORE_1900 on public.eca_to_location.inactive_date: 0 row(s) affected. [MigrationFinding:public.eca_to_location.inactive_date]

COMPAT.CH.INFINITE_TIMESTAMP on public.eca_to_location.inactive_date: 0 row(s) affected. [MigrationFinding:public.eca_to_location.inactive_date]

DQ.COMPLETE.002 on public.eca_to_location.inactive_date: 0 row(s) affected. [MigrationFinding:public.eca_to_location.inactive_date]

DQ.UNIQ.001 on public.eca_to_location.location_id: 0 row(s) affected. [MigrationFinding:public.eca_to_location.location_id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.email: not measured. [MigrationFinding:public.email]

COMPAT.CH.DATE_BEFORE_1900 on public.email.sent_date: 0 row(s) affected. [MigrationFinding:public.email.sent_date]

DQ.COMPLETE.002 on public.email.sent_date: 0 row(s) affected. [MigrationFinding:public.email.sent_date]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.employee_class: not measured. [MigrationFinding:public.employee_class]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.employee_to_ec: not measured. [MigrationFinding:public.employee_to_ec]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.entity: not measured. [MigrationFinding:public.entity]

DQ.UNIQ.001 on public.entity.control_code: 0 row(s) affected. [MigrationFinding:public.entity.control_code]

DQ.UNIQ.001 on public.entity.country_id: 84 row(s) affected. [MigrationFinding:public.entity.country_id]

COMPAT.CH.DATE_BEFORE_1900 on public.entity.created: 0 row(s) affected. [MigrationFinding:public.entity.created]

DQ.COMPLETE.002 on public.entity.created: 0 row(s) affected. [MigrationFinding:public.entity.created]

DQ.UNIQ.001 on public.entity.id: 0 row(s) affected. [MigrationFinding:public.entity.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.entity_bank_account: not measured. [MigrationFinding:public.entity_bank_account]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.entity_class: not measured. [MigrationFinding:public.entity_class]

DQ.UNIQ.001 on public.entity_class.id: 0 row(s) affected. [MigrationFinding:public.entity_class.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.entity_credit_account: not measured. [MigrationFinding:public.entity_credit_account]

DQ.UNIQ.001 on public.entity_credit_account.ar_ap_account_id: 83 row(s) affected. [MigrationFinding:public.entity_credit_account.ar_ap_account_id]

DQ.UNIQ.001 on public.entity_credit_account.business_id: 56 row(s) affected. [MigrationFinding:public.entity_credit_account.business_id]

DQ.UNIQ.001 on public.entity_credit_account.cash_account_id: 84 row(s) affected. [MigrationFinding:public.entity_credit_account.cash_account_id]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.entity_credit_account.creditlimit: not measured. [MigrationFinding:public.entity_credit_account.creditlimit]

COMPAT.CH.CHAR_PADDING on public.entity_credit_account.curr: 0 row(s) affected. [MigrationFinding:public.entity_credit_account.curr]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.entity_credit_account.discount: not measured. [MigrationFinding:public.entity_credit_account.discount]

COMPAT.CH.DATE_BEFORE_1900 on public.entity_credit_account.enddate: 0 row(s) affected. [MigrationFinding:public.entity_credit_account.enddate]

DQ.COMPLETE.002 on public.entity_credit_account.enddate: 0 row(s) affected. [MigrationFinding:public.entity_credit_account.enddate]

DQ.UNIQ.001 on public.entity_credit_account.entity_id: 0 row(s) affected. [MigrationFinding:public.entity_credit_account.entity_id]

DQ.UNIQ.001 on public.entity_credit_account.id: 0 row(s) affected. [MigrationFinding:public.entity_credit_account.id]

DQ.UNIQ.001 on public.entity_credit_account.language_code: 84 row(s) affected. [MigrationFinding:public.entity_credit_account.language_code]

COMPAT.CH.DATE_BEFORE_1900 on public.entity_credit_account.startdate: 0 row(s) affected. [MigrationFinding:public.entity_credit_account.startdate]

DQ.COMPLETE.002 on public.entity_credit_account.startdate: 0 row(s) affected. [MigrationFinding:public.entity_credit_account.startdate]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.entity_credit_account.threshold: not measured. [MigrationFinding:public.entity_credit_account.threshold]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.entity_employee: not measured. [MigrationFinding:public.entity_employee]

COMPAT.CH.DATE_BEFORE_1900 on public.entity_employee.dob: 0 row(s) affected. [MigrationFinding:public.entity_employee.dob]

DQ.COMPLETE.002 on public.entity_employee.dob: 0 row(s) affected. [MigrationFinding:public.entity_employee.dob]

COMPAT.CH.DATE_BEFORE_1900 on public.entity_employee.enddate: 0 row(s) affected. [MigrationFinding:public.entity_employee.enddate]

DQ.COMPLETE.002 on public.entity_employee.enddate: 0 row(s) affected. [MigrationFinding:public.entity_employee.enddate]

COMPAT.CH.DATE_BEFORE_1900 on public.entity_employee.startdate: 0 row(s) affected. [MigrationFinding:public.entity_employee.startdate]

DQ.COMPLETE.002 on public.entity_employee.startdate: 0 row(s) affected. [MigrationFinding:public.entity_employee.startdate]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.entity_note: not measured. [MigrationFinding:public.entity_note]

COMPAT.CH.DATE_BEFORE_1900 on public.entity_note.created: 0 row(s) affected. [MigrationFinding:public.entity_note.created]

COMPAT.CH.INFINITE_TIMESTAMP on public.entity_note.created: 0 row(s) affected. [MigrationFinding:public.entity_note.created]

DQ.COMPLETE.002 on public.entity_note.created: 0 row(s) affected. [MigrationFinding:public.entity_note.created]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.entity_other_name: not measured. [MigrationFinding:public.entity_other_name]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.entity_to_contact: not measured. [MigrationFinding:public.entity_to_contact]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.entity_to_location: not measured. [MigrationFinding:public.entity_to_location]

COMPAT.CH.DATE_BEFORE_1900 on public.entity_to_location.created: 0 row(s) affected. [MigrationFinding:public.entity_to_location.created]

DQ.COMPLETE.002 on public.entity_to_location.created: 0 row(s) affected. [MigrationFinding:public.entity_to_location.created]

COMPAT.CH.DATE_BEFORE_1900 on public.entity_to_location.inactive_date: 0 row(s) affected. [MigrationFinding:public.entity_to_location.inactive_date]

COMPAT.CH.INFINITE_TIMESTAMP on public.entity_to_location.inactive_date: 0 row(s) affected. [MigrationFinding:public.entity_to_location.inactive_date]

DQ.COMPLETE.002 on public.entity_to_location.inactive_date: 0 row(s) affected. [MigrationFinding:public.entity_to_location.inactive_date]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.exchangerate_default: not measured. [MigrationFinding:public.exchangerate_default]

COMPAT.CH.CHAR_PADDING on public.exchangerate_default.curr: 0 row(s) affected. [MigrationFinding:public.exchangerate_default.curr]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.exchangerate_default.rate: not measured. [MigrationFinding:public.exchangerate_default.rate]

COMPAT.CH.DATE_BEFORE_1900 on public.exchangerate_default.valid_from: 0 row(s) affected. [MigrationFinding:public.exchangerate_default.valid_from]

DQ.COMPLETE.002 on public.exchangerate_default.valid_from: 0 row(s) affected. [MigrationFinding:public.exchangerate_default.valid_from]

COMPAT.CH.DATE_BEFORE_1900 on public.exchangerate_default.valid_to: 0 row(s) affected. [MigrationFinding:public.exchangerate_default.valid_to]

DQ.COMPLETE.002 on public.exchangerate_default.valid_to: 0 row(s) affected. [MigrationFinding:public.exchangerate_default.valid_to]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.exchangerate_type: not measured. [MigrationFinding:public.exchangerate_type]

DQ.UNIQ.001 on public.exchangerate_type.id: 0 row(s) affected. [MigrationFinding:public.exchangerate_type.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_base: not measured. [MigrationFinding:public.file_base]

COMPAT.CH.DATE_BEFORE_1900 on public.file_base.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_base.uploaded_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.file_base.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_base.uploaded_at]

DQ.COMPLETE.002 on public.file_base.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_base.uploaded_at]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_class: not measured. [MigrationFinding:public.file_class]

DQ.UNIQ.001 on public.file_class.id: 0 row(s) affected. [MigrationFinding:public.file_class.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_eca: not measured. [MigrationFinding:public.file_eca]

COMPAT.CH.DATE_BEFORE_1900 on public.file_eca.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_eca.uploaded_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.file_eca.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_eca.uploaded_at]

DQ.COMPLETE.002 on public.file_eca.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_eca.uploaded_at]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_email: not measured. [MigrationFinding:public.file_email]

COMPAT.CH.DATE_BEFORE_1900 on public.file_email.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_email.uploaded_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.file_email.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_email.uploaded_at]

DQ.COMPLETE.002 on public.file_email.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_email.uploaded_at]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_entity: not measured. [MigrationFinding:public.file_entity]

COMPAT.CH.DATE_BEFORE_1900 on public.file_entity.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_entity.uploaded_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.file_entity.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_entity.uploaded_at]

DQ.COMPLETE.002 on public.file_entity.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_entity.uploaded_at]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_incoming: not measured. [MigrationFinding:public.file_incoming]

COMPAT.CH.DATE_BEFORE_1900 on public.file_incoming.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_incoming.uploaded_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.file_incoming.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_incoming.uploaded_at]

DQ.COMPLETE.002 on public.file_incoming.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_incoming.uploaded_at]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_internal: not measured. [MigrationFinding:public.file_internal]

COMPAT.CH.DATE_BEFORE_1900 on public.file_internal.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_internal.uploaded_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.file_internal.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_internal.uploaded_at]

DQ.COMPLETE.002 on public.file_internal.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_internal.uploaded_at]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_order: not measured. [MigrationFinding:public.file_order]

COMPAT.CH.DATE_BEFORE_1900 on public.file_order.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_order.uploaded_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.file_order.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_order.uploaded_at]

DQ.COMPLETE.002 on public.file_order.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_order.uploaded_at]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_order_to_order: not measured. [MigrationFinding:public.file_order_to_order]

COMPAT.CH.DATE_BEFORE_1900 on public.file_order_to_order.attached_at: 0 row(s) affected. [MigrationFinding:public.file_order_to_order.attached_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.file_order_to_order.attached_at: 0 row(s) affected. [MigrationFinding:public.file_order_to_order.attached_at]

DQ.COMPLETE.002 on public.file_order_to_order.attached_at: 0 row(s) affected. [MigrationFinding:public.file_order_to_order.attached_at]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_order_to_tx: not measured. [MigrationFinding:public.file_order_to_tx]

COMPAT.CH.DATE_BEFORE_1900 on public.file_order_to_tx.attached_at: 0 row(s) affected. [MigrationFinding:public.file_order_to_tx.attached_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.file_order_to_tx.attached_at: 0 row(s) affected. [MigrationFinding:public.file_order_to_tx.attached_at]

DQ.COMPLETE.002 on public.file_order_to_tx.attached_at: 0 row(s) affected. [MigrationFinding:public.file_order_to_tx.attached_at]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_part: not measured. [MigrationFinding:public.file_part]

COMPAT.CH.DATE_BEFORE_1900 on public.file_part.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_part.uploaded_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.file_part.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_part.uploaded_at]

DQ.COMPLETE.002 on public.file_part.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_part.uploaded_at]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_reconciliation: not measured. [MigrationFinding:public.file_reconciliation]

COMPAT.CH.DATE_BEFORE_1900 on public.file_reconciliation.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_reconciliation.uploaded_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.file_reconciliation.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_reconciliation.uploaded_at]

DQ.COMPLETE.002 on public.file_reconciliation.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_reconciliation.uploaded_at]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_secondary_attachment: not measured. [MigrationFinding:public.file_secondary_attachment]

COMPAT.CH.DATE_BEFORE_1900 on public.file_secondary_attachment.attached_at: 0 row(s) affected. [MigrationFinding:public.file_secondary_attachment.attached_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.file_secondary_attachment.attached_at: 0 row(s) affected. [MigrationFinding:public.file_secondary_attachment.attached_at]

DQ.COMPLETE.002 on public.file_secondary_attachment.attached_at: 0 row(s) affected. [MigrationFinding:public.file_secondary_attachment.attached_at]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_transaction: not measured. [MigrationFinding:public.file_transaction]

COMPAT.CH.DATE_BEFORE_1900 on public.file_transaction.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_transaction.uploaded_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.file_transaction.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_transaction.uploaded_at]

DQ.COMPLETE.002 on public.file_transaction.uploaded_at: 0 row(s) affected. [MigrationFinding:public.file_transaction.uploaded_at]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_tx_to_order: not measured. [MigrationFinding:public.file_tx_to_order]

COMPAT.CH.DATE_BEFORE_1900 on public.file_tx_to_order.attached_at: 0 row(s) affected. [MigrationFinding:public.file_tx_to_order.attached_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.file_tx_to_order.attached_at: 0 row(s) affected. [MigrationFinding:public.file_tx_to_order.attached_at]

DQ.COMPLETE.002 on public.file_tx_to_order.attached_at: 0 row(s) affected. [MigrationFinding:public.file_tx_to_order.attached_at]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.file_view_catalog: not measured. [MigrationFinding:public.file_view_catalog]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.gifi: not measured. [MigrationFinding:public.gifi]

COMPAT.CH.DATE_BEFORE_1900 on public.gifi.last_updated: 0 row(s) affected. [MigrationFinding:public.gifi.last_updated]

COMPAT.CH.INFINITE_TIMESTAMP on public.gifi.last_updated: 0 row(s) affected. [MigrationFinding:public.gifi.last_updated]

DQ.COMPLETE.002 on public.gifi.last_updated: 0 row(s) affected. [MigrationFinding:public.gifi.last_updated]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.gl: not measured. [MigrationFinding:public.gl]

DQ.UNIQ.001 on public.gl.id: 0 row(s) affected. [MigrationFinding:public.gl.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.inventory_report: not measured. [MigrationFinding:public.inventory_report]

DQ.UNIQ.001 on public.inventory_report.id: 0 row(s) affected. [MigrationFinding:public.inventory_report.id]

COMPAT.CH.DATE_BEFORE_1900 on public.inventory_report.report_date: 0 row(s) affected. [MigrationFinding:public.inventory_report.report_date]

DQ.COMPLETE.002 on public.inventory_report.report_date: 0 row(s) affected. [MigrationFinding:public.inventory_report.report_date]

DQ.UNIQ.001 on public.inventory_report.trans_id: 0 row(s) affected. [MigrationFinding:public.inventory_report.trans_id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.inventory_report_line: not measured. [MigrationFinding:public.inventory_report_line]

DQ.UNIQ.001 on public.inventory_report_line.adjust_id: 642 row(s) affected. [MigrationFinding:public.inventory_report_line.adjust_id]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.inventory_report_line.counted: not measured. [MigrationFinding:public.inventory_report_line.counted]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.inventory_report_line.expected: not measured. [MigrationFinding:public.inventory_report_line.expected]

DQ.UNIQ.001 on public.inventory_report_line.parts_id: 540 row(s) affected. [MigrationFinding:public.inventory_report_line.parts_id]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.inventory_report_line.variance: not measured. [MigrationFinding:public.inventory_report_line.variance]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.invoice: not measured. [MigrationFinding:public.invoice]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.invoice.allocated: not measured. [MigrationFinding:public.invoice.allocated]

COMPAT.CH.DATE_BEFORE_1900 on public.invoice.deliverydate: 0 row(s) affected. [MigrationFinding:public.invoice.deliverydate]

DQ.COMPLETE.002 on public.invoice.deliverydate: 0 row(s) affected. [MigrationFinding:public.invoice.deliverydate]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.invoice.discount: not measured. [MigrationFinding:public.invoice.discount]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.invoice.fxsellprice: not measured. [MigrationFinding:public.invoice.fxsellprice]

DQ.UNIQ.001 on public.invoice.id: 0 row(s) affected. [MigrationFinding:public.invoice.id]

DQ.COMPLETE.001 on public.invoice.notes: 0 row(s) affected. [MigrationFinding:public.invoice.notes]

DQ.UNIQ.001 on public.invoice.parts_id: 11016 row(s) affected. [MigrationFinding:public.invoice.parts_id]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.invoice.qty: not measured. [MigrationFinding:public.invoice.qty]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.invoice.sellprice: not measured. [MigrationFinding:public.invoice.sellprice]

DQ.COMPLETE.001 on public.invoice.serialnumber: 0 row(s) affected. [MigrationFinding:public.invoice.serialnumber]

DQ.UNIQ.001 on public.invoice.trans_id: 7446 row(s) affected. [MigrationFinding:public.invoice.trans_id]

DQ.COMPLETE.001 on public.invoice.vendor_sku: 0 row(s) affected. [MigrationFinding:public.invoice.vendor_sku]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.invoice_note: not measured. [MigrationFinding:public.invoice_note]

COMPAT.CH.DATE_BEFORE_1900 on public.invoice_note.created: 0 row(s) affected. [MigrationFinding:public.invoice_note.created]

COMPAT.CH.INFINITE_TIMESTAMP on public.invoice_note.created: 0 row(s) affected. [MigrationFinding:public.invoice_note.created]

DQ.COMPLETE.002 on public.invoice_note.created: 0 row(s) affected. [MigrationFinding:public.invoice_note.created]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.invoice_tax_form: not measured. [MigrationFinding:public.invoice_tax_form]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.jcitems: not measured. [MigrationFinding:public.jcitems]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.jcitems.allocated: not measured. [MigrationFinding:public.jcitems.allocated]

COMPAT.CH.DATE_BEFORE_1900 on public.jcitems.checkedin: 0 row(s) affected. [MigrationFinding:public.jcitems.checkedin]

COMPAT.CH.INFINITE_TIMESTAMP on public.jcitems.checkedin: 0 row(s) affected. [MigrationFinding:public.jcitems.checkedin]

DQ.COMPLETE.002 on public.jcitems.checkedin: 0 row(s) affected. [MigrationFinding:public.jcitems.checkedin]

COMPAT.CH.DATE_BEFORE_1900 on public.jcitems.checkedout: 0 row(s) affected. [MigrationFinding:public.jcitems.checkedout]

COMPAT.CH.INFINITE_TIMESTAMP on public.jcitems.checkedout: 0 row(s) affected. [MigrationFinding:public.jcitems.checkedout]

DQ.COMPLETE.002 on public.jcitems.checkedout: 0 row(s) affected. [MigrationFinding:public.jcitems.checkedout]

COMPAT.CH.CHAR_PADDING on public.jcitems.curr: 0 row(s) affected. [MigrationFinding:public.jcitems.curr]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.jcitems.fxsellprice: not measured. [MigrationFinding:public.jcitems.fxsellprice]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.jcitems.non_billable: not measured. [MigrationFinding:public.jcitems.non_billable]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.jcitems.qty: not measured. [MigrationFinding:public.jcitems.qty]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.jcitems.sellprice: not measured. [MigrationFinding:public.jcitems.sellprice]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.jcitems.total: not measured. [MigrationFinding:public.jcitems.total]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.jctype: not measured. [MigrationFinding:public.jctype]

DQ.UNIQ.001 on public.jctype.id: 0 row(s) affected. [MigrationFinding:public.jctype.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.job: not measured. [MigrationFinding:public.job]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.job.completed: not measured. [MigrationFinding:public.job.completed]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.job.production: not measured. [MigrationFinding:public.job.production]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.journal_entry: not measured. [MigrationFinding:public.journal_entry]

COMPAT.CH.CHAR_PADDING on public.journal_entry.currency: 0 row(s) affected. [MigrationFinding:public.journal_entry.currency]

COMPAT.CH.DATE_BEFORE_1900 on public.journal_entry.effective_end: 0 row(s) affected. [MigrationFinding:public.journal_entry.effective_end]

DQ.COMPLETE.002 on public.journal_entry.effective_end: 0 row(s) affected. [MigrationFinding:public.journal_entry.effective_end]

COMPAT.CH.DATE_BEFORE_1900 on public.journal_entry.effective_start: 0 row(s) affected. [MigrationFinding:public.journal_entry.effective_start]

DQ.COMPLETE.002 on public.journal_entry.effective_start: 0 row(s) affected. [MigrationFinding:public.journal_entry.effective_start]

COMPAT.CH.DATE_BEFORE_1900 on public.journal_entry.post_date: 0 row(s) affected. [MigrationFinding:public.journal_entry.post_date]

DQ.COMPLETE.002 on public.journal_entry.post_date: 0 row(s) affected. [MigrationFinding:public.journal_entry.post_date]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.journal_line: not measured. [MigrationFinding:public.journal_line]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.journal_line.amount: not measured. [MigrationFinding:public.journal_line.amount]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.journal_line.amount_tc: not measured. [MigrationFinding:public.journal_line.amount_tc]

COMPAT.CH.CHAR_PADDING on public.journal_line.curr: 0 row(s) affected. [MigrationFinding:public.journal_line.curr]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.journal_note: not measured. [MigrationFinding:public.journal_note]

COMPAT.CH.DATE_BEFORE_1900 on public.journal_note.created: 0 row(s) affected. [MigrationFinding:public.journal_note.created]

COMPAT.CH.INFINITE_TIMESTAMP on public.journal_note.created: 0 row(s) affected. [MigrationFinding:public.journal_note.created]

DQ.COMPLETE.002 on public.journal_note.created: 0 row(s) affected. [MigrationFinding:public.journal_note.created]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.journal_type: not measured. [MigrationFinding:public.journal_type]

DQ.UNIQ.001 on public.journal_type.id: 0 row(s) affected. [MigrationFinding:public.journal_type.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.language: not measured. [MigrationFinding:public.language]

COMPAT.CH.DATE_BEFORE_1900 on public.language.last_updated: 0 row(s) affected. [MigrationFinding:public.language.last_updated]

COMPAT.CH.INFINITE_TIMESTAMP on public.language.last_updated: 0 row(s) affected. [MigrationFinding:public.language.last_updated]

DQ.COMPLETE.002 on public.language.last_updated: 0 row(s) affected. [MigrationFinding:public.language.last_updated]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.location: not measured. [MigrationFinding:public.location]

DQ.UNIQ.001 on public.location.country_id: 84 row(s) affected. [MigrationFinding:public.location.country_id]

DQ.UNIQ.001 on public.location.id: 0 row(s) affected. [MigrationFinding:public.location.id]

DQ.COMPLETE.001 on public.location.line_three: 0 row(s) affected. [MigrationFinding:public.location.line_three]

DQ.COMPLETE.001 on public.location.line_two: 0 row(s) affected. [MigrationFinding:public.location.line_two]

DQ.UNIQ.001 on public.location.mail_code: 0 row(s) affected. [MigrationFinding:public.location.mail_code]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.location_class: not measured. [MigrationFinding:public.location_class]

DQ.UNIQ.001 on public.location_class.id: 0 row(s) affected. [MigrationFinding:public.location_class.id]

DQ.UNIQ.001 on public.location_class_to_entity_class.id: 0 row(s) affected. [MigrationFinding:public.location_class_to_entity_class.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.lsmb_module: not measured. [MigrationFinding:public.lsmb_module]

DQ.UNIQ.001 on public.lsmb_module.id: 0 row(s) affected. [MigrationFinding:public.lsmb_module.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.lsmb_sequence: not measured. [MigrationFinding:public.lsmb_sequence]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.makemodel: not measured. [MigrationFinding:public.makemodel]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.menu_acl: not measured. [MigrationFinding:public.menu_acl]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.menu_node: not measured. [MigrationFinding:public.menu_node]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.mfg_lot.qty: not measured. [MigrationFinding:public.mfg_lot.qty]

COMPAT.CH.DATE_BEFORE_1900 on public.mfg_lot.stock_date: 0 row(s) affected. [MigrationFinding:public.mfg_lot.stock_date]

DQ.COMPLETE.002 on public.mfg_lot.stock_date: 0 row(s) affected. [MigrationFinding:public.mfg_lot.stock_date]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.mfg_lot_item.qty: not measured. [MigrationFinding:public.mfg_lot_item.qty]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.mime_type: not measured. [MigrationFinding:public.mime_type]

DQ.UNIQ.001 on public.mime_type.id: 0 row(s) affected. [MigrationFinding:public.mime_type.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.note_class: not measured. [MigrationFinding:public.note_class]

DQ.UNIQ.001 on public.note_class.id: 0 row(s) affected. [MigrationFinding:public.note_class.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.oe: not measured. [MigrationFinding:public.oe]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.oe.amount_tc: not measured. [MigrationFinding:public.oe.amount_tc]

COMPAT.CH.CHAR_PADDING on public.oe.curr: 0 row(s) affected. [MigrationFinding:public.oe.curr]

DQ.UNIQ.001 on public.oe.id: 0 row(s) affected. [MigrationFinding:public.oe.id]

DQ.COMPLETE.001 on public.oe.intnotes: 0 row(s) affected. [MigrationFinding:public.oe.intnotes]

DQ.COMPLETE.001 on public.oe.language_code: 0 row(s) affected. [MigrationFinding:public.oe.language_code]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.oe.netamount_tc: not measured. [MigrationFinding:public.oe.netamount_tc]

DQ.COMPLETE.001 on public.oe.notes: 0 row(s) affected. [MigrationFinding:public.oe.notes]

DQ.UNIQ.001 on public.oe.oe_class_id: 2111 row(s) affected. [MigrationFinding:public.oe.oe_class_id]

DQ.COMPLETE.001 on public.oe.ponumber: 0 row(s) affected. [MigrationFinding:public.oe.ponumber]

DQ.COMPLETE.001 on public.oe.quonumber: 0 row(s) affected. [MigrationFinding:public.oe.quonumber]

COMPAT.CH.DATE_BEFORE_1900 on public.oe.reqdate: 0 row(s) affected. [MigrationFinding:public.oe.reqdate]

DQ.COMPLETE.002 on public.oe.reqdate: 0 row(s) affected. [MigrationFinding:public.oe.reqdate]

DQ.COMPLETE.001 on public.oe.shippingpoint: 0 row(s) affected. [MigrationFinding:public.oe.shippingpoint]

DQ.COMPLETE.001 on public.oe.shipto_attn: 0 row(s) affected. [MigrationFinding:public.oe.shipto_attn]

DQ.COMPLETE.001 on public.oe.shipvia: 0 row(s) affected. [MigrationFinding:public.oe.shipvia]

COMPAT.CH.DATE_BEFORE_1900 on public.oe.transdate: 0 row(s) affected. [MigrationFinding:public.oe.transdate]

DQ.COMPLETE.002 on public.oe.transdate: 0 row(s) affected. [MigrationFinding:public.oe.transdate]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.oe_class: not measured. [MigrationFinding:public.oe_class]

DQ.UNIQ.001 on public.oe_class.id: 0 row(s) affected. [MigrationFinding:public.oe_class.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.oe_tax: not measured. [MigrationFinding:public.oe_tax]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.oe_tax.amount: not measured. [MigrationFinding:public.oe_tax.amount]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.oe_tax.basis: not measured. [MigrationFinding:public.oe_tax.basis]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.oe_tax.rate: not measured. [MigrationFinding:public.oe_tax.rate]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.open_forms: not measured. [MigrationFinding:public.open_forms]

COMPAT.CH.NUMERIC_PRECISION on public.open_forms.form_name: not measured. [MigrationFinding:public.open_forms.form_name]

COMPAT.CH.DATE_BEFORE_1900 on public.open_forms.last_used: 0 row(s) affected. [MigrationFinding:public.open_forms.last_used]

COMPAT.CH.INFINITE_TIMESTAMP on public.open_forms.last_used: 0 row(s) affected. [MigrationFinding:public.open_forms.last_used]

DQ.COMPLETE.002 on public.open_forms.last_used: 0 row(s) affected. [MigrationFinding:public.open_forms.last_used]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.open_item: not measured. [MigrationFinding:public.open_item]

DQ.UNIQ.001 on public.open_item.account_id: 3682 row(s) affected. [MigrationFinding:public.open_item.account_id]

DQ.UNIQ.001 on public.open_item.id: 0 row(s) affected. [MigrationFinding:public.open_item.id]

COMPAT.CH.CHAR_PADDING on public.open_item.item_type: 0 row(s) affected. [MigrationFinding:public.open_item.item_type]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.orderitems: not measured. [MigrationFinding:public.orderitems]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.orderitems.discount: not measured. [MigrationFinding:public.orderitems.discount]

DQ.UNIQ.001 on public.orderitems.id: 0 row(s) affected. [MigrationFinding:public.orderitems.id]

DQ.COMPLETE.001 on public.orderitems.notes: 0 row(s) affected. [MigrationFinding:public.orderitems.notes]

DQ.UNIQ.001 on public.orderitems.parts_id: 6063 row(s) affected. [MigrationFinding:public.orderitems.parts_id]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.orderitems.qty: not measured. [MigrationFinding:public.orderitems.qty]

COMPAT.CH.DATE_BEFORE_1900 on public.orderitems.reqdate: 0 row(s) affected. [MigrationFinding:public.orderitems.reqdate]

DQ.COMPLETE.002 on public.orderitems.reqdate: 0 row(s) affected. [MigrationFinding:public.orderitems.reqdate]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.orderitems.sellprice: not measured. [MigrationFinding:public.orderitems.sellprice]

DQ.COMPLETE.001 on public.orderitems.serialnumber: 0 row(s) affected. [MigrationFinding:public.orderitems.serialnumber]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.orderitems.ship: not measured. [MigrationFinding:public.orderitems.ship]

DQ.UNIQ.001 on public.orderitems.trans_id: 4065 row(s) affected. [MigrationFinding:public.orderitems.trans_id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.overpayment: not measured. [MigrationFinding:public.overpayment]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.parts: not measured. [MigrationFinding:public.parts]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.parts.avgcost: not measured. [MigrationFinding:public.parts.avgcost]

DQ.COMPLETE.001 on public.parts.bin: 0 row(s) affected. [MigrationFinding:public.parts.bin]

DQ.COMPLETE.001 on public.parts.drawing: 0 row(s) affected. [MigrationFinding:public.parts.drawing]

DQ.UNIQ.001 on public.parts.expense_accno_id: 113 row(s) affected. [MigrationFinding:public.parts.expense_accno_id]

DQ.UNIQ.001 on public.parts.id: 0 row(s) affected. [MigrationFinding:public.parts.id]

DQ.COMPLETE.001 on public.parts.image: 0 row(s) affected. [MigrationFinding:public.parts.image]

DQ.UNIQ.001 on public.parts.income_accno_id: 113 row(s) affected. [MigrationFinding:public.parts.income_accno_id]

DQ.UNIQ.001 on public.parts.inventory_accno_id: 107 row(s) affected. [MigrationFinding:public.parts.inventory_accno_id]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.parts.lastcost: not measured. [MigrationFinding:public.parts.lastcost]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.parts.listprice: not measured. [MigrationFinding:public.parts.listprice]

DQ.COMPLETE.001 on public.parts.microfiche: 0 row(s) affected. [MigrationFinding:public.parts.microfiche]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.parts.onhand: not measured. [MigrationFinding:public.parts.onhand]

DQ.UNIQ.001 on public.parts.partsgroup_id: 106 row(s) affected. [MigrationFinding:public.parts.partsgroup_id]

COMPAT.CH.DATE_BEFORE_1900 on public.parts.priceupdate: 0 row(s) affected. [MigrationFinding:public.parts.priceupdate]

DQ.COMPLETE.002 on public.parts.priceupdate: 0 row(s) affected. [MigrationFinding:public.parts.priceupdate]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.parts.rop: not measured. [MigrationFinding:public.parts.rop]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.parts.sellprice: not measured. [MigrationFinding:public.parts.sellprice]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.parts.weight: not measured. [MigrationFinding:public.parts.weight]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.parts_translation: not measured. [MigrationFinding:public.parts_translation]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.partscustomer: not measured. [MigrationFinding:public.partscustomer]

COMPAT.CH.CHAR_PADDING on public.partscustomer.curr: 0 row(s) affected. [MigrationFinding:public.partscustomer.curr]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.partscustomer.pricebreak: not measured. [MigrationFinding:public.partscustomer.pricebreak]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.partscustomer.qty: not measured. [MigrationFinding:public.partscustomer.qty]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.partscustomer.sellprice: not measured. [MigrationFinding:public.partscustomer.sellprice]

COMPAT.CH.DATE_BEFORE_1900 on public.partscustomer.validfrom: 0 row(s) affected. [MigrationFinding:public.partscustomer.validfrom]

DQ.COMPLETE.002 on public.partscustomer.validfrom: 0 row(s) affected. [MigrationFinding:public.partscustomer.validfrom]

COMPAT.CH.DATE_BEFORE_1900 on public.partscustomer.validto: 0 row(s) affected. [MigrationFinding:public.partscustomer.validto]

DQ.COMPLETE.002 on public.partscustomer.validto: 0 row(s) affected. [MigrationFinding:public.partscustomer.validto]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.partsgroup: not measured. [MigrationFinding:public.partsgroup]

DQ.UNIQ.001 on public.partsgroup.id: 0 row(s) affected. [MigrationFinding:public.partsgroup.id]

COMPAT.CH.DATE_BEFORE_1900 on public.partsgroup.last_updated: 0 row(s) affected. [MigrationFinding:public.partsgroup.last_updated]

COMPAT.CH.INFINITE_TIMESTAMP on public.partsgroup.last_updated: 0 row(s) affected. [MigrationFinding:public.partsgroup.last_updated]

DQ.COMPLETE.002 on public.partsgroup.last_updated: 0 row(s) affected. [MigrationFinding:public.partsgroup.last_updated]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.partsgroup_translation: not measured. [MigrationFinding:public.partsgroup_translation]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.partstax: not measured. [MigrationFinding:public.partstax]

DQ.UNIQ.001 on public.partstax.chart_id: 113 row(s) affected. [MigrationFinding:public.partstax.chart_id]

DQ.UNIQ.001 on public.partstax.parts_id: 0 row(s) affected. [MigrationFinding:public.partstax.parts_id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.partsvendor: not measured. [MigrationFinding:public.partsvendor]

COMPAT.CH.CHAR_PADDING on public.partsvendor.curr: 0 row(s) affected. [MigrationFinding:public.partsvendor.curr]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.partsvendor.lastcost: not measured. [MigrationFinding:public.partsvendor.lastcost]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.payment: not measured. [MigrationFinding:public.payment]

DQ.UNIQ.001 on public.payment.account_id: 3285 row(s) affected. [MigrationFinding:public.payment.account_id]

COMPAT.CH.CHAR_PADDING on public.payment.currency: 0 row(s) affected. [MigrationFinding:public.payment.currency]

DQ.UNIQ.001 on public.payment.entity_credit_id: 3201 row(s) affected. [MigrationFinding:public.payment.entity_credit_id]

DQ.UNIQ.001 on public.payment.id: 0 row(s) affected. [MigrationFinding:public.payment.id]

COMPAT.CH.DATE_BEFORE_1900 on public.payment.payment_date: 0 row(s) affected. [MigrationFinding:public.payment.payment_date]

DQ.COMPLETE.002 on public.payment.payment_date: 0 row(s) affected. [MigrationFinding:public.payment.payment_date]

DQ.UNIQ.001 on public.payment.trans_id: 0 row(s) affected. [MigrationFinding:public.payment.trans_id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.payment_type: not measured. [MigrationFinding:public.payment_type]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.payroll_deduction: not measured. [MigrationFinding:public.payroll_deduction]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.payroll_deduction.rate: not measured. [MigrationFinding:public.payroll_deduction.rate]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.payroll_deduction_class: not measured. [MigrationFinding:public.payroll_deduction_class]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.payroll_deduction_type.default_amount: not measured. [MigrationFinding:public.payroll_deduction_type.default_amount]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.payroll_employee_class: not measured. [MigrationFinding:public.payroll_employee_class]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.payroll_employee_class_to_income_type: not measured. [MigrationFinding:public.payroll_employee_class_to_income_type]

DQ.UNIQ.001 on public.payroll_income_category.id: 0 row(s) affected. [MigrationFinding:public.payroll_income_category.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.payroll_income_class: not measured. [MigrationFinding:public.payroll_income_class]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.payroll_income_type.default_amount: not measured. [MigrationFinding:public.payroll_income_type.default_amount]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.payroll_paid_timeoff.amount: not measured. [MigrationFinding:public.payroll_paid_timeoff.amount]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.payroll_pto_class: not measured. [MigrationFinding:public.payroll_pto_class]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.payroll_report: not measured. [MigrationFinding:public.payroll_report]

COMPAT.CH.DATE_BEFORE_1900 on public.payroll_report.payment_date: 0 row(s) affected. [MigrationFinding:public.payroll_report.payment_date]

DQ.COMPLETE.002 on public.payroll_report.payment_date: 0 row(s) affected. [MigrationFinding:public.payroll_report.payment_date]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.payroll_report_line: not measured. [MigrationFinding:public.payroll_report_line]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.payroll_report_line.qty: not measured. [MigrationFinding:public.payroll_report_line.qty]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.payroll_report_line.rate: not measured. [MigrationFinding:public.payroll_report_line.rate]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.payroll_wage: not measured. [MigrationFinding:public.payroll_wage]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.payroll_wage.rate: not measured. [MigrationFinding:public.payroll_wage.rate]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.person: not measured. [MigrationFinding:public.person]

COMPAT.CH.DATE_BEFORE_1900 on public.person.birthdate: 0 row(s) affected. [MigrationFinding:public.person.birthdate]

DQ.COMPLETE.002 on public.person.birthdate: 0 row(s) affected. [MigrationFinding:public.person.birthdate]

COMPAT.CH.DATE_BEFORE_1900 on public.person.created: 0 row(s) affected. [MigrationFinding:public.person.created]

DQ.COMPLETE.002 on public.person.created: 0 row(s) affected. [MigrationFinding:public.person.created]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.person_to_company: not measured. [MigrationFinding:public.person_to_company]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.pricegroup: not measured. [MigrationFinding:public.pricegroup]

COMPAT.CH.DATE_BEFORE_1900 on public.pricegroup.last_updated: 0 row(s) affected. [MigrationFinding:public.pricegroup.last_updated]

COMPAT.CH.INFINITE_TIMESTAMP on public.pricegroup.last_updated: 0 row(s) affected. [MigrationFinding:public.pricegroup.last_updated]

DQ.COMPLETE.002 on public.pricegroup.last_updated: 0 row(s) affected. [MigrationFinding:public.pricegroup.last_updated]

COMPAT.CH.DATE_BEFORE_1900 on public.recurring.enddate: 0 row(s) affected. [MigrationFinding:public.recurring.enddate]

DQ.COMPLETE.002 on public.recurring.enddate: 0 row(s) affected. [MigrationFinding:public.recurring.enddate]

COMPAT.CH.DATE_BEFORE_1900 on public.recurring.nextdate: 0 row(s) affected. [MigrationFinding:public.recurring.nextdate]

DQ.COMPLETE.002 on public.recurring.nextdate: 0 row(s) affected. [MigrationFinding:public.recurring.nextdate]

COMPAT.CH.DATE_BEFORE_1900 on public.recurring.startdate: 0 row(s) affected. [MigrationFinding:public.recurring.startdate]

DQ.COMPLETE.002 on public.recurring.startdate: 0 row(s) affected. [MigrationFinding:public.recurring.startdate]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.recurringemail: not measured. [MigrationFinding:public.recurringemail]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.recurringprint: not measured. [MigrationFinding:public.recurringprint]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.robot: not measured. [MigrationFinding:public.robot]

COMPAT.CH.DATE_BEFORE_1900 on public.robot.created: 0 row(s) affected. [MigrationFinding:public.robot.created]

DQ.COMPLETE.002 on public.robot.created: 0 row(s) affected. [MigrationFinding:public.robot.created]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.salutation: not measured. [MigrationFinding:public.salutation]

DQ.UNIQ.001 on public.salutation.id: 0 row(s) affected. [MigrationFinding:public.salutation.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.session: not measured. [MigrationFinding:public.session]

COMPAT.CH.DATE_BEFORE_1900 on public.session.last_used: 0 row(s) affected. [MigrationFinding:public.session.last_used]

COMPAT.CH.INFINITE_TIMESTAMP on public.session.last_used: 0 row(s) affected. [MigrationFinding:public.session.last_used]

DQ.COMPLETE.002 on public.session.last_used: 0 row(s) affected. [MigrationFinding:public.session.last_used]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.session_history: not measured. [MigrationFinding:public.session_history]

COMPAT.CH.DATE_BEFORE_1900 on public.session_history.created: 0 row(s) affected. [MigrationFinding:public.session_history.created]

COMPAT.CH.INFINITE_TIMESTAMP on public.session_history.created: 0 row(s) affected. [MigrationFinding:public.session_history.created]

DQ.COMPLETE.002 on public.session_history.created: 0 row(s) affected. [MigrationFinding:public.session_history.created]

COMPAT.CH.DATE_BEFORE_1900 on public.session_history.ended: 0 row(s) affected. [MigrationFinding:public.session_history.ended]

COMPAT.CH.INFINITE_TIMESTAMP on public.session_history.ended: 0 row(s) affected. [MigrationFinding:public.session_history.ended]

DQ.COMPLETE.002 on public.session_history.ended: 0 row(s) affected. [MigrationFinding:public.session_history.ended]

COMPAT.CH.DATE_BEFORE_1900 on public.session_history.last_used: 0 row(s) affected. [MigrationFinding:public.session_history.last_used]

COMPAT.CH.INFINITE_TIMESTAMP on public.session_history.last_used: 0 row(s) affected. [MigrationFinding:public.session_history.last_used]

DQ.COMPLETE.002 on public.session_history.last_used: 0 row(s) affected. [MigrationFinding:public.session_history.last_used]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.sic: not measured. [MigrationFinding:public.sic]

COMPAT.CH.DATE_BEFORE_1900 on public.sic.last_updated: 0 row(s) affected. [MigrationFinding:public.sic.last_updated]

COMPAT.CH.INFINITE_TIMESTAMP on public.sic.last_updated: 0 row(s) affected. [MigrationFinding:public.sic.last_updated]

DQ.COMPLETE.002 on public.sic.last_updated: 0 row(s) affected. [MigrationFinding:public.sic.last_updated]

COMPAT.CH.CHAR_PADDING on public.sic.sictype: 0 row(s) affected. [MigrationFinding:public.sic.sictype]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.tax: not measured. [MigrationFinding:public.tax]

DQ.UNIQ.001 on public.tax.chart_id: 0 row(s) affected. [MigrationFinding:public.tax.chart_id]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.tax.maxvalue: not measured. [MigrationFinding:public.tax.maxvalue]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.tax.minvalue: not measured. [MigrationFinding:public.tax.minvalue]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.tax.rate: not measured. [MigrationFinding:public.tax.rate]

DQ.UNIQ.001 on public.tax.taxmodule_id: 0 row(s) affected. [MigrationFinding:public.tax.taxmodule_id]

COMPAT.CH.DATE_BEFORE_1900 on public.tax.validto: 0 row(s) affected. [MigrationFinding:public.tax.validto]

COMPAT.CH.INFINITE_TIMESTAMP on public.tax.validto: 1 row(s) affected. [MigrationFinding:public.tax.validto]

DQ.COMPLETE.002 on public.tax.validto: 0 row(s) affected. [MigrationFinding:public.tax.validto]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.tax_exempt_reason: not measured. [MigrationFinding:public.tax_exempt_reason]

DQ.UNIQ.001 on public.tax_exempt_reason.id: 0 row(s) affected. [MigrationFinding:public.tax_exempt_reason.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.tax_extended: not measured. [MigrationFinding:public.tax_extended]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.tax_extended.rate: not measured. [MigrationFinding:public.tax_extended.rate]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.tax_extended.tax_basis: not measured. [MigrationFinding:public.tax_extended.tax_basis]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.taxcategory: not measured. [MigrationFinding:public.taxcategory]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.taxmodule: not measured. [MigrationFinding:public.taxmodule]

DQ.UNIQ.001 on public.taxmodule.taxmodule_id: 0 row(s) affected. [MigrationFinding:public.taxmodule.taxmodule_id]

COMPAT.CH.DATE_BEFORE_1900 on public.template.last_modified: 0 row(s) affected. [MigrationFinding:public.template.last_modified]

COMPAT.CH.INFINITE_TIMESTAMP on public.template.last_modified: 0 row(s) affected. [MigrationFinding:public.template.last_modified]

DQ.COMPLETE.002 on public.template.last_modified: 0 row(s) affected. [MigrationFinding:public.template.last_modified]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.trans_type: not measured. [MigrationFinding:public.trans_type]

COMPAT.CH.CHAR_PADDING on public.trans_type.code: 0 row(s) affected. [MigrationFinding:public.trans_type.code]

COMPAT.CH.NUMERIC_PRECISION on public.trans_type.description: not measured. [MigrationFinding:public.trans_type.description]

DQ.COMPLETE.001 on public.trans_type.details_table: 0 row(s) affected. [MigrationFinding:public.trans_type.details_table]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.transactions: not measured. [MigrationFinding:public.transactions]

COMPAT.CH.DATE_BEFORE_1900 on public.transactions.approved_at: 0 row(s) affected. [MigrationFinding:public.transactions.approved_at]

COMPAT.CH.INFINITE_TIMESTAMP on public.transactions.approved_at: 0 row(s) affected. [MigrationFinding:public.transactions.approved_at]

DQ.COMPLETE.002 on public.transactions.approved_at: 0 row(s) affected. [MigrationFinding:public.transactions.approved_at]

DQ.COMPLETE.001 on public.transactions.description: 0 row(s) affected. [MigrationFinding:public.transactions.description]

DQ.UNIQ.001 on public.transactions.id: 0 row(s) affected. [MigrationFinding:public.transactions.id]

DQ.COMPLETE.001 on public.transactions.notes: 0 row(s) affected. [MigrationFinding:public.transactions.notes]

COMPAT.CH.CHAR_PADDING on public.transactions.trans_type_code: 0 row(s) affected. [MigrationFinding:public.transactions.trans_type_code]

DQ.UNIQ.001 on public.transactions.trans_type_code: 7101 row(s) affected. [MigrationFinding:public.transactions.trans_type_code]

COMPAT.CH.DATE_BEFORE_1900 on public.transactions.transdate: 0 row(s) affected. [MigrationFinding:public.transactions.transdate]

DQ.COMPLETE.002 on public.transactions.transdate: 0 row(s) affected. [MigrationFinding:public.transactions.transdate]

DQ.UNIQ.001 on public.transactions.workflow_id: 0 row(s) affected. [MigrationFinding:public.transactions.workflow_id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.trial_balance__yearend_types: not measured. [MigrationFinding:public.trial_balance__yearend_types]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.user_preference: not measured. [MigrationFinding:public.user_preference]

DQ.UNIQ.001 on public.user_preference.id: 0 row(s) affected. [MigrationFinding:public.user_preference.id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.users: not measured. [MigrationFinding:public.users]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.warehouse: not measured. [MigrationFinding:public.warehouse]

COMPAT.CH.DATE_BEFORE_1900 on public.warehouse.last_updated: 0 row(s) affected. [MigrationFinding:public.warehouse.last_updated]

COMPAT.CH.INFINITE_TIMESTAMP on public.warehouse.last_updated: 0 row(s) affected. [MigrationFinding:public.warehouse.last_updated]

DQ.COMPLETE.002 on public.warehouse.last_updated: 0 row(s) affected. [MigrationFinding:public.warehouse.last_updated]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.warehouse_inventory: not measured. [MigrationFinding:public.warehouse_inventory]

COMPAT.CH.NUMERIC_UNCONSTRAINED on public.warehouse_inventory.qty: not measured. [MigrationFinding:public.warehouse_inventory.qty]

COMPAT.CH.DATE_BEFORE_1900 on public.warehouse_inventory.shippingdate: 0 row(s) affected. [MigrationFinding:public.warehouse_inventory.shippingdate]

DQ.COMPLETE.002 on public.warehouse_inventory.shippingdate: 0 row(s) affected. [MigrationFinding:public.warehouse_inventory.shippingdate]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.workflow: not measured. [MigrationFinding:public.workflow]

COMPAT.CH.DATE_BEFORE_1900 on public.workflow.last_update: 0 row(s) affected. [MigrationFinding:public.workflow.last_update]

COMPAT.CH.INFINITE_TIMESTAMP on public.workflow.last_update: 0 row(s) affected. [MigrationFinding:public.workflow.last_update]

DQ.COMPLETE.002 on public.workflow.last_update: 0 row(s) affected. [MigrationFinding:public.workflow.last_update]

DQ.UNIQ.001 on public.workflow.workflow_id: 0 row(s) affected. [MigrationFinding:public.workflow.workflow_id]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.workflow_context: not measured. [MigrationFinding:public.workflow_context]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.workflow_history: not measured. [MigrationFinding:public.workflow_history]

COMPAT.CH.NUMERIC_PRECISION on public.workflow_history.description: not measured. [MigrationFinding:public.workflow_history.description]

COMPAT.CH.DATE_BEFORE_1900 on public.workflow_history.history_date: 0 row(s) affected. [MigrationFinding:public.workflow_history.history_date]

COMPAT.CH.INFINITE_TIMESTAMP on public.workflow_history.history_date: 0 row(s) affected. [MigrationFinding:public.workflow_history.history_date]

DQ.COMPLETE.002 on public.workflow_history.history_date: 0 row(s) affected. [MigrationFinding:public.workflow_history.history_date]

COMPAT.CH.NO_CONSTRAINT_ENFORCEMENT on public.yearend: not measured. [MigrationFinding:public.yearend]

COMPAT.CH.DATE_BEFORE_1900 on public.yearend.transdate: 0 row(s) affected. [MigrationFinding:public.yearend.transdate]

DQ.COMPLETE.002 on public.yearend.transdate: 0 row(s) affected. [MigrationFinding:public.yearend.transdate]

## Approvals

Every approval request and what was decided.

REQ:public.acc_trans:sandbox is approved. [MigrationApproval:REQ:public.acc_trans:sandbox]

REQ:public.country:sandbox is approved. [MigrationApproval:REQ:public.country:sandbox]

REQ:public.entity:sandbox is approved. [MigrationApproval:REQ:public.entity:sandbox]

REQ:public.entity_credit_account:sandbox is approved. [MigrationApproval:REQ:public.entity_credit_account:sandbox]

REQ:public.parts:sandbox is approved. [MigrationApproval:REQ:public.parts:sandbox]

REQ:public.transactions:sandbox is approved. [MigrationApproval:REQ:public.transactions:sandbox]

## Drift

Differences between the live schema and the repository's own DDL.

_inv_report: table_repo_only. [MigrationDrift:_inv_report]

allocated_balances: table_repo_only. [MigrationDrift:allocated_balances]

blacklisted_funcs: table_repo_only. [MigrationDrift:blacklisted_funcs]

exchangerate: table_repo_only. [MigrationDrift:exchangerate]

invoice_before_cogs_allocation_fix: table_repo_only. [MigrationDrift:invoice_before_cogs_allocation_fix]

mc_migration_validation_data.payment_link_counts: table_repo_only. [MigrationDrift:mc_migration_validation_data.payment_link_counts]

mc_migration_validation_data.trial_balances: table_repo_only. [MigrationDrift:mc_migration_validation_data.trial_balances]

menu_attribute: table_repo_only. [MigrationDrift:menu_attribute]

need_payment: table_repo_only. [MigrationDrift:need_payment]

new_shipto: table_repo_only. [MigrationDrift:new_shipto]

note: table_repo_only. [MigrationDrift:note]

payment_links: table_repo_only. [MigrationDrift:payment_links]

payment_migration: table_repo_only. [MigrationDrift:payment_migration]

public.acc_trans.additional_data: column_live_only. [MigrationDrift:public.acc_trans.additional_data]

public.acc_trans.amount: column_repo_only. [MigrationDrift:public.acc_trans.amount]

public.acc_trans.amount_bc: column_live_only. [MigrationDrift:public.acc_trans.amount_bc]

public.acc_trans.amount_tc: column_live_only. [MigrationDrift:public.acc_trans.amount_tc]

public.acc_trans.cleared_on: column_repo_only. [MigrationDrift:public.acc_trans.cleared_on]

public.acc_trans.curr: column_live_only. [MigrationDrift:public.acc_trans.curr]

public.acc_trans.deprecated-voucher_id: column_live_only. [MigrationDrift:public.acc_trans.deprecated-voucher_id]

public.acc_trans.fx_transaction: column_repo_only. [MigrationDrift:public.acc_trans.fx_transaction]

public.acc_trans.open_item_id: column_live_only. [MigrationDrift:public.acc_trans.open_item_id]

public.acc_trans.reconciled_on: column_repo_only. [MigrationDrift:public.acc_trans.reconciled_on]

public.acc_trans.voucher_id: column_repo_only. [MigrationDrift:public.acc_trans.voucher_id]

public.account.custom_attributes: column_live_only. [MigrationDrift:public.account.custom_attributes]

public.account.heading_negative_balance: column_live_only. [MigrationDrift:public.account.heading_negative_balance]

public.account.open_item_managed: column_live_only. [MigrationDrift:public.account.open_item_managed]

public.account_checkpoint.amount: column_repo_only. [MigrationDrift:public.account_checkpoint.amount]

public.account_checkpoint.amount_bc: column_live_only. [MigrationDrift:public.account_checkpoint.amount_bc]

public.account_checkpoint.amount_tc: column_live_only. [MigrationDrift:public.account_checkpoint.amount_tc]

public.account_checkpoint.curr: column_live_only. [MigrationDrift:public.account_checkpoint.curr]

public.account_heading_translation.description: column_live_only. [MigrationDrift:public.account_heading_translation.description]

public.account_heading_translation.language_code: column_live_only. [MigrationDrift:public.account_heading_translation.language_code]

public.account_heading_translation.trans_id: column_live_only. [MigrationDrift:public.account_heading_translation.trans_id]

public.account_translation.description: column_live_only. [MigrationDrift:public.account_translation.description]

public.account_translation.language_code: column_live_only. [MigrationDrift:public.account_translation.language_code]

public.account_translation.trans_id: column_live_only. [MigrationDrift:public.account_translation.trans_id]

public.ap.amount: column_repo_only. [MigrationDrift:public.ap.amount]

public.ap.amount_bc: column_live_only. [MigrationDrift:public.ap.amount_bc]

public.ap.amount_tc: column_live_only. [MigrationDrift:public.ap.amount_tc]

public.ap.approved: column_repo_only. [MigrationDrift:public.ap.approved]

public.ap.datepaid: column_repo_only. [MigrationDrift:public.ap.datepaid]

public.ap.description: column_repo_only. [MigrationDrift:public.ap.description]

public.ap.entity_id: column_repo_only. [MigrationDrift:public.ap.entity_id]

public.ap.id: column_repo_only. [MigrationDrift:public.ap.id]

public.ap.intnotes: column_repo_only. [MigrationDrift:public.ap.intnotes]

public.ap.netamount: column_repo_only. [MigrationDrift:public.ap.netamount]

public.ap.netamount_bc: column_live_only. [MigrationDrift:public.ap.netamount_bc]

public.ap.netamount_tc: column_live_only. [MigrationDrift:public.ap.netamount_tc]

public.ap.open_item_id: column_live_only. [MigrationDrift:public.ap.open_item_id]

public.ap.paid: column_repo_only. [MigrationDrift:public.ap.paid]

public.ap.shipto: column_live_only. [MigrationDrift:public.ap.shipto]

public.ap.shipto_attn: column_live_only. [MigrationDrift:public.ap.shipto_attn]

public.ap.till: column_repo_only. [MigrationDrift:public.ap.till]

public.ap.trans_id: column_live_only. [MigrationDrift:public.ap.trans_id]

public.ap.transdate: column_repo_only. [MigrationDrift:public.ap.transdate]

public.ar.amount: column_repo_only. [MigrationDrift:public.ar.amount]

public.ar.amount_bc: column_live_only. [MigrationDrift:public.ar.amount_bc]

public.ar.amount_tc: column_live_only. [MigrationDrift:public.ar.amount_tc]

public.ar.approved: column_repo_only. [MigrationDrift:public.ar.approved]

public.ar.datepaid: column_repo_only. [MigrationDrift:public.ar.datepaid]

public.ar.description: column_repo_only. [MigrationDrift:public.ar.description]

public.ar.entity_id: column_repo_only. [MigrationDrift:public.ar.entity_id]

public.ar.id: column_repo_only. [MigrationDrift:public.ar.id]

public.ar.intnotes: column_repo_only. [MigrationDrift:public.ar.intnotes]

public.ar.netamount: column_repo_only. [MigrationDrift:public.ar.netamount]

public.ar.netamount_bc: column_live_only. [MigrationDrift:public.ar.netamount_bc]

public.ar.netamount_tc: column_live_only. [MigrationDrift:public.ar.netamount_tc]

public.ar.open_item_id: column_live_only. [MigrationDrift:public.ar.open_item_id]

public.ar.paid: column_repo_only. [MigrationDrift:public.ar.paid]

public.ar.shipto: column_live_only. [MigrationDrift:public.ar.shipto]

public.ar.shipto_attn: column_live_only. [MigrationDrift:public.ar.shipto_attn]

public.ar.till: column_repo_only. [MigrationDrift:public.ar.till]

public.ar.trans_id: column_live_only. [MigrationDrift:public.ar.trans_id]

public.ar.transdate: column_repo_only. [MigrationDrift:public.ar.transdate]

public.asset_item.custom_attributes: column_live_only. [MigrationDrift:public.asset_item.custom_attributes]

public.asset_note.created: column_live_only. [MigrationDrift:public.asset_note.created]

public.asset_note.created_by: column_live_only. [MigrationDrift:public.asset_note.created_by]

public.asset_note.id: column_live_only. [MigrationDrift:public.asset_note.id]

public.asset_note.note: column_live_only. [MigrationDrift:public.asset_note.note]

public.asset_note.note_class: column_live_only. [MigrationDrift:public.asset_note.note_class]

public.asset_note.ref_key: column_live_only. [MigrationDrift:public.asset_note.ref_key]

public.asset_note.subject: column_live_only. [MigrationDrift:public.asset_note.subject]

public.asset_note.vector: column_live_only. [MigrationDrift:public.asset_note.vector]

public.asset_report.gl_id: column_repo_only. [MigrationDrift:public.asset_report.gl_id]

public.asset_report.trans_id: column_live_only. [MigrationDrift:public.asset_report.trans_id]

public.audittrail.rolname: column_live_only. [MigrationDrift:public.audittrail.rolname]

public.budget_line.amount_tc: column_live_only. [MigrationDrift:public.budget_line.amount_tc]

public.budget_line.curr: column_live_only. [MigrationDrift:public.budget_line.curr]

public.budget_note.created: column_live_only. [MigrationDrift:public.budget_note.created]

public.budget_note.created_by: column_live_only. [MigrationDrift:public.budget_note.created_by]

public.budget_note.id: column_live_only. [MigrationDrift:public.budget_note.id]

public.budget_note.note: column_live_only. [MigrationDrift:public.budget_note.note]

public.budget_note.note_class: column_live_only. [MigrationDrift:public.budget_note.note_class]

public.budget_note.ref_key: column_live_only. [MigrationDrift:public.budget_note.ref_key]

public.budget_note.subject: column_live_only. [MigrationDrift:public.budget_note.subject]

public.budget_note.vector: column_live_only. [MigrationDrift:public.budget_note.vector]

public.business.last_updated: column_live_only. [MigrationDrift:public.business.last_updated]

public.business_unit_translation.description: column_live_only. [MigrationDrift:public.business_unit_translation.description]

public.business_unit_translation.language_code: column_live_only. [MigrationDrift:public.business_unit_translation.language_code]

public.business_unit_translation.trans_id: column_live_only. [MigrationDrift:public.business_unit_translation.trans_id]

public.country.last_updated: column_live_only. [MigrationDrift:public.country.last_updated]

public.cr_report.max_ac_id: column_repo_only. [MigrationDrift:public.cr_report.max_ac_id]

public.cr_report.workflow_id: column_live_only. [MigrationDrift:public.cr_report.workflow_id]

public.cr_report_line.errorcode: column_repo_only. [MigrationDrift:public.cr_report_line.errorcode]

public.cr_report_line.ledger_id: column_repo_only. [MigrationDrift:public.cr_report_line.ledger_id]

public.cr_report_line.overlook: column_repo_only. [MigrationDrift:public.cr_report_line.overlook]

public.cr_report_line.voucher_id: column_repo_only. [MigrationDrift:public.cr_report_line.voucher_id]

public.cr_report_line_links.cleared: column_live_only. [MigrationDrift:public.cr_report_line_links.cleared]

public.cr_report_line_links.unique_exempt: column_live_only. [MigrationDrift:public.cr_report_line_links.unique_exempt]

public.eca_note.created: column_live_only. [MigrationDrift:public.eca_note.created]

public.eca_note.created_by: column_live_only. [MigrationDrift:public.eca_note.created_by]

public.eca_note.id: column_live_only. [MigrationDrift:public.eca_note.id]

public.eca_note.note: column_live_only. [MigrationDrift:public.eca_note.note]

public.eca_note.note_class: column_live_only. [MigrationDrift:public.eca_note.note_class]

public.eca_note.ref_key: column_live_only. [MigrationDrift:public.eca_note.ref_key]

public.eca_note.subject: column_live_only. [MigrationDrift:public.eca_note.subject]

public.eca_note.vector: column_live_only. [MigrationDrift:public.eca_note.vector]

public.eca_to_location.active: column_live_only. [MigrationDrift:public.eca_to_location.active]

public.eca_to_location.created: column_live_only. [MigrationDrift:public.eca_to_location.created]

public.eca_to_location.inactive_date: column_live_only. [MigrationDrift:public.eca_to_location.inactive_date]

public.email.expansions: column_live_only. [MigrationDrift:public.email.expansions]

public.entity.custom_attributes: column_live_only. [MigrationDrift:public.entity.custom_attributes]

public.entity.entity_class: column_repo_only. [MigrationDrift:public.entity.entity_class]

public.entity_note.created: column_live_only. [MigrationDrift:public.entity_note.created]

public.entity_note.created_by: column_live_only. [MigrationDrift:public.entity_note.created_by]

public.entity_note.id: column_live_only. [MigrationDrift:public.entity_note.id]

public.entity_note.note: column_live_only. [MigrationDrift:public.entity_note.note]

public.entity_note.note_class: column_live_only. [MigrationDrift:public.entity_note.note_class]

public.entity_note.ref_key: column_live_only. [MigrationDrift:public.entity_note.ref_key]

public.entity_note.subject: column_live_only. [MigrationDrift:public.entity_note.subject]

public.entity_note.vector: column_live_only. [MigrationDrift:public.entity_note.vector]

public.entity_to_location.active: column_live_only. [MigrationDrift:public.entity_to_location.active]

public.entity_to_location.created: column_live_only. [MigrationDrift:public.entity_to_location.created]

public.entity_to_location.inactive_date: column_live_only. [MigrationDrift:public.entity_to_location.inactive_date]

public.file_eca.content: column_live_only. [MigrationDrift:public.file_eca.content]

public.file_eca.description: column_live_only. [MigrationDrift:public.file_eca.description]

public.file_eca.file_class: column_live_only. [MigrationDrift:public.file_eca.file_class]

public.file_eca.file_name: column_live_only. [MigrationDrift:public.file_eca.file_name]

public.file_eca.id: column_live_only. [MigrationDrift:public.file_eca.id]

public.file_eca.mime_type_id: column_live_only. [MigrationDrift:public.file_eca.mime_type_id]

public.file_eca.ref_key: column_live_only. [MigrationDrift:public.file_eca.ref_key]

public.file_eca.uploaded_at: column_live_only. [MigrationDrift:public.file_eca.uploaded_at]

public.file_eca.uploaded_by: column_live_only. [MigrationDrift:public.file_eca.uploaded_by]

public.file_email.content: column_live_only. [MigrationDrift:public.file_email.content]

public.file_email.description: column_live_only. [MigrationDrift:public.file_email.description]

public.file_email.file_class: column_live_only. [MigrationDrift:public.file_email.file_class]

public.file_email.file_name: column_live_only. [MigrationDrift:public.file_email.file_name]

public.file_email.id: column_live_only. [MigrationDrift:public.file_email.id]

public.file_email.mime_type_id: column_live_only. [MigrationDrift:public.file_email.mime_type_id]

public.file_email.ref_key: column_live_only. [MigrationDrift:public.file_email.ref_key]

public.file_email.uploaded_at: column_live_only. [MigrationDrift:public.file_email.uploaded_at]

public.file_email.uploaded_by: column_live_only. [MigrationDrift:public.file_email.uploaded_by]

public.file_entity.content: column_live_only. [MigrationDrift:public.file_entity.content]

public.file_entity.description: column_live_only. [MigrationDrift:public.file_entity.description]

public.file_entity.file_class: column_live_only. [MigrationDrift:public.file_entity.file_class]

public.file_entity.file_name: column_live_only. [MigrationDrift:public.file_entity.file_name]

public.file_entity.id: column_live_only. [MigrationDrift:public.file_entity.id]

public.file_entity.mime_type_id: column_live_only. [MigrationDrift:public.file_entity.mime_type_id]

public.file_entity.ref_key: column_live_only. [MigrationDrift:public.file_entity.ref_key]

public.file_entity.uploaded_at: column_live_only. [MigrationDrift:public.file_entity.uploaded_at]

public.file_entity.uploaded_by: column_live_only. [MigrationDrift:public.file_entity.uploaded_by]

public.file_incoming.content: column_live_only. [MigrationDrift:public.file_incoming.content]

public.file_incoming.description: column_live_only. [MigrationDrift:public.file_incoming.description]

public.file_incoming.file_class: column_live_only. [MigrationDrift:public.file_incoming.file_class]

public.file_incoming.file_name: column_live_only. [MigrationDrift:public.file_incoming.file_name]

public.file_incoming.id: column_live_only. [MigrationDrift:public.file_incoming.id]

public.file_incoming.mime_type_id: column_live_only. [MigrationDrift:public.file_incoming.mime_type_id]

public.file_incoming.ref_key: column_live_only. [MigrationDrift:public.file_incoming.ref_key]

public.file_incoming.uploaded_at: column_live_only. [MigrationDrift:public.file_incoming.uploaded_at]

public.file_incoming.uploaded_by: column_live_only. [MigrationDrift:public.file_incoming.uploaded_by]

public.file_internal.content: column_live_only. [MigrationDrift:public.file_internal.content]

public.file_internal.description: column_live_only. [MigrationDrift:public.file_internal.description]

public.file_internal.file_class: column_live_only. [MigrationDrift:public.file_internal.file_class]

public.file_internal.file_name: column_live_only. [MigrationDrift:public.file_internal.file_name]

public.file_internal.id: column_live_only. [MigrationDrift:public.file_internal.id]

public.file_internal.mime_type_id: column_live_only. [MigrationDrift:public.file_internal.mime_type_id]

public.file_internal.ref_key: column_live_only. [MigrationDrift:public.file_internal.ref_key]

public.file_internal.uploaded_at: column_live_only. [MigrationDrift:public.file_internal.uploaded_at]

public.file_internal.uploaded_by: column_live_only. [MigrationDrift:public.file_internal.uploaded_by]

public.file_order.content: column_live_only. [MigrationDrift:public.file_order.content]

public.file_order.description: column_live_only. [MigrationDrift:public.file_order.description]

public.file_order.file_class: column_live_only. [MigrationDrift:public.file_order.file_class]

public.file_order.file_name: column_live_only. [MigrationDrift:public.file_order.file_name]

public.file_order.id: column_live_only. [MigrationDrift:public.file_order.id]

public.file_order.mime_type_id: column_live_only. [MigrationDrift:public.file_order.mime_type_id]

public.file_order.ref_key: column_live_only. [MigrationDrift:public.file_order.ref_key]

public.file_order.uploaded_at: column_live_only. [MigrationDrift:public.file_order.uploaded_at]

public.file_order.uploaded_by: column_live_only. [MigrationDrift:public.file_order.uploaded_by]

public.file_order_to_order.attached_at: column_live_only. [MigrationDrift:public.file_order_to_order.attached_at]

public.file_order_to_order.attached_by: column_live_only. [MigrationDrift:public.file_order_to_order.attached_by]

public.file_order_to_order.dest_class: column_live_only. [MigrationDrift:public.file_order_to_order.dest_class]

public.file_order_to_order.file_id: column_live_only. [MigrationDrift:public.file_order_to_order.file_id]

public.file_order_to_order.ref_key: column_live_only. [MigrationDrift:public.file_order_to_order.ref_key]

public.file_order_to_order.source_class: column_live_only. [MigrationDrift:public.file_order_to_order.source_class]

public.file_order_to_tx.attached_at: column_live_only. [MigrationDrift:public.file_order_to_tx.attached_at]

public.file_order_to_tx.attached_by: column_live_only. [MigrationDrift:public.file_order_to_tx.attached_by]

public.file_order_to_tx.dest_class: column_live_only. [MigrationDrift:public.file_order_to_tx.dest_class]

public.file_order_to_tx.file_id: column_live_only. [MigrationDrift:public.file_order_to_tx.file_id]

public.file_order_to_tx.ref_key: column_live_only. [MigrationDrift:public.file_order_to_tx.ref_key]

public.file_order_to_tx.source_class: column_live_only. [MigrationDrift:public.file_order_to_tx.source_class]

public.file_part.content: column_live_only. [MigrationDrift:public.file_part.content]

public.file_part.description: column_live_only. [MigrationDrift:public.file_part.description]

public.file_part.file_class: column_live_only. [MigrationDrift:public.file_part.file_class]

public.file_part.file_name: column_live_only. [MigrationDrift:public.file_part.file_name]

public.file_part.id: column_live_only. [MigrationDrift:public.file_part.id]

public.file_part.mime_type_id: column_live_only. [MigrationDrift:public.file_part.mime_type_id]

public.file_part.ref_key: column_live_only. [MigrationDrift:public.file_part.ref_key]

public.file_part.uploaded_at: column_live_only. [MigrationDrift:public.file_part.uploaded_at]

public.file_part.uploaded_by: column_live_only. [MigrationDrift:public.file_part.uploaded_by]

public.file_reconciliation.content: column_live_only. [MigrationDrift:public.file_reconciliation.content]

public.file_reconciliation.description: column_live_only. [MigrationDrift:public.file_reconciliation.description]

public.file_reconciliation.file_class: column_live_only. [MigrationDrift:public.file_reconciliation.file_class]

public.file_reconciliation.file_name: column_live_only. [MigrationDrift:public.file_reconciliation.file_name]

public.file_reconciliation.id: column_live_only. [MigrationDrift:public.file_reconciliation.id]

public.file_reconciliation.mime_type_id: column_live_only. [MigrationDrift:public.file_reconciliation.mime_type_id]

public.file_reconciliation.ref_key: column_live_only. [MigrationDrift:public.file_reconciliation.ref_key]

public.file_reconciliation.uploaded_at: column_live_only. [MigrationDrift:public.file_reconciliation.uploaded_at]

public.file_reconciliation.uploaded_by: column_live_only. [MigrationDrift:public.file_reconciliation.uploaded_by]

public.file_transaction.content: column_live_only. [MigrationDrift:public.file_transaction.content]

public.file_transaction.description: column_live_only. [MigrationDrift:public.file_transaction.description]

public.file_transaction.file_class: column_live_only. [MigrationDrift:public.file_transaction.file_class]

public.file_transaction.file_name: column_live_only. [MigrationDrift:public.file_transaction.file_name]

public.file_transaction.id: column_live_only. [MigrationDrift:public.file_transaction.id]

public.file_transaction.mime_type_id: column_live_only. [MigrationDrift:public.file_transaction.mime_type_id]

public.file_transaction.ref_key: column_live_only. [MigrationDrift:public.file_transaction.ref_key]

public.file_transaction.uploaded_at: column_live_only. [MigrationDrift:public.file_transaction.uploaded_at]

public.file_transaction.uploaded_by: column_live_only. [MigrationDrift:public.file_transaction.uploaded_by]

public.file_tx_to_order.attached_at: column_live_only. [MigrationDrift:public.file_tx_to_order.attached_at]

public.file_tx_to_order.attached_by: column_live_only. [MigrationDrift:public.file_tx_to_order.attached_by]

public.file_tx_to_order.dest_class: column_live_only. [MigrationDrift:public.file_tx_to_order.dest_class]

public.file_tx_to_order.file_id: column_live_only. [MigrationDrift:public.file_tx_to_order.file_id]

public.file_tx_to_order.ref_key: column_live_only. [MigrationDrift:public.file_tx_to_order.ref_key]

public.file_tx_to_order.source_class: column_live_only. [MigrationDrift:public.file_tx_to_order.source_class]

public.gifi.last_updated: column_live_only. [MigrationDrift:public.gifi.last_updated]

public.gl.approved: column_repo_only. [MigrationDrift:public.gl.approved]

public.gl.description: column_repo_only. [MigrationDrift:public.gl.description]

public.gl.notes: column_repo_only. [MigrationDrift:public.gl.notes]

public.gl.person_id: column_repo_only. [MigrationDrift:public.gl.person_id]

public.gl.reference: column_repo_only. [MigrationDrift:public.gl.reference]

public.gl.transdate: column_repo_only. [MigrationDrift:public.gl.transdate]

public.inventory_report.ap_trans_id: column_repo_only. [MigrationDrift:public.inventory_report.ap_trans_id]

public.inventory_report.ar_trans_id: column_repo_only. [MigrationDrift:public.inventory_report.ar_trans_id]

public.inventory_report.report_date: column_live_only. [MigrationDrift:public.inventory_report.report_date]

public.inventory_report.trans_id: column_live_only. [MigrationDrift:public.inventory_report.trans_id]

public.inventory_report.transdate: column_repo_only. [MigrationDrift:public.inventory_report.transdate]

public.invoice_note.created: column_live_only. [MigrationDrift:public.invoice_note.created]

public.invoice_note.created_by: column_live_only. [MigrationDrift:public.invoice_note.created_by]

public.invoice_note.id: column_live_only. [MigrationDrift:public.invoice_note.id]

public.invoice_note.note: column_live_only. [MigrationDrift:public.invoice_note.note]

public.invoice_note.note_class: column_live_only. [MigrationDrift:public.invoice_note.note_class]

public.invoice_note.ref_key: column_live_only. [MigrationDrift:public.invoice_note.ref_key]

public.invoice_note.subject: column_live_only. [MigrationDrift:public.invoice_note.subject]

public.invoice_note.vector: column_live_only. [MigrationDrift:public.invoice_note.vector]

public.journal_line.amount_tc: column_live_only. [MigrationDrift:public.journal_line.amount_tc]

public.journal_line.curr: column_live_only. [MigrationDrift:public.journal_line.curr]

public.journal_note.created: column_live_only. [MigrationDrift:public.journal_note.created]

public.journal_note.created_by: column_live_only. [MigrationDrift:public.journal_note.created_by]

public.journal_note.id: column_live_only. [MigrationDrift:public.journal_note.id]

public.journal_note.note: column_live_only. [MigrationDrift:public.journal_note.note]

public.journal_note.note_class: column_live_only. [MigrationDrift:public.journal_note.note_class]

public.journal_note.ref_key: column_live_only. [MigrationDrift:public.journal_note.ref_key]

public.journal_note.subject: column_live_only. [MigrationDrift:public.journal_note.subject]

public.journal_note.vector: column_live_only. [MigrationDrift:public.journal_note.vector]

public.language.last_updated: column_live_only. [MigrationDrift:public.language.last_updated]

public.location.active: column_repo_only. [MigrationDrift:public.location.active]

public.location.created: column_repo_only. [MigrationDrift:public.location.created]

public.location.inactive_date: column_repo_only. [MigrationDrift:public.location.inactive_date]

public.menu_node.menu: column_live_only. [MigrationDrift:public.menu_node.menu]

public.menu_node.standalone: column_live_only. [MigrationDrift:public.menu_node.standalone]

public.menu_node.url: column_live_only. [MigrationDrift:public.menu_node.url]

public.mfg_lot.trans_id: column_live_only. [MigrationDrift:public.mfg_lot.trans_id]

public.oe.amount: column_repo_only. [MigrationDrift:public.oe.amount]

public.oe.amount_tc: column_live_only. [MigrationDrift:public.oe.amount_tc]

public.oe.netamount: column_repo_only. [MigrationDrift:public.oe.netamount]

public.oe.netamount_tc: column_live_only. [MigrationDrift:public.oe.netamount_tc]

public.oe.shipto: column_live_only. [MigrationDrift:public.oe.shipto]

public.oe.shipto_attn: column_live_only. [MigrationDrift:public.oe.shipto_attn]

public.oe.workflow_id: column_live_only. [MigrationDrift:public.oe.workflow_id]

public.open_forms.form_name: column_live_only. [MigrationDrift:public.open_forms.form_name]

public.open_forms.last_used: column_live_only. [MigrationDrift:public.open_forms.last_used]

public.overpayment: table_live_only. [MigrationDrift:public.overpayment]

public.parts.custom_attributes: column_live_only. [MigrationDrift:public.parts.custom_attributes]

public.parts_translation.description: column_live_only. [MigrationDrift:public.parts_translation.description]

public.parts_translation.language_code: column_live_only. [MigrationDrift:public.parts_translation.language_code]

public.parts_translation.trans_id: column_live_only. [MigrationDrift:public.parts_translation.trans_id]

public.partscustomer.qty: column_live_only. [MigrationDrift:public.partscustomer.qty]

public.partsgroup.last_updated: column_live_only. [MigrationDrift:public.partsgroup.last_updated]

public.partsgroup_translation.description: column_live_only. [MigrationDrift:public.partsgroup_translation.description]

public.partsgroup_translation.language_code: column_live_only. [MigrationDrift:public.partsgroup_translation.language_code]

public.partsgroup_translation.trans_id: column_live_only. [MigrationDrift:public.partsgroup_translation.trans_id]

public.payment.account_id: column_live_only. [MigrationDrift:public.payment.account_id]

public.payment.gl_id: column_repo_only. [MigrationDrift:public.payment.gl_id]

public.payment.trans_id: column_live_only. [MigrationDrift:public.payment.trans_id]

public.pricegroup.last_updated: column_live_only. [MigrationDrift:public.pricegroup.last_updated]

public.sic.custom_attributes: column_live_only. [MigrationDrift:public.sic.custom_attributes]

public.sic.last_updated: column_live_only. [MigrationDrift:public.sic.last_updated]

public.template.last_modified: column_live_only. [MigrationDrift:public.template.last_modified]

public.trans_type.details_table: column_live_only. [MigrationDrift:public.trans_type.details_table]

public.transactions.batch_id: column_live_only. [MigrationDrift:public.transactions.batch_id]

public.transactions.description: column_live_only. [MigrationDrift:public.transactions.description]

public.transactions.entered_by: column_live_only. [MigrationDrift:public.transactions.entered_by]

public.transactions.notes: column_live_only. [MigrationDrift:public.transactions.notes]

public.transactions.reference: column_live_only. [MigrationDrift:public.transactions.reference]

public.transactions.reversing: column_live_only. [MigrationDrift:public.transactions.reversing]

public.transactions.table_name: column_repo_only. [MigrationDrift:public.transactions.table_name]

public.transactions.trans_type_code: column_live_only. [MigrationDrift:public.transactions.trans_type_code]

public.transactions.transdate: column_live_only. [MigrationDrift:public.transactions.transdate]

public.transactions.workflow_id: column_live_only. [MigrationDrift:public.transactions.workflow_id]

public.warehouse.last_updated: column_live_only. [MigrationDrift:public.warehouse.last_updated]

public.workflow_history.workflow_entity_id: column_live_only. [MigrationDrift:public.workflow_history.workflow_entity_id]

status: table_repo_only. [MigrationDrift:status]

test_result: table_repo_only. [MigrationDrift:test_result]

trans_arap_acc: table_repo_only. [MigrationDrift:trans_arap_acc]

translation: table_repo_only. [MigrationDrift:translation]

voucher: table_repo_only. [MigrationDrift:voucher]

