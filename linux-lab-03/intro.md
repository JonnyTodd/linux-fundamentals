# Linux Fundamentals — Lab 3: Access and System Checks

Northstar Services has asked you to perform a basic health check on a Linux server.

Four problems have been reported:

- a confidential payroll file has unsafe ownership and permissions;
- an unwanted report process is still running;
- an old archive may be wasting storage;
- a local status service needs to be checked.

## By the end of the lab you will be able to

- identify the current user and group memberships;
- interpret Linux file permissions;
- change a file's owner, group and access permissions;
- find and stop a running process safely;
- compare filesystem and directory storage use;
- inspect network addresses and retrieve data with `curl`.

## How this lab teaches new commands

When a command appears for the first time, the lab will:

1. identify the command;
2. explain its options and arguments;
3. translate the whole line into plain English;
4. ask you to inspect the result;
5. show you how to verify the change.

Do not copy a long command without reading its parts.

## Getting help in Linux

Replace `COMMAND` with the command you want to investigate:

```bash
COMMAND --help
man COMMAND
```

`--help` normally gives a short summary. `man` opens the fuller manual page when it is installed. Inside a manual page, type `/word` to search, `n` for the next match and `q` to quit.

## Important

This Killercoda machine gives you administrative access. On a normal organisation's server, changing ownership or stopping another user's process would usually require authorisation and `sudo`.

Use this working cycle throughout the lab:

> **Inspect → identify → change one thing → verify**

Select **START** when you are ready.
