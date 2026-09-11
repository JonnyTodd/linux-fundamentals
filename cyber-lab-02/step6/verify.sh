#!/bin/bash
set -e
LAB="$HOME/cyber-lab2/northstar-incident"
FILE="$LAB/evidence/response-plan.txt"

test -f "$FILE"
grep -Fqx 'PRESERVE: Keep the message, logs and process snapshot unchanged.' "$FILE"
grep -Fqx 'CONTAIN_ACCOUNT: Disable r.singh and revoke active sessions.' "$FILE"
grep -Fqx 'CONTAIN_HOST: Isolate ns-fin-07 from the network.' "$FILE"
grep -Fqx 'RECOVER: Reset credentials and restore the host from a trusted state.' "$FILE"
grep -Fqx 'ESCALATE: Notify the incident lead and system owner.' "$FILE"

(
  cd "$LAB"
  sha256sum -c reference/source-files.sha256 >/dev/null
)
