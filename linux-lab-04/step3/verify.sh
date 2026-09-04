#!/bin/bash
set -e

LAB="${LAB4_HOME:-$HOME/linux-lab4}"
BASE="$LAB/company"
cd "$BASE"

test -f evidence/failed-logins.txt
test -f evidence/suspicious-ip.txt

cmp -s evidence/failed-logins.txt <(
  grep 'FAILED' logs/security.log
  grep -c 'FAILED' logs/security.log
)

cmp -s evidence/suspicious-ip.txt <(
  grep 'FAILED.*203\.0\.113\.77' logs/security.log
)
