# Step 2 — Audit the payroll file

Detailed listings reveal a file's owner, group and access permissions:

```bash
ls -l data/payroll.csv
```

The first ten characters include the file type and three permission groups:

```text
-rw-rw-rw-
 │  │  └── others
 │  └───── group
 └──────── owner
```

This payroll file is currently writable by everyone. Record the original state before changing it:

```bash
stat -c "%a %U %G" data/payroll.csv > reports/permission-audit.txt
cat reports/permission-audit.txt
```

Your report should show the numeric permissions, owner and group. Select **CHECK** when the audit evidence has been saved.

