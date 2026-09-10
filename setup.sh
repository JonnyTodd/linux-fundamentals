#!/bin/bash
set -e

LAB="$HOME/cyber-lab1/northstar"

rm -rf "$HOME/cyber-lab1"
mkdir -p "$LAB"/{accounts,backups,configuration,evidence,finance,logs,public,reference}

cat > "$LAB/README.txt" <<'EOF'
NORTHSTAR SERVICES - INITIAL SECURITY AUDIT

Scope: inspect this directory and record evidence. Do not modify the source files.
The environment is fictional and has been created only for this training lab.
EOF

cat > "$LAB/reference/audit-brief.txt" <<'EOF'
Northstar stores customer records, payroll information, service configuration and backups.

The operations manager is concerned that:
- confidential information may be exposed;
- access may not be limited correctly;
- an old account may remain active;
- recovery evidence may be unreliable; and
- the customer portal may be unstable.

Record evidence first. Recommend controls only after rating the risks.
EOF

cat > "$LAB/reference/risk-method.txt" <<'EOF'
Use this classroom risk model.

Likelihood: 1 = unlikely, 2 = possible, 3 = likely
Impact:     1 = limited, 2 = serious, 3 = severe
Score:      likelihood x impact

1-2 = LOW
3-4 = MEDIUM
6   = HIGH
9   = EXTREME

Northstar's agreed ratings for this initial audit are:
A public customer export: likelihood 3, impact 3
B plaintext admin password: likelihood 3, impact 3
C payroll permissions 666: likelihood 2, impact 3
D former worker account active: likelihood 2, impact 3
E backup checksum failure: likelihood 2, impact 2
F four portal ERROR entries: likelihood 2, impact 2
EOF

cat > "$LAB/public/customer-export.csv" <<'EOF'
customer_id,name,email,account_tier
NS1001,Asha Patel,asha.patel@example.invalid,Gold
NS1002,Theo Morgan,theo.morgan@example.invalid,Silver
NS1003,Imani Clarke,imani.clarke@example.invalid,Gold
EOF

cat > "$LAB/configuration/web.conf" <<'EOF'
service=customer-portal
listen_port=8080
admin_user=portal-admin
admin_password=Northstar-Training-Only-2026!
log_level=INFO
EOF

cat > "$LAB/finance/payroll.csv" <<'EOF'
employee_id,department,monthly_salary
E201,Operations,3200
E202,Sales,3400
E203,IT,3600
EOF

cat > "$LAB/accounts/leavers.csv" <<'EOF'
username,status,left_on
a.green,disabled,2026-05-12
r.singh,active,2026-06-30
m.evans,disabled,2026-07-18
EOF

cat > "$LAB/backups/monthly-backup.tar.gz" <<'EOF'
This is fictional backup content for the Northstar training exercise.
EOF

cat > "$LAB/backups/monthly-backup.sha256" <<'EOF'
0000000000000000000000000000000000000000000000000000000000000000  backups/monthly-backup.tar.gz
EOF

cat > "$LAB/logs/portal.log" <<'EOF'
2026-09-08T08:00:01Z INFO portal started
2026-09-08T08:14:23Z ERROR database connection timed out
2026-09-08T08:14:28Z INFO connection restored
2026-09-08T09:03:11Z ERROR worker process stopped unexpectedly
2026-09-08T09:03:14Z INFO worker restarted
2026-09-08T09:47:50Z ERROR health check failed
2026-09-08T09:48:05Z INFO health check passed
2026-09-08T10:22:37Z ERROR request queue limit reached
EOF

cat > "$LAB/evidence/risk-register.csv" <<'EOF'
id,finding,cia,likelihood,impact,score,rating
EOF

chmod 666 "$LAB/finance/payroll.csv"
chmod -R u+rwX "$HOME/cyber-lab1"
chmod 666 "$LAB/finance/payroll.csv"
