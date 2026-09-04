# Incident 2 — investigate failed logins

The security team believes `logs/security.log` contains repeated failed login attempts.

## Your task

Create two evidence files.

### `evidence/failed-logins.txt`

- Copy every complete line containing `FAILED` into this file.
- Add the total number of failed attempts as the final line.

### `evidence/suspicious-ip.txt`

- Determine which source IP address appears most often in the failed attempts.
- Copy every complete failed-login line for that IP address into this file.

Useful command families include:

```text
grep    grep -c    >    >>    cat
```

Select **CHECK** when both evidence files are complete. The order of the log entries must remain unchanged.
