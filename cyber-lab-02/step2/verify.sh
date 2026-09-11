#!/bin/bash
set -e
LAB="$HOME/cyber-lab2/northstar-incident"

test "$(grep -c 'Failed password' "$LAB/evidence/failed-logins.txt")" = "5"
grep -Eq '^5[[:space:]]*$' "$LAB/evidence/failed-count.txt"
grep -Fq 'Accepted password for r.singh from 198.51.100.24' "$LAB/evidence/accepted-logins.txt"
