#!/bin/bash
set -e

LAB="${LAB3_HOME:-$HOME/linux-lab3}"
BASE="$LAB/company"

mkdir -p "$BASE/data" "$BASE/archive" "$BASE/logs" "$BASE/reports" "$BASE/bin" "$BASE/web"

printf '%s\n' \
  'Northstar Services systems-check environment' \
  '' \
  'data/      confidential business data' \
  'archive/   older backup material' \
  'logs/      service data' \
  'reports/   save your evidence here' \
  'web/       files served by the local status service' \
  > "$BASE/README.txt"

printf '%s\n' \
  'employee_id,name,department,monthly_salary' \
  '2101,Maria Chen,Finance,3250' \
  '2102,Devon Reed,Support,2840' \
  '2103,Aisha Khan,Operations,3010' \
  > "$BASE/data/payroll.csv"
chown root:root "$BASE/data/payroll.csv"
chmod 666 "$BASE/data/payroll.csv"

rm -f "$BASE/reports/permission-audit.txt" "$BASE/reports/storage-usage.txt" \
  "$BASE/reports/network-summary.txt" "$BASE/reports/service-status.txt"

dd if=/dev/zero of="$BASE/archive/old-backup.img" bs=1M count=6 status=none
dd if=/dev/zero of="$BASE/data/reference.bin" bs=1M count=2 status=none
dd if=/dev/zero of="$BASE/logs/app-cache.bin" bs=1M count=1 status=none

if [ -f "$BASE/.report-worker.pid" ]; then
  old_worker_pid=$(tr -dc '0-9' < "$BASE/.report-worker.pid")
  if [ -n "$old_worker_pid" ]; then
    kill "$old_worker_pid" 2>/dev/null || true
  fi
fi
cp /bin/sleep "$BASE/bin/report-worker"
nohup "$BASE/bin/report-worker" 3600 >/dev/null 2>&1 &
echo $! > "$BASE/.report-worker.pid"

if [ -f "$BASE/.status-service.pid" ]; then
  old_service_pid=$(tr -dc '0-9' < "$BASE/.status-service.pid")
  if [ -n "$old_service_pid" ]; then
    kill "$old_service_pid" 2>/dev/null || true
  fi
fi
printf '%s\n' 'NORTHSTAR-SERVICE: ONLINE' > "$BASE/web/status.txt"
nohup python3 -m http.server 8765 --bind 127.0.0.1 --directory "$BASE/web" \
  > "$BASE/.status-service.log" 2>&1 &
echo $! > "$BASE/.status-service.pid"

for attempt in 1 2 3 4 5; do
  if curl -fsS http://127.0.0.1:8765/status.txt >/dev/null 2>&1; then
    break
  fi
  sleep 1
done

chmod -R u+rwX "$LAB"
