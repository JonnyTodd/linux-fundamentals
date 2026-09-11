#!/bin/bash
set -e

BASE="${LAB5_HOME:-$HOME/linux-lab5}/northstar-admin"
FILE="$BASE/evidence/firewall-rules.txt"
UFW_DEFAULTS="${UFW_DEFAULTS:-/etc/default/ufw}"
CURRENT=$(mktemp)
RULES=$(mktemp)
trap 'rm -f "$CURRENT" "$RULES"' EXIT

ufw status | grep -q 'Status: inactive'
grep -q '^DEFAULT_INPUT_POLICY="DROP"' "$UFW_DEFAULTS"
grep -q '^DEFAULT_OUTPUT_POLICY="ACCEPT"' "$UFW_DEFAULTS"
ufw show added | grep '^ufw ' > "$RULES"

grep -Fxq 'ufw allow 8080/tcp' "$RULES"
grep -Fxq 'ufw deny 23/tcp' "$RULES"

grep -E '^DEFAULT_(INPUT|OUTPUT)_POLICY' "$UFW_DEFAULTS" > "$CURRENT"
cat "$RULES" >> "$CURRENT"
cmp -s "$CURRENT" "$FILE"

echo "Firewall policies and rules verified; UFW remains safely inactive."
