#!/bin/bash
set -e
LAB="$HOME/cyber-lab1/northstar"

test -f "$LAB/evidence/customer-location.txt"
grep -Fqx './public/customer-export.csv' "$LAB/evidence/customer-location.txt"
test -f "$LAB/evidence/password-finding.txt"
grep -Fq 'admin_password=Northstar-Training-Only-2026!' "$LAB/evidence/password-finding.txt"
