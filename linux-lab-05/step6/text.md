# Step 6 - Create and verify a backup

An archive collects several files and directories into one file. The `tar` command performs the collection; gzip compression reduces the size. The conventional combined filename extension is `.tar.gz`.

Your archive must contain the current `config`, `reports` and `evidence` directories.

## 1. Confirm your location

```bash
pwd
ls
```

You should be inside `northstar-admin` and should see all three source directories. Relative paths in the next command depend on this location.

## 2. Create the compressed archive

```bash
tar -czf backups/northstar-admin-backup.tar.gz config reports evidence
```

The combined options mean:

| Option | Meaning |
|---|---|
| `-c` | Create a new archive. |
| `-z` | Compress it using gzip. |
| `-f` | Use the next item as the archive filename. Because `-f` expects a filename, it is normally placed last in the option group. |

After the archive filename, `config reports evidence` are the directories placed inside it.

## 3. Inspect the archive without extracting it

```bash
tar -tzf backups/northstar-admin-backup.tar.gz
```

Here `-t` means list rather than create. Check that the listing contains, among other entries:

```text
config/northstar-web.conf
reports/not-found.txt
reports/repeated-source.txt
evidence/package-status.txt
evidence/listening-port.txt
evidence/service-response.txt
evidence/firewall-rules.txt
```

## 4. Create a SHA-256 fingerprint

```bash
sha256sum backups/northstar-admin-backup.tar.gz | tee evidence/backup.sha256
```

`sha256sum FILE` calculates a 256-bit content fingerprint and displays it as 64 hexadecimal characters followed by the filename. The pipe sends that result to `tee`, which displays and saves it.

A checksum is **not encryption** and does not prove that the contents are safe or correct. It lets you detect whether the archive's bytes later differ from the bytes that produced the recorded value.

## 5. Verify the fingerprint

```bash
sha256sum -c evidence/backup.sha256
```

`-c` means check: read the recorded filename and fingerprint, calculate the archive fingerprint again, and compare them.

The expected result ends:

```text
OK
```

## If CHECK does not pass

- **No such file:** confirm `pwd` ends in `northstar-admin`.
- **Missing archive content:** recreate the archive with all three source directories.
- **Checksum FAILED:** the archive changed after its fingerprint was recorded. Recreate the archive, then recreate the checksum.
- Do not edit the 64-character value manually to force a pass.

Use `tar --help`, `man tar` or `sha256sum --help` for further help. Select **CHECK** when both the contents and fingerprint verify.
