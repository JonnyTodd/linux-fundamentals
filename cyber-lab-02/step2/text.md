# Analyse authentication activity

An authentication log records attempts to prove an identity to a system. Read the supplied log without editing it:

```bash
cd ~/cyber-lab2/northstar-incident
cat logs/auth.log
```

Extract the failed password attempts:

```bash
grep 'Failed password' logs/auth.log | tee evidence/failed-logins.txt
```

Count them:

```bash
grep -c 'Failed password' logs/auth.log | tee evidence/failed-count.txt
```

- `grep -c` prints a **count of matching lines** instead of printing the lines themselves.
- the result should be `5`.

Now extract successful password logins:

```bash
grep 'Accepted password' logs/auth.log | tee evidence/accepted-logins.txt
```

Read the accepted line carefully. Identify the account, source address and time.

The address `198.51.100.24` belongs to a range reserved for documentation. It represents an external source only inside this fictional exercise.

Select **CHECK** when you have recorded the failed count and accepted-login evidence.
