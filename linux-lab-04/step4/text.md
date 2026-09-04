# Incident 3 — correct insecure access

`data/payroll.csv` contains confidential salary information.

Inspect its current ownership and permissions. They are unsafe.

## Required final state

| Access class | Required access |
|---|---|
| Owner | `root` — read and write |
| Group | `staff` — read only |
| Others | no access |

Change both the ownership and permission mode, then inspect the result again.

Useful command families include:

```text
ls -l    stat    chown    chmod
```

Select **CHECK** only after you can explain what each digit in the required numeric mode means.
