# Step 4 — Search the application log

`grep` displays lines containing matching text.

Try:

```bash
grep "ERROR" logs/application.log
```

Useful options include:

```text
-c   count matching lines
-n   show line numbers
-i   ignore upper/lower case
```

Experiment with:

```bash
grep -n "ERROR" logs/application.log
grep -i "warning" logs/application.log
grep -c "ERROR" logs/application.log
```

## Your task

Create:

```text
reports/errors.txt
```

containing the three complete `ERROR` lines, and:

```text
reports/error-count.txt
```

containing the number of `ERROR` lines. Select **CHECK** when both are correct.

