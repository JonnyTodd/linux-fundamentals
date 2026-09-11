# Inspect host process evidence

A process is a running program. Investigators often use `ps` to inspect live processes, but Northstar preserved a snapshot so that every student sees the same evidence.

Display the snapshot in aligned columns:

```bash
cd ~/cyber-lab2/northstar-incident
column -t host/process-snapshot.txt
```

- `column` arranges text into columns.
- `-t` formats the output as a table.
- this changes only the display, not the source file.

Search for the suspicious script and download activity:

```bash
grep -nE 'payroll_update|curl|update-check' host/process-snapshot.txt | tee evidence/suspicious-processes.txt
```

### What the search means

- `-n` adds source-file line numbers.
- `-E` allows the alternatives separated by `|`.
- `curl` is a command that can transfer data using a URL. It has legitimate uses, but its presence here matters because it appears after the suspicious login.
- `tee` preserves the matches as investigation evidence.

Do not run any script or URL shown in the snapshot. You are investigating recorded activity, not reproducing it.

Select **CHECK** when the evidence file includes the script execution and download activity.
