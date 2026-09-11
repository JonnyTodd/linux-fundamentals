# Triage the server

Begin at the prepared company directory:

```bash
cd ~/linux-lab4/company
pwd
ls
ls -la
cat README.txt
```

## Read the sequence in plain English

| Command | Meaning |
|---|---|
| `cd PATH` | Change to the named directory. `~` represents your home directory. |
| `pwd` | Print the full path of the current working directory. |
| `ls` | List the visible directory entries. |
| `ls -la` | Use a long listing (`-l`) and include hidden entries (`-a`). |
| `cat README.txt` | Display the supplied orientation notes. |

Files and directories whose names begin with a dot are normally hidden from a basic `ls` listing. Do not change or remove the hidden PID and service files: the lab uses them to manage its harmless background processes.

There is no CHECK on this stage. Its purpose is to stop you making changes before you understand the environment.

Keep this routine available throughout the investigation:

> **Where am I? → What is here? → What evidence answers the question?**

If a later command fails with “No such file or directory”, return to `pwd` and `ls` before trying a different command.
