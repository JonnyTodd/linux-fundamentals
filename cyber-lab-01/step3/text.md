# Audit access and accounts

Security failures are not always caused by malware. Poor access control can create its own attack path.

## Finding C — payroll permissions

Inspect the numeric permissions and record them:

```bash
cd ~/cyber-lab1/northstar
stat -c '%a %n' finance/payroll.csv | tee evidence/payroll-mode.txt
```

Break the command down:

- `stat` displays detailed information about a file.
- `-c` lets you choose the output format.
- `%a` means numeric permissions, such as `666`.
- `%n` means the filename.
- `tee` displays the result and saves the same result in an evidence file.

In plain English: **show the payroll file's numeric permissions and name, then record the result**.

Use `stat --help` or `man stat` to see other format codes.

`666` means every user can read and write the file. Do **not** correct it yet; preserve the audit state.

## Finding D — an active leaver account

Inspect the account list, then record the active entry:

```bash
cat accounts/leavers.csv
grep ',active,' accounts/leavers.csv | tee evidence/leaver-account.txt
```

Here `grep` searches one named file rather than a whole directory. The commas make the pattern more precise because this is CSV data.

In plain English: **find the row whose status field is active, display it and save it as evidence**.

## CIA check

- Finding C threatens payroll **confidentiality and integrity**.
- Finding D could affect all three CIA objectives, depending on how the account is used.

Select **CHECK** when both findings have been recorded.
