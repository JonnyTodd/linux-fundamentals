# Step 1 - Inspect the administration server

The background setup prepares a harmless local web service and the UFW tools. Give it a moment to finish.

## 1. Wait for the environment

Run:

```bash
until [ -f ~/linux-lab5/.setup-complete ]; do sleep 1; done; echo "Environment ready"
```

This looks complicated, but it simply means:

| Part | Meaning |
|---|---|
| `until` | Repeat something until a test becomes true. |
| `[ -f PATH ]` | Test whether a normal file exists at `PATH`. |
| `do sleep 1` | Wait for one second before checking again. |
| `done` | End the repeated section. |
| `;` | Separate commands written on the same line. |
| `echo "Environment ready"` | Display a confirmation message. |

Do not continue until you see:

```text
Environment ready
```

## 2. Enter the prepared environment

```bash
cd ~/linux-lab5/northstar-admin
pwd
```

- `cd PATH` changes directory.
- `~` represents your home directory.
- `pwd` prints the complete path of your current working directory.

The final part of the displayed path should be:

```text
linux-lab5/northstar-admin
```

## 3. Read before changing anything

```bash
cat README.txt
ls -la
```

- `cat FILE` displays a text file.
- `ls` lists directory entries.
- `-l` requests a detailed or long listing.
- `-a` includes hidden names beginning with a dot.
- Options can be combined, so `-la` means both `-l` and `-a`.

Do not remove `.status-service.pid` or `.status-service.log`. The lab uses them to manage its harmless background service.

## 4. Collect a system baseline

Run each command separately:

```bash
lsb_release -d
uname -r
free -h
df -h /
```

| Command | What it tells you |
|---|---|
| `lsb_release -d` | The Linux distribution description. `-d` means description. |
| `uname -r` | The running kernel release. `-r` means release. |
| `free -h` | Used and available memory. `-h` uses human-readable units such as MiB and GiB. |
| `df -h /` | Filesystem capacity for `/`. `df` means disk free and `-h` uses readable units. |

Your exact version numbers and capacity values may differ. That is normal; the purpose is to understand the current machine before administering it.

## If something goes wrong

- **No such file or directory:** run `pwd` and `ls` to check your location.
- **The wait command does not finish:** allow the setup another minute. Restart the scenario if it never becomes ready.
- **A command is unfamiliar:** try `COMMAND --help` or `man COMMAND`.

Select **CHECK** when the environment is ready and you have inspected the baseline.
