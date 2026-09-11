# Step 2 - Install and verify a package

Ubuntu uses **APT** to find and install software packages from configured repositories.

## Three commands that sound similar

| Command | What it does in this lab |
|---|---|
| `apt update` | Downloads fresh information about packages. It does not upgrade every installed program. |
| `apt install tree` | Installs the selected package called `tree`. |
| `apt upgrade` | Attempts to upgrade many installed packages. **Do not use this here.** |

## 1. Refresh the catalogue

```bash
apt update
```

APT displays the repositories it contacts and finishes by reading its package lists. This may take a short time.

## 2. Inspect the package before installing it

```bash
apt show tree
```

`apt show PACKAGE` displays information such as the description, version and download size. Read the description and find the installed-size field.

## 3. Install only the named package

```bash
apt install -y tree
```

- `install` requests a package installation.
- `tree` is the package name.
- `-y` automatically answers yes to APT's confirmation question.

Normally an administrator should read the proposed changes before agreeing. Here the package and command have been deliberately limited for the training task.

## 4. Verify that the command is available

```bash
which tree
tree -L 2
```

- `which tree` displays the executable path the shell would use.
- `tree` displays directories and files as a hierarchy.
- `-L 2` limits the display to two levels, preventing an unnecessarily long listing.

## 5. Record package evidence

```bash
dpkg-query -W -f='${Package} ${Version} ${Status}\n' tree | tee evidence/package-status.txt
```

Read the command from left to right:

| Part | Meaning |
|---|---|
| `dpkg-query` | Ask Ubuntu's installed-package database for information. |
| `-W` | Show information about a matching installed package. |
| `-f='...'` | Use the supplied output format. |
| `${Package}` | Print the package name. This is a `dpkg-query` field, not a shell variable here because the text is in single quotes. |
| `${Version}` | Print the installed version. |
| `${Status}` | Print the package status. |
| `\n` | End the output with a new line. |
| `|` | Pass the output to the next command. |
| `tee FILE` | Display the output and save an identical copy in `FILE`. |

The evidence should be one line beginning with `tree` and ending:

```text
install ok installed
```

Check it yourself:

```bash
cat evidence/package-status.txt
```

## If something goes wrong

- **Could not get lock:** the background setup may still be using APT. Wait briefly, then run the command again.
- **Unable to locate package:** confirm that `apt update` completed successfully.
- **Evidence is empty:** rerun the complete `dpkg-query ... | tee ...` command from the Northstar directory.

Try `apt --help`, `apt install --help` or `man apt` for further help. Select **CHECK** when the package and evidence are verified.
