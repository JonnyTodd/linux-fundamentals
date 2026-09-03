#!/bin/bash
BASE="$HOME/linux-lab2/company"

test -f "$BASE/reports/staff-preview.txt" &&
test -f "$BASE/reports/recent-access.txt" &&
cmp -s <(head -n 4 "$BASE/records/staff.csv") "$BASE/reports/staff-preview.txt" &&
cmp -s <(tail -n 3 "$BASE/logs/access.log") "$BASE/reports/recent-access.txt"

