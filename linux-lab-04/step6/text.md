# Incident 5 — recover wasted storage

The `archive` directory contains a valid monthly backup and an unwanted temporary cache image.

## Compare the items

```bash
ls -lh archive
du -sh archive/*
```

### Command meanings

- `ls -lh` uses a long listing (`-l`) with human-readable sizes (`-h`).
- `du` reports disk usage.
- `-s` gives one summary for each selected item.
- `-h` again uses readable units such as MiB.
- `archive/*` uses the wildcard `*` to select every non-hidden entry inside `archive`.

The wildcard is expanded by the shell before `du` runs. Predict the two paths it will select, then inspect the output.

## Remove only the named temporary file

```bash
rm archive/tmp-cache.img
```

`rm` removes the named file and normally bypasses a Recycle Bin. Read the exact path before pressing Enter. Do not remove `monthly-backup.img`.

## Verify and save the final state

```bash
ls -lh archive
du -sh archive
du -sh archive > evidence/storage-after.txt
cat evidence/storage-after.txt
```

The final `du` measures the whole archive directory after removal. `>` creates or replaces the evidence file with that current result, and `cat` displays what was saved.

In plain English: **inspect the two items, remove only the disposable cache, remeasure the remaining archive and preserve that measurement as evidence**.

Use `du --help` or `man du` if you need to review `-s` and `-h`. Select **CHECK** when the cache is gone, the monthly backup remains and the evidence matches the current result.
