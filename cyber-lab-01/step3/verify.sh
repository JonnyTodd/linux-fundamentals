#!/bin/bash
set -e
LAB="$HOME/cyber-lab1/northstar"

test "$(stat -c '%a' "$LAB/finance/payroll.csv")" = "666"
grep -Fq '666 finance/payroll.csv' "$LAB/evidence/payroll-mode.txt"
grep -Fqx 'r.singh,active,2026-06-30' "$LAB/evidence/leaver-account.txt"
