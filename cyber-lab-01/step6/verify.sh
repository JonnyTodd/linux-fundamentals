#!/bin/bash
set -e
LAB="$HOME/cyber-lab1/northstar"
REPORT="$LAB/evidence/top-priorities.txt"

test -f "$REPORT"
grep -Fqx 'NORTHSTAR FIRST-ACTION RECOMMENDATION' "$REPORT"
grep -Fqx 'A | Move the customer export to restricted storage and review access.' "$REPORT"
grep -Fqx 'B | Remove the plaintext password, rotate it and use managed secret storage.' "$REPORT"

test "$(stat -c '%a' "$LAB/finance/payroll.csv")" = "666"
test -f "$LAB/public/customer-export.csv"
grep -Fq 'admin_password=Northstar-Training-Only-2026!' "$LAB/configuration/web.conf"
test "$(wc -l < "$LAB/evidence/risk-register.csv")" = "7"
