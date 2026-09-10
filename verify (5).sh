#!/bin/bash
set -e
LAB="$HOME/cyber-lab1/northstar"

grep -Fq 'backups/monthly-backup.tar.gz: FAILED' "$LAB/evidence/backup-check.txt"
test "$(grep -c ' ERROR ' "$LAB/evidence/portal-errors.txt")" = "4"
grep -Eq '^4[[:space:]]*$' "$LAB/evidence/portal-error-count.txt"
