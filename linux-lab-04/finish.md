# Server recovery complete

You have resolved all six incidents and left evidence that the final state is correct.

You have demonstrated that you can:

- navigate and inspect an unfamiliar Linux filesystem;
- locate a file using `find`;
- search and count records with `grep`;
- redirect command output into evidence files;
- correct ownership and permissions;
- identify and stop a named process;
- investigate directory storage use;
- inspect network information and test a local service;
- verify a system after making changes.

The most important habit is not a particular command. It is the recovery cycle:

> **Inspect → identify → change → verify**

That method scales from this small training server to much larger Linux systems.

## When you meet a new Linux command

1. Separate the command from its options and arguments.
2. Use `COMMAND --help` or `man COMMAND`.
3. Translate the complete line into plain English.
4. Decide whether it only reads information or changes the system.
5. Inspect the result and retain evidence where appropriate.

Being able to explain a command is more valuable than being able to paste it.
