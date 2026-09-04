# Step 5 — Investigate storage use

Two commands answer different storage questions:

```text
df -h     How much space is available on a filesystem?
du -sh    How much space is used by a file or directory?
```

Check the root filesystem:

```bash
df -h /
```

Now compare the prepared directories:

```bash
du -sh archive data logs
```

Save that three-line comparison as evidence:

```bash
du -sh archive data logs > reports/storage-usage.txt
cat reports/storage-usage.txt
```

Identify which directory uses the most space, then select **CHECK**.

