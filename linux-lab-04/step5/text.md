# Incident 4 — stop the unwanted process

A process called `backup-loop` should have ended after the last backup, but it is still running. Every running process has a numeric process ID or **PID**.

## Identify the exact process

```bash
pgrep -a backup-loop
```

- `pgrep` searches the running process list by process name.
- `-a` displays the PID and full command line so that you can confirm the match.
- `backup-loop` is the exact process name required by the incident.

The first number in the result is the PID. If you need the wider process list for context, `ps aux` displays processes belonging to all users, including background processes.

## Stop it normally

```text
kill PID
```

Replace `PID` with the number you actually found. For example, a reported PID of `1234` would require `kill 1234`; do not use that example unless it is genuinely your PID.

With no option, `kill` sends the normal `SIGTERM` request. Do not use `kill -9` here because that forces termination without allowing normal clean-up.

## Verify

```bash
pgrep -a backup-loop
```

No output means the named process is no longer running. Do not stop the Python status service or any other process.

Useful help:

```bash
pgrep --help
kill --help
```

Select **CHECK** when the follow-up search returns no match.
