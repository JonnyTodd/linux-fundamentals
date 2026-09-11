# Step 3 — Secure the payroll file

Northstar requires **least privilege**: give each user only the access needed for their work.

The required access is:

- owner `root`: read and write;
- authorised group `staff`: read only;
- everyone else: no access.

## Decode numeric permissions

Linux uses `4` for read, `2` for write and `1` for execute. Add the required values for the owner, group and others:

```text
owner  rw- = 4 + 2 = 6
group  r-- = 4     = 4
others --- = 0     = 0
```

The required mode is therefore `640`.

Correct the ownership and permissions:

```bash
chown root:staff data/payroll.csv
chmod 640 data/payroll.csv
ls -l data/payroll.csv
stat -c "%a %U %G" data/payroll.csv
```

## What each command changes

| Command | Meaning |
|---|---|
| `chown root:staff FILE` | Change the file's owner to `root` and group to `staff`. The colon separates owner from group. |
| `chmod 640 FILE` | Change the file's permission mode to owner `rw-`, group `r--`, others `---`. |
| `ls -l FILE` | Verify the symbolic permissions, owner and group. |
| `stat -c ... FILE` | Verify the same state in the exact numeric format used in Step 2. |

In plain English: **assign the file to the authorised owner and group, apply the required access mode, then inspect it twice to prove the change worked**.

Useful help:

```bash
chown --help
chmod --help
```

The long listing should begin with `-rw-r-----` and show `root staff`. The `stat` line should be:

```text
640 root staff
```

Select **CHECK** when the file is secure.
