# Lab 3 complete

You have corrected access to confidential data and inspected a running Linux system. More importantly, you used a repeatable method: inspect the original state, make one controlled change and verify the result.

## Commands used

```text
whoami              show the current user
id                  show user and group identities
groups              show group memberships
ls -l               show detailed file information
stat                report exact file information
chmod               change file permissions
chown               change owner and group
ps aux              list running processes
pgrep -a             find a process by name
kill                 send a termination signal
df -h                show filesystem space
du -sh               summarise directory space
ip -brief addr       show network addresses
ip route             show routes
curl                 retrieve data from a URL
```

## Reading future commands

When you meet an unfamiliar command:

1. identify the command, options and arguments;
2. use `COMMAND --help` or `man COMMAND`;
3. translate the line into plain English;
4. predict what it will change;
5. inspect the result afterwards.

In Session 4, you will diagnose a broken Linux server. The task remains a challenge, but command explanations are available so that you can make informed choices rather than copy unexplained recipes.
