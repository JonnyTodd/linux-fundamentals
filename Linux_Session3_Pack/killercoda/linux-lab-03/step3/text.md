# Step 3 — Secure the payroll file

The required access is:

- owner `root`: read and write;
- authorised group `staff`: read only;
- everyone else: no access.

That is numeric permission `640`:

```text
owner  rw- = 4 + 2 = 6
group  r-- = 4     = 4
others --- = 0     = 0
```

Correct the ownership and permissions:

```bash
chown root:staff data/payroll.csv
chmod 640 data/payroll.csv
ls -l data/payroll.csv
```

The listing should now begin with `-rw-r-----` and show `root staff`. Select **CHECK** when the file is secure.
