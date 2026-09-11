# Incident 2 — investigate failed logins

The security team believes `logs/security.log` contains repeated failed login attempts. Preserve complete original lines so another person can review your evidence.

## Inspect before saving

```bash
cat logs/security.log
grep 'FAILED' logs/security.log
grep -c 'FAILED' logs/security.log
```

## Break down `grep`

- `grep` searches text and prints complete matching lines.
- `'FAILED'` is the case-sensitive search pattern.
- `logs/security.log` is the file to search.
- `-c` changes the output from matching lines to a **count of matching lines**.

`grep -c` does not count how many times a word occurs inside one line; it counts the number of lines that match.

## Create `evidence/failed-logins.txt`

```bash
grep 'FAILED' logs/security.log > evidence/failed-logins.txt
grep -c 'FAILED' logs/security.log >> evidence/failed-logins.txt
cat evidence/failed-logins.txt
```

| Symbol | Meaning |
|---|---|
| `>` | Create or replace the evidence file with the matching lines. |
| `>>` | Append the count to the end without removing those lines. |

In plain English: **save every failed-login line, append the number of matching lines, then display the finished evidence file**.

## Identify the repeated source address

Read the failed lines and compare the addresses after the word `from`. You can test a candidate without changing any files:

```text
grep -c 'ADDRESS' evidence/failed-logins.txt
```

Replace `ADDRESS` with the address you observed. Once you have identified the most frequent address, save only its complete failed-login lines. For this log the required pattern can combine `FAILED` and the address:

```bash
grep 'FAILED.*203\.0\.113\.77' logs/security.log > evidence/suspicious-ip.txt
cat evidence/suspicious-ip.txt
```

Inside this `grep` pattern:

- `.*` means any characters may appear between the two parts;
- `\.` means a literal full stop in the IP address.

Use `grep --help` or `man grep` to investigate its pattern and output options.

Select **CHECK** when both evidence files contain complete entries in their original order, and the failed-login file ends with the correct count.
