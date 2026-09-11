#!/bin/bash
set -e
FILE="$HOME/cyber-lab2/northstar-incident/evidence/incident-assessment.txt"

test -f "$FILE"
grep -Fqx 'DECISION: INCIDENT' "$FILE"
grep -Fqx 'CONFIDENCE: HIGH' "$FILE"
grep -Fqx 'ACCOUNT: r.singh' "$FILE"
grep -Fqx 'HOST: ns-fin-07' "$FILE"
grep -Fqx 'SOURCE_IP: 198.51.100.24' "$FILE"
grep -Fqx 'REASON: Successful login followed the phishing message and unauthorised script execution.' "$FILE"
