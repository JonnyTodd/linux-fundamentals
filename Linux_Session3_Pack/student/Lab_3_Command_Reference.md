# Lab 3 Command Reference

| Command | Purpose | Example |
|---|---|---|
| `whoami` | show the current user | `whoami` |
| `id` | show user and group IDs | `id` |
| `groups` | show group memberships | `groups` |
| `ls -l` | show permissions, owner and group | `ls -l payroll.csv` |
| `stat -c` | print selected file details | `stat -c "%a %U %G" payroll.csv` |
| `chmod` | change file permissions | `chmod 640 payroll.csv` |
| `chown` | change owner and group | `chown root:staff payroll.csv` |
| `ps aux` | list running processes | `ps aux` |
| `pgrep -a` | find a named process and show its command | `pgrep -a report-worker` |
| `kill` | send a termination signal to a PID | `kill 1234` |
| `df -h` | show filesystem capacity in readable units | `df -h /` |
| `du -sh` | summarise file/directory usage | `du -sh archive` |
| `ip -brief addr` | show a short address summary | `ip -brief addr` |
| `ip route` | show the routing table | `ip route` |
| `curl` | retrieve data from a URL | `curl http://127.0.0.1:8765/status.txt` |

## Permission values

```text
read = 4     write = 2     execute = 1

7 = rwx     6 = rw-       5 = r-x
4 = r--     0 = ---
```

Example: `640` means owner `rw-`, group `r--`, others `---`.
