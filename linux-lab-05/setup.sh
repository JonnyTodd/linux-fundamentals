#!/bin/bash
set -e

LAB="${LAB5_HOME:-$HOME/linux-lab5}"
BASE="$LAB/northstar-admin"

mkdir -p "$BASE/config" "$BASE/web" "$BASE/logs" "$BASE/reports" \
  "$BASE/evidence" "$BASE/backups"

printf '%s\n' \
  'Northstar Services administration environment' \
  '' \
  'config/     supplied service configuration' \
  'web/        local status-service content' \
  'logs/       prepared access records' \
  'reports/    save investigation reports here' \
  'evidence/   save system-state evidence here' \
  'backups/    place the verified archive here' \
  > "$BASE/README.txt"

printf '%s\n' \
  'service_name=northstar-status' \
  'listen_address=127.0.0.1' \
  'listen_port=8080' \
  'document_root=web' \
  'required_inbound_rule=8080/tcp' \
  > "$BASE/config/northstar-web.conf"

printf '%s\n' \
  'NORTHSTAR-ADMIN: READY' \
  > "$BASE/web/status.txt"

printf '%s\n' \
  '2026-09-01T08:00:04Z 192.0.2.20 GET /status.txt 200 23' \
  '2026-09-01T08:03:18Z 203.0.113.90 GET /admin 404 0' \
  '2026-09-01T08:04:01Z 203.0.113.90 GET /.env 404 0' \
  '2026-09-01T08:05:42Z 192.0.2.21 GET /status.txt 200 23' \
  '2026-09-01T08:06:13Z 198.51.100.8 GET /favicon.ico 404 0' \
  '2026-09-01T08:08:55Z 203.0.113.90 GET /backup.zip 404 0' \
  '2026-09-01T08:10:00Z 192.0.2.22 GET /status.txt 200 23' \
  '2026-09-01T08:12:31Z 192.0.2.20 GET /status.txt 200 23' \
  > "$BASE/logs/web-access.log"

rm -f "$BASE/evidence/package-status.txt" "$BASE/evidence/listening-port.txt" \
  "$BASE/evidence/service-response.txt" "$BASE/evidence/firewall-rules.txt" \
  "$BASE/evidence/backup.sha256" "$BASE/reports/not-found.txt" \
  "$BASE/reports/repeated-source.txt" "$BASE/reports/final-audit.txt" \
  "$BASE/backups/northstar-admin-backup.tar.gz"

if [ -f "$BASE/.status-service.pid" ]; then
  old_pid=$(tr -dc '0-9' < "$BASE/.status-service.pid")
  if [ -n "$old_pid" ]; then
    kill "$old_pid" 2>/dev/null || true
  fi
fi

nohup python3 -m http.server 8080 --bind 127.0.0.1 --directory "$BASE/web" \
  > "$BASE/.status-service.log" 2>&1 &
echo $! > "$BASE/.status-service.pid"

for attempt in 1 2 3 4 5; do
  if curl -fsS http://127.0.0.1:8080/status.txt >/dev/null 2>&1; then
    break
  fi
  sleep 1
done

if dpkg-query -W -f='${Status}' tree 2>/dev/null | grep -qx 'install ok installed'; then
  apt-get remove -y tree >/dev/null 2>&1 || true
fi

if ! command -v ufw >/dev/null 2>&1; then
  apt-get update -qq
  DEBIAN_FRONTEND=noninteractive apt-get install -y ufw >/dev/null
fi

ufw --force disable >/dev/null 2>&1 || true
ufw --force reset >/dev/null
ufw default deny incoming >/dev/null
ufw default allow outgoing >/dev/null

find "$LAB" -type d -exec chmod u+rwx {} +
find "$LAB" -type f -exec chmod u+rw {} +
touch "$LAB/.setup-complete"
