# Inspect the suspicious message

Move into the authorised investigation directory and read the brief:

```bash
cd ~/cyber-lab2/northstar-incident
pwd
cat README.txt
cat reference/incident-brief.txt
```

Display the message with every line numbered:

```bash
nl -ba messages/payroll-update.eml
```

### What the new command does

- `nl` means **number lines**.
- `-b` selects which lines receive numbers.
- `a` means **all lines**, including blank lines.
- `messages/payroll-update.eml` is the file being displayed.

In plain English: **show the complete message and place a line number beside every line**.

Now search for four useful warning signs and save the matching lines:

```bash
grep -Ein 'urgent|password|http|attachment' messages/payroll-update.eml | tee evidence/message-indicators.txt
```

### Read the search from left to right

- `grep` searches text.
- `-E` allows several alternatives separated by `|` inside the search pattern.
- `-i` ignores upper-case and lower-case differences.
- `-n` prints the line number of each match.
- `'urgent|password|http|attachment'` means match any of those four terms.
- the outer pipe sends the matches to `tee`.
- `tee` displays the matches and saves them in `evidence/message-indicators.txt`.

Do not open the link or attachment. They are inert training text, but safe investigation practice means inspecting before interacting.

Select **CHECK** when the evidence file contains the message indicators.
