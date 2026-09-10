# Audit access and accounts

Security failures are not always caused by malware. Poor access control can create its own attack path.

## Finding C — payroll permissions

Inspect the numeric permissions and record them:

```bash
cd ~/cyber-lab1/northstar
stat -c '%a %n' finance/payroll.csv | tee evidence/payroll-mode.txt
```

`666` means every user can read and write the file. Do **not** correct it yet; preserve the audit state.

## Finding D — an active leaver account

Inspect the account list, then record the active entry:

```bash
cat accounts/leavers.csv
grep ',active,' accounts/leavers.csv | tee evidence/leaver-account.txt
```

## CIA check

- Finding C threatens payroll **confidentiality and integrity**.
- Finding D could affect all three CIA objectives, depending on how the account is used.

Select **CHECK** when both findings have been recorded.
