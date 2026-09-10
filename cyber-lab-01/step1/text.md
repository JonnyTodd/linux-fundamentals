# Receive the audit brief

Begin by confirming where you are and examining the supplied structure.

## Command reminder

| Part | Meaning |
|---|---|
| `cd path` | Change directory and move to the specified location. |
| `pwd` | Print the full path of your current working directory. |
| `ls` | List the contents of the current directory. |
| `cat file` | Display the contents of a text file. |

```bash
cd ~/cyber-lab1/northstar
pwd
ls
cat README.txt
cat reference/audit-brief.txt
```

Now list all files without changing them:

```bash
find . -type f
```

Break the command down:

- `find` searches through a directory and its subdirectories.
- `.` means start in the current directory.
- `-type f` means show files only, rather than directories.

In plain English: **search the current directory and everything beneath it, then list every file**.

You can investigate the command yourself with:

```bash
find --help
man find
```

## Think before continuing

Which Northstar assets might need confidentiality, integrity or availability?

This first step is inspection only, so there is no CHECK yet.
