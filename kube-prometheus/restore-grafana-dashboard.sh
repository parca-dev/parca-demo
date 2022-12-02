#!/usr/bin/env bash
set -euo pipefail

curl -X POST --insecure -H "Content-Type: application/json" -d @grafana-dashboard-api-export.json http://admin:admin@localhost:3000/api/dashboards/import
