#!/bin/bash
FILE="${LAB3_HOME:-$HOME/linux-lab3}/company/data/payroll.csv"

test -f "$FILE" &&
test "$(stat -c '%a' "$FILE")" = "640" &&
test "$(stat -c '%U:%G' "$FILE")" = "root:staff"
