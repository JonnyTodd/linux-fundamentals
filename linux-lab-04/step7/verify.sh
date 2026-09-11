#!/bin/bash
set -e

LAB="${LAB4_HOME:-$HOME/linux-lab4}"
BASE="$LAB/company"
EXPECTED_GROUP="${LAB4_EXPECTED_GROUP:-staff}"
cd "$BASE"

expected_plan=$(printf '%s\n' \
  'CONFIDENTIAL-NORTHSTAR-2026' \
  'Quarterly resilience plan' \
  'Owner: Operations' \
  'Status: Approved')
[ "$(cat secure/quarterly-plan.txt)" = "$expected_plan" ]
[ ! -e documents/old/quarterly-plan.txt ]

cmp -s evidence/failed-logins.txt <(
  grep 'FAILED' logs/security.log
  grep -c 'FAILED' logs/security.log
)
cmp -s evidence/suspicious-ip.txt <(
  grep 'FAILED.*203\.0\.113\.77' logs/security.log
)

[ "$(stat -c '%a %U %G' data/payroll.csv)" = "640 root $EXPECTED_GROUP" ]
! pgrep -x backup-loop >/dev/null

[ ! -e archive/tmp-cache.img ]
[ -f archive/monthly-backup.img ]
cmp -s evidence/storage-after.txt <(du -sh archive)

grep -Eq '(^|[[:space:]])127\.0\.0\.1/8([[:space:]]|$)' evidence/network-summary.txt
[ "$(cat evidence/service-status.txt)" = "NORTHSTAR-RECOVERY: READY" ]
