#!/bin/bash
BASE="$HOME/linux-lab2/company/reports"

test -f "$BASE/staff-count.txt" &&
test -f "$BASE/access-count.txt" &&
grep -Eq '^13[[:space:]]+records/staff\.csv$' "$BASE/staff-count.txt" &&
grep -Eq '^12[[:space:]]+logs/access\.log$' "$BASE/access-count.txt"

