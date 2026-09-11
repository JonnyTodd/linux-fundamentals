# Incident 1 — recover the confidential file

Operations reports that a file called `quarterly-plan.txt` has been left somewhere below the company directory. It belongs in:

```text
secure/quarterly-plan.txt
```

## First decide

- Where should the search begin?
- How will you confirm the located file is the right document?
- Does the task require a copy or a move?
- How will you prove the old path is empty afterwards?

## New command: `find`

```bash
find . -name "quarterly-plan.txt"
```

| Part | Meaning |
|---|---|
| `find` | Search recursively through a directory tree. |
| `.` | Begin at the current directory. |
| `-name` | Match an entry by filename. |
| `"quarterly-plan.txt"` | The exact name to match. Quotes keep the pattern together. |

In plain English: **search the current directory and everything below it for an entry with that exact filename**.

Use `find --help` or `man find` to explore other tests such as `-type f`, which limits results to regular files.

## Complete and verify the recovery

The search result gives you the source path. Read it before moving it:

```bash
cat documents/old/quarterly-plan.txt
mv documents/old/quarterly-plan.txt secure/quarterly-plan.txt
```

- `cat` displays the source document for confirmation.
- `mv SOURCE DESTINATION` moves the file. When the destination includes a new name, the same command can also rename a file.

Now verify both sides:

```bash
cat secure/quarterly-plan.txt
find . -name "quarterly-plan.txt"
```

The second search should return only `./secure/quarterly-plan.txt`. Select **CHECK** when the original content is in the approved location and no old copy remains.
