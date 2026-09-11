# Incident 3 — correct insecure access

`data/payroll.csv` contains confidential salary information. Inspect before changing it:

```bash
ls -l data/payroll.csv
stat -c "%a %U %G" data/payroll.csv
```

`ls -l` shows symbolic permissions, owner and group. `stat -c` uses a custom format: `%a` is the numeric mode, `%U` the owner name and `%G` the group name.

## Required final state

| Access class | Required access | Value |
|---|---|---|
| Owner `root` | read and write (`rw-`) | `4 + 2 = 6` |
| Group `staff` | read only (`r--`) | `4` |
| Others | no access (`---`) | `0` |

The required numeric mode is therefore `640`.

## Correct and verify

```bash
chown root:staff data/payroll.csv
chmod 640 data/payroll.csv
ls -l data/payroll.csv
stat -c "%a %U %G" data/payroll.csv
```

- `chown OWNER:GROUP FILE` changes ownership. The colon separates owner from group.
- `chmod MODE FILE` changes the access permissions.
- Repeating the two inspection commands proves the resulting state.

The long listing should begin `-rw-r-----`. The final `stat` output should be:

```text
640 root staff
```

Use `chmod --help` or `man chmod` if you need to review permission syntax. Select **CHECK** only when you can explain all three digits and have verified the result.
