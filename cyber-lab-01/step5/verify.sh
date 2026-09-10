#!/bin/bash
set -e
FILE="$HOME/cyber-lab1/northstar/evidence/risk-register.csv"

test "$(wc -l < "$FILE")" = "7"
grep -Fqx 'A,customer export in public directory,confidentiality,3,3,9,EXTREME' "$FILE"
grep -Fqx 'B,plaintext admin password,CIA,3,3,9,EXTREME' "$FILE"
grep -Fqx 'C,payroll permissions 666,confidentiality and integrity,2,3,6,HIGH' "$FILE"
grep -Fqx 'D,former worker account active,CIA,2,3,6,HIGH' "$FILE"
grep -Fqx 'E,backup checksum failed,integrity and availability,2,2,4,MEDIUM' "$FILE"
grep -Fqx 'F,four portal errors,availability,2,2,4,MEDIUM' "$FILE"
