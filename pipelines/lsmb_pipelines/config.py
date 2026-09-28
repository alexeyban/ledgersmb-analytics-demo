"""Connection settings for the demo's PostgreSQL source and ClickHouse target.

Passwords are read from the environment (``LSMB_PG_PASSWORD`` / ``LSMB_CH_PASSWORD``) and default to
the sandbox values from EKOS's ``docker-compose.migrate.yml``, which are local-only by design.
"""

from __future__ import annotations

import os
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
LOGS = ROOT / "logs"


@dataclass(frozen=True)
class Settings:
    pg_dsn: str
    ch_host: str
    ch_port: int
    ch_user: str
    ch_password: str
    raw_db: str = "lsmb_raw"
    analytics_db: str = "lsmb_analytics"


def settings() -> Settings:
    pg_pw = os.environ.get("LSMB_PG_PASSWORD", "ekos-local-only")
    return Settings(
        pg_dsn=f"host=127.0.0.1 port=55432 user=ekos password={pg_pw} dbname=ledgersmb",
        ch_host="127.0.0.1",
        ch_port=58123,
        ch_user="ekos",
        ch_password=os.environ.get("LSMB_CH_PASSWORD", "ekos-local-only"),
    )


def clickhouse():
    """A clickhouse-connect client for the sandbox."""
    import clickhouse_connect

    s = settings()
    return clickhouse_connect.get_client(
        host=s.ch_host, port=s.ch_port, username=s.ch_user, password=s.ch_password
    )
