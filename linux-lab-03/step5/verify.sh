#!/bin/bash
BASE="${LAB3_HOME:-$HOME/linux-lab3}/company"
REPORT="$BASE/reports/storage-usage.txt"

test -f "$REPORT" &&
cmp -s <(cd "$BASE" && du -sh archive data logs) "$REPORT" &&
test "$(du -s "$BASE/archive" | awk '{print $1}')" -gt "$(du -s "$BASE/data" | awk '{print $1}')"

