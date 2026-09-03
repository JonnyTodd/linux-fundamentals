#!/bin/bash
BASE="$HOME/linux-lab2/company"
SUMMARY="$BASE/reports/incident-summary.txt"
SUSPECT="$BASE/reports/suspicious-ip.txt"

test -f "$SUMMARY" &&
test -f "$SUSPECT" &&
cmp -s <({ grep "FAILED" "$BASE/logs/security.log"; grep -c "FAILED" "$BASE/logs/security.log"; }) "$SUMMARY" &&
cmp -s <(grep "203.0.113.45" "$BASE/logs/security.log") "$SUSPECT"

