# Recommend the first actions

Northstar can begin only two actions today. Use the scores in your risk register, then recommend one control for each highest-rated finding.

Create the report header:

```bash
cd ~/cyber-lab1/northstar
cat > evidence/top-priorities.txt <<'EOF'
NORTHSTAR FIRST-ACTION RECOMMENDATION
EOF
```

The single `>` creates the file or replaces its existing contents. This is appropriate for the heading because you are starting a fresh report.

Now add exactly two priority lines. The order of A and B does not matter:

```text
A | Move the customer export to restricted storage and review access.
B | Remove the plaintext password, rotate it and use managed secret storage.
```

You can use `echo 'text' >> evidence/top-priorities.txt` for each line, then review your work:

```bash
cat evidence/top-priorities.txt
```

- `echo 'text'` produces the text between the quotation marks.
- `>>` appends that text without removing the heading already in the file.
- `cat` displays the completed report so you can check it before selecting **CHECK**.

Be careful: `>` replaces existing contents, while `>>` adds to them.

## Final judgement

Findings A and B both score 9. A different control might also be defensible in a real audit, but your recommendation must clearly reduce the vulnerability you found.

Select **CHECK** to complete the audit.
