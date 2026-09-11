# Linux Lab 5 - Deploy and Secure an Ubuntu Service

Welcome to the independent take-away lab.

Northstar Services has prepared a small internal status server. Before it can be handed to the operations team, it needs a basic administration review.

You will work through seven guided stages:

1. inspect the Ubuntu system;
2. update the package catalogue and install one small package;
3. identify a running service and its listening port;
4. create safe UFW firewall rules while leaving the firewall inactive;
5. analyse a prepared access log;
6. create and verify a compressed backup;
7. produce a final administration audit.

## How to work through the lab

For each stage:

1. **Read** what the task is trying to achieve.
2. **Predict** what a command should do.
3. **Run** one command or command block at a time.
4. **Inspect** the output rather than assuming it worked.
5. **Verify** the result with a separate command.
6. Select **CHECK**.

Every new command is explained when it first appears. You do not need to memorise all the syntax.

## Getting help without leaving the terminal

Most commands provide built-in help:

```bash
COMMAND --help
man COMMAND
```

Replace `COMMAND` with the command you want to investigate, for example:

```bash
ss --help
man tar
```

Inside a manual page:

- use the arrow keys or Page Up/Page Down to move;
- type `/word` to search for a word;
- press `n` for the next matching result;
- press `q` to quit.

Some small Killercoda environments may not include every manual page. Use `--help` when `man` is unavailable.

## Important safety limits

- Do **not** run `apt upgrade` or `apt full-upgrade`.
- Do **not** run `ufw enable`; the firewall must remain inactive.
- Do **not** stop or kill the Northstar status service.
- Work only inside `~/linux-lab5/northstar-admin` unless the instructions name a system file to inspect.
- Remember that `>` overwrites a file. Use it only with the exact evidence and report paths supplied.

This lab is designed for one disposable Killercoda session and should take approximately **45-55 minutes**. Work is not expected to survive after the environment closes.

Select **START** when you are ready.
