#!/bin/bash
set -e

LAB="${LAB4_HOME:-$HOME/linux-lab4}"
FILE="$LAB/company/data/payroll.csv"
EXPECTED_GROUP="${LAB4_EXPECTED_GROUP:-staff}"

[ "$(stat -c '%a' "$FILE")" = "640" ]
[ "$(stat -c '%U' "$FILE")" = "root" ]
[ "$(stat -c '%G' "$FILE")" = "$EXPECTED_GROUP" ]
