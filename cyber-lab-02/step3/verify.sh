#!/bin/bash
set -e
FILE="$HOME/cyber-lab2/northstar-incident/evidence/suspicious-processes.txt"

test -f "$FILE"
grep -Fq 'payroll_update.sh' "$FILE"
grep -Fq 'curl -fsS' "$FILE"
grep -Fq '/tmp/update-check.sh' "$FILE"
