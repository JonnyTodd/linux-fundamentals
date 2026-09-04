# Step 4 — Stop the unwanted process

A retired reporting tool named `report-worker` is still running.

First inspect the process list:

```bash
ps aux
```

The list is long. Search directly by process name:

```bash
pgrep -a report-worker
```

The first number is the process ID, or **PID**. Use that number with `kill`:

```text
kill PID
```

Replace `PID` with the number you found; do not type the letters `PID`. Run `pgrep -a report-worker` again. No output means the unwanted process is no longer running.

Select **CHECK** when it has stopped.

