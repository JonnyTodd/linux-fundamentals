# Step 5 — Build a combined report

The `>` symbol replaces a file's contents. The `>>` symbol appends output to the end.

Your existing `reports/errors.txt` contains three `ERROR` lines.

## Your task

Append every `WARNING` line from `logs/application.log` to the end of `reports/errors.txt`.

Use this pattern:

```bash
grep "text" source-file >> destination-file
```

Then check the report:

```bash
cat reports/errors.txt
wc -l reports/errors.txt
```

It should contain five lines: three errors followed by two warnings. Select **CHECK** when it does.

