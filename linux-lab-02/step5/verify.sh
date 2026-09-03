#!/bin/bash
REPORT="$HOME/linux-lab2/company/reports/errors.txt"

test -f "$REPORT" &&
test "$(wc -l < "$REPORT")" -eq 5 &&
test "$(grep -c "ERROR" "$REPORT")" -eq 3 &&
test "$(grep -c "WARNING" "$REPORT")" -eq 2

