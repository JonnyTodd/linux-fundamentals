#!/bin/bash
BASE="${LAB3_HOME:-$HOME/linux-lab3}/company"
PAYROLL="$BASE/data/payroll.csv"
NETWORK="$BASE/reports/network-summary.txt"
SERVICE="$BASE/reports/service-status.txt"
STORAGE="$BASE/reports/storage-usage.txt"

test "$(stat -c '%a' "$PAYROLL")" = "640" || exit 1
test "$(stat -c '%U:%G' "$PAYROLL")" = "root:staff" || exit 1

if pgrep -x report-worker >/dev/null 2>&1; then
  exit 1
fi

test -f "$STORAGE" || exit 1
test -f "$NETWORK" || exit 1
grep -Eq '127\.0\.0\.1/8' "$NETWORK" || exit 1
test -f "$SERVICE" || exit 1
test "$(tr -d '\r\n' < "$SERVICE")" = "NORTHSTAR-SERVICE: ONLINE" || exit 1

exit 0
