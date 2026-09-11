# Step 1 — Identify the account

Access decisions depend on both the current account and its group memberships. Begin by asking three related questions.

```bash
whoami
id
groups
```

## What the commands do

| Command | Meaning |
|---|---|
| `whoami` | Print the name of the current user. |
| `id` | Show the user ID (`uid`), primary group ID (`gid`) and all group memberships. |
| `groups` | Show a shorter list of the groups that apply to the current user. |

Linux records numeric IDs internally, although names such as `root` and `staff` are easier for people to read.

Try one help method before moving on:

```bash
id --help
```

Now move to the prepared environment:

```bash
cd ~/linux-lab3/company
pwd
ls
cat README.txt
```

## Read that sequence in plain English

- `cd` means **change directory**.
- `~` represents your home directory, so the path leads to the prepared company folder.
- `pwd` prints your current working directory.
- `ls` lists the names in that directory.
- `cat README.txt` displays the contents of the named text file.

There is no CHECK on this step. Continue when you can identify the account you are using and the directories prepared for the systems check.
