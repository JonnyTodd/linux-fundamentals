# Session 3 — Access and System Checks

**Duration:** 90 minutes  
**Practical platform:** Killercoda / Ubuntu  
**Prior learning:** navigation, file management, text searching and redirection

## Learning outcomes

By the end, students should be able to:

1. use `whoami`, `id` and `groups` to inspect an account;
2. interpret owner, group and other permissions in `ls -l`;
3. apply `chown` and numeric `chmod` to a confidential file;
4. find and stop a named process;
5. distinguish filesystem capacity (`df`) from directory usage (`du`);
6. inspect network addresses and retrieve a local resource using `curl`.

## Suggested delivery

| Time | Activity |
|---|---|
| 0–8 | Retrieval starter from Session 2: `head`, `tail`, `grep`, `wc -l`, `>` and `>>` |
| 8–15 | Introduce Linux users and groups with `whoami`, `id` and `groups` |
| 15–28 | Decode `ls -l`; teach owner/group/others and `r`, `w`, `x` |
| 28–36 | Build numeric permissions from 4, 2 and 1; model `chmod 640` |
| 36–40 | Explain ownership, `chown`, administrative access and `sudo` |
| 40–45 | Introduce processes: `ps aux`, `pgrep -a` and `kill` |
| 45–49 | Contrast `df -h` with `du -sh`; preview `ip` and `curl` |
| 49–82 | Students complete Killercoda Lab 3 |
| 82–87 | Command-map review and discuss the evidence collected |
| 87–90 | Five-question exit check and preview the Session 4 challenge |

## Demonstration sequence

Use a disposable practice file and a harmless `sleep` process. Ask students to predict each result:

```bash
whoami
id
groups
touch practice.txt
ls -l practice.txt
chmod 640 practice.txt
ls -l practice.txt
sleep 300 &
pgrep -a sleep
kill PID
df -h /
du -sh .
ip -brief addr
curl http://127.0.0.1:8765/status.txt
```

Replace `PID` with the actual process ID. Do not demonstrate `chown` on a real college file. In Killercoda, students already have administrative access; on a managed system these actions would require authorisation.

## Support prompts during the lab

Before supplying a command, ask:

1. Are you answering a question about identity, access, a process, storage or the network?
2. Where are you? Use `pwd`.
3. What is the exact file or process name?
4. What does the current output prove?
5. How will you check the change safely?

## Likely misconceptions

- The first character in `-rw-r-----` describes the file type; the next nine are permissions.
- `chmod 640` is not a decimal number. Each digit is a sum of read `4`, write `2` and execute `1`.
- `df` reports filesystem capacity; `du` reports the space used by files/directories.
- `kill` needs a PID, not normally a process name.
- `127.0.0.1` refers to the current machine itself.

## Stretch questions

- Why is `666` unsuitable for a confidential payroll file?
- Why might a group be better than giving several users individual copies?
- What should you check before terminating an unfamiliar process?
- Why can `df` and `du` appear to report different kinds of figures?
- Why is a successful `curl` response useful evidence that a service is available?

