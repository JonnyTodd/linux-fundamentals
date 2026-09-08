# Create and verify a backup

The service configuration, reports and evidence must be placed in one compressed administration archive.

## Your task

Create:

```text
backups/northstar-admin-backup.tar.gz
```

It must contain the complete current contents of:

```text
config/
reports/
evidence/
```

Then create a SHA-256 checksum file:

```text
evidence/backup.sha256
```

Useful commands:

```bash
tar -czf backups/northstar-admin-backup.tar.gz config reports evidence
tar -tzf backups/northstar-admin-backup.tar.gz
sha256sum backups/northstar-admin-backup.tar.gz > evidence/backup.sha256
sha256sum -c evidence/backup.sha256
```

`tar -c` creates an archive, `-z` compresses it with gzip, `-f` names the archive and `-t` lists its contents.

Select **CHECK** when the archive contains the required evidence and the checksum verifies successfully.
