#!/bin/bash
set -e

LAB="$HOME/linux-lab2"

rm -rf "$LAB"
mkdir -p "$LAB/company/logs" "$LAB/company/records" "$LAB/company/reports"

cat > "$LAB/company/README.txt" <<'EOF'
Northstar Services training system

logs/     contains access, application and security logs
records/  contains staff records
reports/  is where you should save the evidence you produce
EOF

cat > "$LAB/company/records/staff.csv" <<'EOF'
staff_id,name,department,status
1001,Aisha Khan,Support,Active
1002,Ben Carter,Finance,Active
1003,Chloe Martin,Sales,Active
1004,Daniel Evans,Support,Active
1005,Emily Reed,HR,Active
1006,Farah Ali,Support,Active
1007,George Hall,Finance,Inactive
1008,Hannah Young,Sales,Active
1009,Isaac Green,Support,Active
1010,Julia Brown,HR,Active
1011,Kieran Scott,Support,Active
1012,Leah Wilson,Finance,Active
EOF

cat > "$LAB/company/logs/access.log" <<'EOF'
2026-09-02 08:00:01 GET / 200 192.168.10.12
2026-09-02 08:03:14 GET /login 200 192.168.10.23
2026-09-02 08:04:02 POST /login 401 203.0.113.45
2026-09-02 08:04:18 POST /login 401 203.0.113.45
2026-09-02 08:05:31 GET /dashboard 200 192.168.10.23
2026-09-02 08:08:42 GET /assets/app.css 200 192.168.10.23
2026-09-02 08:12:05 GET /reports 403 198.51.100.17
2026-09-02 08:16:47 GET /help 200 192.168.10.44
2026-09-02 08:20:09 GET /missing 404 192.168.10.51
2026-09-02 08:22:36 POST /login 401 203.0.113.45
2026-09-02 08:25:10 GET /status 200 192.168.10.12
2026-09-02 08:27:54 GET /admin 403 203.0.113.45
EOF

cat > "$LAB/company/logs/application.log" <<'EOF'
2026-09-02 08:00:00 INFO service started
2026-09-02 08:06:11 WARNING disk usage reached 75 percent
2026-09-02 08:09:25 ERROR database connection timed out
2026-09-02 08:10:02 INFO database connection restored
2026-09-02 08:17:43 ERROR report export failed
2026-09-02 08:18:10 WARNING retry queue contains 25 jobs
2026-09-02 08:19:51 INFO retry worker started
2026-09-02 08:26:33 ERROR email gateway unavailable
2026-09-02 08:28:00 INFO health check complete
EOF

cat > "$LAB/company/logs/security.log" <<'EOF'
2026-09-02 09:00:01 INFO user=alice ip=192.168.10.23 login=SUCCESS
2026-09-02 09:03:14 FAILED user=alice ip=203.0.113.45 reason=bad_password
2026-09-02 09:04:02 FAILED user=alice ip=203.0.113.45 reason=bad_password
2026-09-02 09:05:31 FAILED user=alice ip=203.0.113.45 reason=bad_password
2026-09-02 09:12:05 INFO user=bob ip=192.168.10.44 login=SUCCESS
2026-09-02 09:14:47 FAILED user=admin ip=198.51.100.17 reason=unknown_user
2026-09-02 09:15:09 FAILED user=admin ip=198.51.100.17 reason=unknown_user
2026-09-02 09:20:36 INFO user=admin ip=192.168.10.12 login=SUCCESS
2026-09-02 09:33:54 FAILED user=guest ip=203.0.113.45 reason=locked_account
2026-09-02 09:40:00 INFO security scan completed
EOF

chmod -R u+rwX "$LAB"

