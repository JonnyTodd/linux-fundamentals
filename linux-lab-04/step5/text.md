# Incident 4 — stop the unwanted process

A process called `backup-loop` should have ended after the last backup, but it is still running.

## Your task

1. Find the exact process and its PID.
2. Stop that process normally.
3. Repeat your search to prove it no longer appears.

Useful command families include:

```text
ps    pgrep -a    kill
```

Do not stop the local status service. Stop only `backup-loop`.

Select **CHECK** when your follow-up search returns no matching process.
