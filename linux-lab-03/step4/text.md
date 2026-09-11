# Step 4 — Stop the unwanted process

A retired reporting tool named `report-worker` is still running. A **process** is a program that is currently running, and every process has a numeric process ID or **PID**.

First inspect the process list:

```bash
ps aux
```

## Understanding `ps aux`

- `ps` reports running processes.
- `a` includes processes belonging to other users that have terminals.
- `u` uses a user-focused display with columns such as user and CPU use.
- `x` also includes processes without a controlling terminal, which commonly includes background services.

The list is long, so search directly by process name:

```bash
pgrep -a report-worker
```

- `pgrep` searches the running process list by name.
- `-a` prints the PID **and** the full command line so you can confirm the match.
- `report-worker` is the process name to find.

The first number is the PID. Use the number you actually found:

```text
kill PID
```

For example, if `pgrep` reports PID `1234`, the command would be `kill 1234`. Do not type the letters `PID`, and do not use the example number unless it is genuinely yours.

By default, `kill` sends a normal termination request called `SIGTERM`. Do not use `kill -9` here: it forces a process to stop without allowing normal clean-up.

Verify the result:

```bash
pgrep -a report-worker
```

No output means there is no matching process. If output still appears, reread the PID and inspect it before trying again.

Useful help:

```bash
pgrep --help
kill --help
```

Select **CHECK** when the follow-up search produces no output.
