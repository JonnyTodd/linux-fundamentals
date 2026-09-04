#!/bin/bash
set -e

LAB="${LAB4_HOME:-$HOME/linux-lab4}"
BASE="$LAB/company"
cd "$BASE"

[ ! -e archive/tmp-cache.img ]
[ -f archive/monthly-backup.img ]
[ -f evidence/storage-after.txt ]
cmp -s evidence/storage-after.txt <(du -sh archive)
