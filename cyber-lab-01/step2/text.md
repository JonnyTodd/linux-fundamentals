# Trace exposed information

The audit brief warns that information and credentials may be exposed.

## Finding A — customer data in a public area

Locate the customer export and save its path as evidence:

```bash
cd ~/cyber-lab1/northstar
find . -name 'customer-export.csv' | tee evidence/customer-location.txt
head -n 2 public/customer-export.csv
```

## Finding B — a password stored as readable text

Search the configuration directory and save the matching line:

```bash
grep -R 'password=' configuration | tee evidence/password-finding.txt
```

The strings are fictional, but the weakness is realistic: secrets should not be stored in readable configuration files.

## CIA check

- Finding A primarily threatens **confidentiality**.
- Finding B can lead to loss of **confidentiality, integrity and availability** if the credential is misused.

Select **CHECK** when both evidence files exist.
