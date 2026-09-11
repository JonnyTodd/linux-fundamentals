#!/bin/bash
set -e

BASE="${LAB5_HOME:-$HOME/linux-lab5}/northstar-admin"
ARCHIVE="$BASE/backups/northstar-admin-backup.tar.gz"
CHECKSUM="$BASE/evidence/backup.sha256"

test -s "$ARCHIVE"
test -s "$CHECKSUM"

cd "$BASE"
sha256sum -c evidence/backup.sha256 >/dev/null
tar -tzf "$ARCHIVE" | grep -qx 'config/northstar-web.conf'
tar -tzf "$ARCHIVE" | grep -qx 'reports/not-found.txt'
tar -tzf "$ARCHIVE" | grep -qx 'reports/repeated-source.txt'
tar -tzf "$ARCHIVE" | grep -qx 'evidence/package-status.txt'
tar -tzf "$ARCHIVE" | grep -qx 'evidence/listening-port.txt'
tar -tzf "$ARCHIVE" | grep -qx 'evidence/service-response.txt'
tar -tzf "$ARCHIVE" | grep -qx 'evidence/firewall-rules.txt'

echo "Compressed administration backup and SHA-256 checksum verified."
