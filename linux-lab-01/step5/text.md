# Step 5 — Find a hidden file

Linux normally hides filenames that begin with a dot (`.`).

Return to the training directory:

```bash
cd ~/linux-lab1/training
```

Try:

```bash
ls
```

Now compare it with:

```bash
ls -la
```

The options mean:

- `-l` = long/detailed listing
- `-a` = include **all** entries, including hidden ones

Look for a hidden file whose name begins with a dot.

Display its contents using `cat`.

## Your task

Copy the hidden file into your `practice` directory and rename the copy:

```text
clue.txt
```

The original hidden file should remain where it is.

Select **CHECK** when complete.
