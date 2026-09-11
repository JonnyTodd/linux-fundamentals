#!/bin/bash
set -e

BASE="${LAB5_HOME:-$HOME/linux-lab5}/northstar-admin"
LOG="$BASE/logs/web-access.log"
NOT_FOUND="$BASE/reports/not-found.txt"
REPEATED="$BASE/reports/repeated-source.txt"
TMP1=$(mktemp)
TMP2=$(mktemp)
trap 'rm -f "$TMP1" "$TMP2"' EXIT

grep ' 404 ' "$LOG" > "$TMP1"
grep -c ' 404 ' "$LOG" >> "$TMP1"
grep '203.0.113.90' "$LOG" > "$TMP2"
grep -c '203.0.113.90' "$LOG" >> "$TMP2"

cmp -s "$TMP1" "$NOT_FOUND"
cmp -s "$TMP2" "$REPEATED"
test "$(tail -n 1 "$NOT_FOUND")" = '4'
test "$(tail -n 1 "$REPEATED")" = '3'

echo "Log reports verified: four 404 responses, three from 203.0.113.90."
