# Trace exposed information

The audit brief warns that information and credentials may be exposed.

## Finding A — customer data in a public area

Locate the customer export and save its path as evidence. Read the command before running it:

```bash
cd ~/cyber-lab1/northstar
find . -name 'customer-export.csv' | tee evidence/customer-location.txt
head -n 2 public/customer-export.csv
```

### How the first command works

- `find` searches through directories.
- `.` starts the search in your current directory.
- `-name 'customer-export.csv'` looks for that exact filename.
- `|` is a **pipe**. It sends the output from the command on its left into the command on its right.
- `tee evidence/customer-location.txt` displays the result and also saves a copy in the evidence file.

In plain English: **find the customer export, show its path on screen and save that path as evidence**.

`head -n 2` then displays the first two lines of the customer file. This lets you confirm what kind of information it contains without printing the whole file.

## Finding B — a password stored as readable text

Search the configuration directory and save the matching line:

```bash
grep -R 'password=' configuration | tee evidence/password-finding.txt
```

Break the command down:

- `grep` searches text for a matching pattern.
- `-R` searches recursively through every file inside the named directory.
- `'password='` is the text pattern to find.
- `configuration` is the directory to search.
- `tee` displays the matching line and saves it as evidence.

In plain English: **search every configuration file for `password=`, display any matching line and save it**.

Try `grep --help` or `man grep` if you want to investigate its options.

The strings are fictional, but the weakness is realistic: secrets should not be stored in readable configuration files.

## CIA check

- Finding A primarily threatens **confidentiality**.
- Finding B can lead to loss of **confidentiality, integrity and availability** if the credential is misused.

Select **CHECK** when both evidence files exist.
