#!/bin/bash
set -e

LAB="${LAB4_HOME:-$HOME/linux-lab4}"
BASE="$LAB/company"

expected=$(printf '%s\n' \
  'CONFIDENTIAL-NORTHSTAR-2026' \
  'Quarterly resilience plan' \
  'Owner: Operations' \
  'Status: Approved')

[ -f "$BASE/secure/quarterly-plan.txt" ]
[ ! -e "$BASE/documents/old/quarterly-plan.txt" ]
[ "$(cat "$BASE/secure/quarterly-plan.txt")" = "$expected" ]
