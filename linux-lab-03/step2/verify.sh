#!/bin/bash
BASE="${LAB3_HOME:-$HOME/linux-lab3}/company"
REPORT="$BASE/reports/permission-audit.txt"

test -f "$REPORT" &&
test "$(tr -d '\r\n' < "$REPORT")" = "666 root root"

