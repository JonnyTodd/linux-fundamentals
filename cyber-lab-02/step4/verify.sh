#!/bin/bash
set -e
LAB="$HOME/cyber-lab2/northstar-incident"
FILE="$LAB/evidence/combined-timeline.txt"

test -f "$FILE"
test "$(wc -l < "$FILE")" = "7"
cmp -s <(cat "$LAB"/timeline/*.log | sort) "$FILE"
