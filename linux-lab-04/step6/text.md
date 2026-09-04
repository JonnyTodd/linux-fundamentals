# Incident 5 — recover wasted storage

The `archive` directory contains a valid monthly backup and an unwanted temporary cache image.

## Your task

1. Compare the size of each item in `archive`.
2. Remove only `archive/tmp-cache.img`.
3. Keep `archive/monthly-backup.img`.
4. Save the final size of the whole archive directory in:

```text
evidence/storage-after.txt
```

Useful command families include:

```text
du -sh    ls -lh    rm    >    cat
```

Remember: deletion normally bypasses a Recycle Bin. Read the exact target before pressing Enter.

Select **CHECK** when the temporary file is gone and your final evidence matches the current directory.
