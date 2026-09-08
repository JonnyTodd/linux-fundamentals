#!/bin/bash
set -e

BASE="${LAB5_HOME:-$HOME/linux-lab5}/northstar-admin"

pgrep -af 'http.server 8080' >/dev/null
ss -ltnp | grep -q ':8080'
grep -q ':8080' "$BASE/evidence/listening-port.txt"

expected=$(curl -fsS http://127.0.0.1:8080/status.txt)
actual=$(cat "$BASE/evidence/service-response.txt")
test "$expected" = 'NORTHSTAR-ADMIN: READY'
test "$actual" = "$expected"

echo "Running service, listening port and response verified."
