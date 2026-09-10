# Build the risk register

Evidence tells you what is wrong. Risk rating helps decide what should be addressed first.

Read Northstar's agreed likelihood and impact values:

```bash
cd ~/cyber-lab1/northstar
cat reference/risk-method.txt
```

The risk score is:

```text
likelihood × impact
```

Append these six correctly calculated records to the existing register. Copy the block exactly:

```bash
cat >> evidence/risk-register.csv <<'EOF'
A,customer export in public directory,confidentiality,3,3,9,EXTREME
B,plaintext admin password,CIA,3,3,9,EXTREME
C,payroll permissions 666,confidentiality and integrity,2,3,6,HIGH
D,former worker account active,CIA,2,3,6,HIGH
E,backup checksum failed,integrity and availability,2,2,4,MEDIUM
F,four portal errors,availability,2,2,4,MEDIUM
EOF
```

Review the completed register:

```bash
column -s, -t evidence/risk-register.csv
```

Select **CHECK** when the scores and ratings are complete.
