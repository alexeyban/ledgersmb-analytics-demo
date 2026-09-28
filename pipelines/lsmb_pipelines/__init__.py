"""Python pipelines for the LedgerSMB → ClickHouse analytics demo.

Modules:

* :mod:`lsmb_pipelines.config` — connection settings, read from the environment.
* :mod:`lsmb_pipelines.load_tax` — the one table EKOS Migrate could not load as-is (``tax.validto``
  holds PostgreSQL ``infinity``); loads it applying a recorded human decision.
* :mod:`lsmb_pipelines.reconcile` — independent checks of the ClickHouse marts against LedgerSMB's
  own reporting functions in PostgreSQL.
* :mod:`lsmb_pipelines.kpi_report` — renders the headline KPIs from the marts as Markdown for the
  Confluence pages.
* :mod:`lsmb_pipelines.run` — the orchestrator: every step, in order, timed and logged.
"""
