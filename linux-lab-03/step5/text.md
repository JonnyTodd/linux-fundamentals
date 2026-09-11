# Step 5 — Investigate storage use

`df` and `du` answer different questions:

| Command | Question answered |
|---|---|
| `df` | How much total space is used and available on a filesystem? |
| `du` | How much space is used by particular files or directories? |

Check the filesystem containing the root directory:

```bash
df -h /
```

- `df` means **disk free**.
- `-h` uses human-readable units such as MiB and GiB.
- `/` selects the filesystem containing the root directory.

Now compare the prepared directories:

```bash
du -sh archive data logs
```

- `du` means **disk usage**.
- `-s` gives one summary for each named item rather than every subdirectory.
- `-h` again uses human-readable units.
- `archive data logs` are three separate directory arguments.

Save the same three-line comparison as evidence:

```bash
du -sh archive data logs > reports/storage-usage.txt
cat reports/storage-usage.txt
```

The `>` symbol redirects the output into `reports/storage-usage.txt`. It creates the file or replaces its previous contents. `cat` then displays the saved evidence so you can check it.

In plain English: **summarise the size of each named directory, save the three results in a report, then display the report**.

Try `du --help` or `man du` if you want to compare `-s` with other options.

Identify which directory uses the most space, make sure the report contains exactly the current three-line comparison, then select **CHECK**.
