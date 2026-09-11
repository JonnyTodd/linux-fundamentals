#!/bin/bash
set -e

LAB="${LAB4_HOME:-$HOME/linux-lab4}"
BASE="$LAB/company"

mkdir -p "$BASE/documents/old" "$BASE/secure" "$BASE/logs" "$BASE/data" \
  "$BASE/archive" "$BASE/evidence" "$BASE/web" "$BASE/bin"

printf '%s\n' \
  'Northstar Services recovery environment' \
  '' \
  'documents/   ordinary and historical documents' \
  'secure/      approved location for confidential material' \
  'logs/        security and application records' \
  'data/        operational business data' \
  'archive/     backups and temporary images' \
  'evidence/    save investigation evidence here' \
  'web/         local service content' \
  > "$BASE/README.txt"

printf '%s\n' \
  'CONFIDENTIAL-NORTHSTAR-2026' \
  'Quarterly resilience plan' \
  'Owner: Operations' \
  'Status: Approved' \
  > "$BASE/documents/old/quarterly-plan.txt"
rm -f "$BASE/secure/quarterly-plan.txt"

printf '%s\n' \
  '2026-08-17T08:55:03Z INFO ssh service started' \
  '2026-08-17T09:01:12Z FAILED login for admin from 203.0.113.77' \
  '2026-08-17T09:01:20Z FAILED login for admin from 203.0.113.77' \
  '2026-08-17T09:03:04Z SUCCESS login for aisha from 192.0.2.18' \
  '2026-08-17T09:07:41Z FAILED login for root from 198.51.100.25' \
  '2026-08-17T09:08:06Z FAILED login for root from 203.0.113.77' \
  '2026-08-17T09:11:33Z FAILED login for support from 192.0.2.44' \
  '2026-08-17T09:13:58Z FAILED login for admin from 203.0.113.77' \
  '2026-08-17T09:16:22Z SUCCESS login for devon from 192.0.2.19' \
  '2026-08-17T09:18:45Z FAILED login for root from 198.51.100.25' \
  > "$BASE/logs/security.log"

printf '%s\n' \
  '2026-08-17T09:00:00Z INFO application ready' \
  '2026-08-17T09:05:00Z INFO scheduled report complete' \
  '2026-08-17T09:10:00Z WARN cache approaching limit' \
  > "$BASE/logs/application.log"

printf '%s\n' \
  'employee_id,name,department,monthly_salary' \
  '2101,Maria Chen,Finance,3250' \
  '2102,Devon Reed,Support,2840' \
  '2103,Aisha Khan,Operations,3010' \
  > "$BASE/data/payroll.csv"
if ! getent group staff >/dev/null; then
  groupadd staff
fi
chown root:root "$BASE/data/payroll.csv"
chmod 666 "$BASE/data/payroll.csv"

dd if=/dev/zero of="$BASE/archive/monthly-backup.img" bs=1M count=6 status=none
dd if=/dev/zero of="$BASE/archive/tmp-cache.img" bs=1M count=8 status=none

rm -f "$BASE/evidence/failed-logins.txt" "$BASE/evidence/suspicious-ip.txt" \
  "$BASE/evidence/storage-after.txt" "$BASE/evidence/network-summary.txt" \
  "$BASE/evidence/service-status.txt"

if [ -f "$BASE/.backup-loop.pid" ]; then
  old_worker_pid=$(tr -dc '0-9' < "$BASE/.backup-loop.pid")
  if [ -n "$old_worker_pid" ]; then
    kill "$old_worker_pid" 2>/dev/null || true
  fi
fi
cp /bin/sleep "$BASE/bin/backup-loop"
nohup "$BASE/bin/backup-loop" 3600 >/dev/null 2>&1 &
echo $! > "$BASE/.backup-loop.pid"

if [ -f "$BASE/.status-service.pid" ]; then
  old_service_pid=$(tr -dc '0-9' < "$BASE/.status-service.pid")
  if [ -n "$old_service_pid" ]; then
    kill "$old_service_pid" 2>/dev/null || true
  fi
fi
printf '%s\n' 'NORTHSTAR-RECOVERY: READY' > "$BASE/web/status.txt"
nohup python3 -m http.server 8766 --bind 127.0.0.1 --directory "$BASE/web" \
  > "$BASE/.status-service.log" 2>&1 &
echo $! > "$BASE/.status-service.pid"

for attempt in 1 2 3 4 5; do
  if curl -fsS http://127.0.0.1:8766/status.txt >/dev/null 2>&1; then
    break
  fi
  sleep 1
done

find "$LAB" -type d -exec chmod u+rwx {} +
find "$LAB" -type f ! -path "$BASE/data/payroll.csv" -exec chmod u+rw {} +
chmod u+x "$BASE/bin/backup-loop"
