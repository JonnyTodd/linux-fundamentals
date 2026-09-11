#!/bin/bash
set -e
FILE="$HOME/cyber-lab2/northstar-incident/evidence/message-indicators.txt"

test -f "$FILE"
grep -Fiq 'urgent' "$FILE"
grep -Fiq 'password' "$FILE"
grep -Fiq 'http' "$FILE"
grep -Fiq 'attachment' "$FILE"
