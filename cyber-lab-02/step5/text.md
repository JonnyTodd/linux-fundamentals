# Make an incident decision

Read the decision guide:

```bash
cd ~/cyber-lab2/northstar-incident
cat reference/decision-guide.txt
```

Your combined evidence shows more than one isolated alert:

- the message requested a password and supplied a script;
- five failed logins preceded a successful login to the former worker's account; and
- the finance workstation then ran the named script and downloaded another one.

Create the following assessment exactly:

```bash
cat > evidence/incident-assessment.txt <<'EOF'
DECISION: INCIDENT
CONFIDENCE: HIGH
ACCOUNT: r.singh
HOST: ns-fin-07
SOURCE_IP: 198.51.100.24
REASON: Successful login followed the phishing message and unauthorised script execution.
EOF
```

### How the command works

- `>` creates a new file or replaces its previous contents.
- `<<'EOF'` starts a block of text supplied to `cat`.
- the final `EOF` ends the block and must appear alone.

`HIGH` confidence does not mean absolute certainty. It means several independent pieces of evidence support the same explanation.

Select **CHECK** when the assessment is complete.
