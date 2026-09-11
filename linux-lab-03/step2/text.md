# Step 2 — Audit the payroll file

Before changing a security setting, capture the original state as evidence.

```bash
ls -l data/payroll.csv
```

## Break down the command

- `ls` lists directory entries.
- `-l` requests the **long** format.
- `data/payroll.csv` is the file to inspect.

The long listing includes the file type, permissions, owner, group, size, date and name. The first ten characters are arranged like this:

```text
-rw-rw-rw-
│└─┬┘└─┬┘└─┬┘
│  │   │   └── others
│  │   └────── group
│  └────────── owner
└───────────── file type (- means a regular file)
```

`r` means read, `w` means write and `x` means execute. A dash means that permission is absent. This payroll file is currently readable and writable by everyone.

Now record the exact numeric permissions, owner and group:

```bash
stat -c "%a %U %G" data/payroll.csv > reports/permission-audit.txt
cat reports/permission-audit.txt
```

## Break down the evidence command

| Part | Meaning |
|---|---|
| `stat` | Report detailed information about a file. |
| `-c` | Use the following custom output format. |
| `%a` | Numeric permission mode. |
| `%U` | Owner name. |
| `%G` | Group name. |
| `>` | Send the output into a file, replacing that file if it already exists. |

In plain English: **inspect `payroll.csv`, print only its mode, owner and group, then save that line as the permission audit**.

Use `stat --help` or `man stat` if you want to explore other format codes.

Your report must contain exactly:

```text
666 root root
```

Select **CHECK** when the audit evidence has been saved. Do not secure the file until the original state has passed this check.
