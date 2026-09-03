# Step 2 — Preview long files

`cat` is useful for short files, but long files can fill the terminal. Use `head` and `tail` when you only need the beginning or end.

Display the first four lines of the staff file:

```bash
head -n 4 records/staff.csv
```

Display the final three access records:

```bash
tail -n 3 logs/access.log
```

## Your task

Run those commands again, but use `>` to save their output as:

```text
reports/staff-preview.txt
reports/recent-access.txt
```

Remember:

```bash
command > destination-file
```

Use `cat` to check both reports, then select **CHECK**.

