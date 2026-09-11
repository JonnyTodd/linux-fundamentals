#!/bin/bash
set -e

BASE="${LAB5_HOME:-$HOME/linux-lab5}/northstar-admin"
FILE="$BASE/evidence/package-status.txt"

dpkg-query -W -f='${Status}' tree 2>/dev/null | grep -qx 'install ok installed'
test -s "$FILE"

expected=$(dpkg-query -W -f='${Package} ${Version} ${Status}\n' tree)
actual=$(cat "$FILE")
test "$actual" = "$expected"

echo "Package installed and package evidence verified."
