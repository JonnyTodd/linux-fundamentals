# Step 3 — Count records

`wc` means **word count**, but it can count several things. The `-l` option counts lines.

Try:

```bash
wc -l records/staff.csv
wc -l logs/access.log
```

The staff result includes the CSV heading row as well as the twelve staff records.

## Your task

Save the two results as:

```text
reports/staff-count.txt
reports/access-count.txt
```

Use `>` to redirect each result into the correct file. Use `cat` to check them, then select **CHECK**.

