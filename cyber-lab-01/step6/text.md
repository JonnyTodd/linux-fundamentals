# Recommend the first actions

Northstar can begin only two actions today. Use the scores in your risk register, then recommend one control for each highest-rated finding.

Create the report header:

```bash
cd ~/cyber-lab1/northstar
cat > evidence/top-priorities.txt <<'EOF'
NORTHSTAR FIRST-ACTION RECOMMENDATION
EOF
```

Now add exactly two priority lines. The order of A and B does not matter:

```text
A | Move the customer export to restricted storage and review access.
B | Remove the plaintext password, rotate it and use managed secret storage.
```

You can use `echo 'text' >> evidence/top-priorities.txt` for each line, then review your work:

```bash
cat evidence/top-priorities.txt
```

## Final judgement

Findings A and B both score 9. A different control might also be defensible in a real audit, but your recommendation must clearly reduce the vulnerability you found.

Select **CHECK** to complete the audit.
