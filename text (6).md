# Check resilience evidence

Availability depends on systems working when authorised users need them. Backups also need integrity: a damaged backup may be useless during recovery.

## Finding E — backup integrity

Check the supplied hash and capture all output:

```bash
cd ~/cyber-lab1/northstar
sha256sum -c backups/monthly-backup.sha256 2>&1 | tee evidence/backup-check.txt
```

The word `FAILED` means the backup does not match its recorded checksum.

## Finding F — portal errors

Extract the errors, then count them:

```bash
grep ' ERROR ' logs/portal.log | tee evidence/portal-errors.txt
grep -c ' ERROR ' logs/portal.log | tee evidence/portal-error-count.txt
```

## CIA check

- Finding E threatens backup **integrity** and recovery **availability**.
- Finding F is evidence of an **availability** problem.

Select **CHECK** when the failed backup check and four portal errors have been recorded.
