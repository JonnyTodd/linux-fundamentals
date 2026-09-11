# Step 5 - Analyse the access log

`logs/web-access.log` contains one request per line. Each line records:

```text
timestamp  source-IP  method  requested-path  HTTP-status  response-size
```

HTTP status `200` means the request succeeded. In this simplified log, `404` means the requested resource was not found.

## 1. Inspect the source before producing reports

```bash
head logs/web-access.log
tail logs/web-access.log
```

- `head FILE` displays the first ten lines by default.
- `tail FILE` displays the last ten lines by default.

The file is short, so both commands display most or all of it. On a real large log they provide quick views of the beginning and end.

## 2. Find and count every 404 line

```bash
grep ' 404 ' logs/web-access.log
grep -c ' 404 ' logs/web-access.log
```

- `grep PATTERN FILE` displays complete matching lines.
- Spaces around `404` help avoid matching the digits inside another value.
- `-c` returns the **number of matching lines**, not the lines themselves.

Create the first report:

```bash
grep ' 404 ' logs/web-access.log > reports/not-found.txt
grep -c ' 404 ' logs/web-access.log >> reports/not-found.txt
cat reports/not-found.txt
```

The first `>` creates the report. The second `>>` appends the count as its final line. The expected final count is `4`.

## 3. Identify the source producing the most 404 responses

This analysis pipeline counts source addresses:

```bash
grep ' 404 ' logs/web-access.log | awk '{print $2}' | sort | uniq -c | sort -nr
```

Read it from left to right:

| Part | Meaning |
|---|---|
| `grep ' 404 ' ...` | Keep only unsuccessful request lines. |
| `awk '{print $2}'` | Print field 2 from each line: the source IP address. |
| `sort` | Put identical addresses next to each other. |
| `uniq -c` | Collapse adjacent identical lines and count them. |
| `sort -nr` | Sort numerically (`-n`) in reverse order (`-r`), placing the largest count first. |

The first result should show three requests from `203.0.113.90`.

Create the second report:

```bash
grep '203.0.113.90' logs/web-access.log > reports/repeated-source.txt
grep -c '203.0.113.90' logs/web-access.log >> reports/repeated-source.txt
cat reports/repeated-source.txt
```

Its final line should be `3`.

## Verify both reports

```bash
tail -n 1 reports/not-found.txt
tail -n 1 reports/repeated-source.txt
```

`tail -n 1` requests only the final line. The two displayed values should be `4` and `3`.

## If CHECK does not pass

- Make sure each report contains complete original log lines followed by one count.
- Make sure `not-found.txt` contains all four 404 records.
- Make sure `repeated-source.txt` contains all three records from `203.0.113.90`.
- If you accidentally used `>` for the count, the earlier lines were overwritten; simply recreate that report using the supplied commands.

Use `grep --help`, `awk --help`, `sort --help` or manual pages if needed. Select **CHECK** when both reports are correct.
