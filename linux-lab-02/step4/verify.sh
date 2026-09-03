#!/bin/bash
BASE="$HOME/linux-lab2/company"

test -f "$BASE/reports/errors.txt" &&
test -f "$BASE/reports/error-count.txt" &&
cmp -s <(grep "ERROR" "$BASE/logs/application.log") "$BASE/reports/errors.txt" &&
test "$(tr -d '[:space:]' < "$BASE/reports/error-count.txt")" = "3"

