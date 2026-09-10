# Check resilience evidence

Availability depends on systems working when authorised users need them. Backups also need integrity: a damaged backup may be useless during recovery.

## Finding E — backup integrity

A **checksum** is a value calculated from the contents of a file. Even a small change normally produces a different value. A recorded checksum therefore acts like a digital fingerprint that can help detect change.

Northstar has supplied:

- the backup file `monthly-backup.tar.gz`;
- a checksum file containing the expected SHA-256 value and the backup filename.

`sha256sum -c` calculates a fresh value from the backup and compares it with the expected value in the checksum file.

Check the supplied hash and capture all output:

```bash
cd ~/cyber-lab1/northstar
sha256sum -c backups/monthly-backup.sha256 2>&1 | tee evidence/backup-check.txt
```

Break the command down:

- `sha256sum` calculates or checks SHA-256 checksum values.
- `-c` means read a checksum file and check the named file against it.
- `backups/monthly-backup.sha256` contains the expected checksum and filename.
- `2>&1` combines ordinary output and error output so both can be recorded.
- `| tee evidence/backup-check.txt` displays the result and saves it as evidence.

In plain English: **calculate the backup's current fingerprint, compare it with the recorded fingerprint, then display and save the result**.

`OK` means the values match. `FAILED` means they do not match. A failure proves that the file does not match the recorded value. It does **not** prove who changed it, why it changed or whether it contains malware.

A checksum checks integrity. It does not encrypt the file and does not prove that the file is safe.

Use `sha256sum --help` or `man sha256sum` to investigate further.

## Finding F — portal errors

Extract the errors, then count them:

```bash
grep ' ERROR ' logs/portal.log | tee evidence/portal-errors.txt
grep -c ' ERROR ' logs/portal.log | tee evidence/portal-error-count.txt
```

The first command displays and records every matching error line. In the second command, `-c` tells `grep` to output only the number of matching lines.

## CIA check

- Finding E threatens backup **integrity** and recovery **availability**.
- Finding F is evidence of an **availability** problem.

Select **CHECK** when the failed backup check and four portal errors have been recorded.
