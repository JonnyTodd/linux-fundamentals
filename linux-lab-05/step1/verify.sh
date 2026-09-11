#!/bin/bash
set -e

LAB="${LAB5_HOME:-$HOME/linux-lab5}"
BASE="$LAB/northstar-admin"

test -f "$LAB/.setup-complete"
test -f "$BASE/README.txt"
test -f "$BASE/config/northstar-web.conf"
test -f "$BASE/logs/web-access.log"
pgrep -af 'http.server 8080' >/dev/null

echo "Environment ready and Northstar baseline available."
