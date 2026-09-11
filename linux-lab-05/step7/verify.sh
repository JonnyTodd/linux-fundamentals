#!/bin/bash
set -e

BASE="${LAB5_HOME:-$HOME/linux-lab5}/northstar-admin"
AUDIT="$BASE/reports/final-audit.txt"
UFW_DEFAULTS="${UFW_DEFAULTS:-/etc/default/ufw}"
EXPECTED=$(mktemp)
trap 'rm -f "$EXPECTED"' EXIT

dpkg-query -W -f='${Status}' tree 2>/dev/null | grep -qx 'install ok installed'
pgrep -af 'http.server 8080' >/dev/null
ss -ltnp | grep -q ':8080'
test "$(curl -fsS http://127.0.0.1:8080/status.txt)" = 'NORTHSTAR-ADMIN: READY'
ufw status | grep -q 'Status: inactive'

grep -q '^DEFAULT_INPUT_POLICY="DROP"' "$UFW_DEFAULTS"
grep -q '^DEFAULT_OUTPUT_POLICY="ACCEPT"' "$UFW_DEFAULTS"
ufw show added | grep -Fxq 'ufw allow 8080/tcp'
ufw show added | grep -Fxq 'ufw deny 23/tcp'

test "$(tail -n 1 "$BASE/reports/not-found.txt")" = '4'
test "$(tail -n 1 "$BASE/reports/repeated-source.txt")" = '3'

cd "$BASE"
sha256sum -c evidence/backup.sha256 >/dev/null
tar -tzf backups/northstar-admin-backup.tar.gz | grep -qx 'config/northstar-web.conf'

dpkg-query -W -f='${Package} ${Version} ${Status}\n' tree > "$EXPECTED"
grep -E '^DEFAULT_(INPUT|OUTPUT)_POLICY' "$UFW_DEFAULTS" >> "$EXPECTED"
ufw show added | grep '^ufw ' >> "$EXPECTED"
grep -c ' 404 ' logs/web-access.log >> "$EXPECTED"
curl -fsS http://127.0.0.1:8080/status.txt >> "$EXPECTED"
sha256sum -c evidence/backup.sha256 >> "$EXPECTED"

cmp -s "$EXPECTED" "$AUDIT"

echo "Final administration audit complete."
