# Step 6 — Independent incident challenge

The service desk believes one of the files in `logs` contains repeated failed login attempts.

This time the exact commands are not supplied.

## Investigate

1. Determine which log contains the word `FAILED`.
2. Determine how many failed login attempts occurred.
3. Inspect the failed records and identify the IP address appearing most often.

You may find these forms useful:

```text
grep "pattern" file
grep -c "pattern" file
grep -R "pattern" directory
```

## Produce the evidence

Create:

```text
reports/incident-summary.txt
```

It must contain all six complete `FAILED` lines followed by a final line containing only the number `6`.

Also create:

```text
reports/suspicious-ip.txt
```

It must contain the four complete log lines involving the most frequently repeated IP address.

Use `>`, `>>` and the commands you have already learnt. Select **CHECK** when both evidence files are complete.

