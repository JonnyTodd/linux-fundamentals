# The Broken Linux Server

You have taken responsibility for a small Northstar Services Linux server after the previous administrator left.

Six incidents have been reported:

1. A confidential planning document is stored in the wrong place.
2. The security log contains repeated failed login attempts.
3. Payroll data has unsafe ownership and permissions.
4. An unwanted background process is still running.
5. Temporary data is wasting storage.
6. The network and local status service need a final check.

This is still the final practical: you must decide what evidence answers each problem. However, every command used in the lab is explained so that you can understand it rather than copy it blindly.

## Working method

For every incident:

1. **Read** the complete problem before typing.
2. **Inspect** the current state.
3. **Identify** the precise fault and the intended result.
4. **Change** only what is required.
5. **Verify** the result with a second observation.
6. Select **CHECK** when you can explain why the outcome is correct.

## Help is part of Linux

Use the built-in documentation whenever a command is unfamiliar:

```bash
COMMAND --help
man COMMAND
```

Replace `COMMAND` with `find`, `grep`, `chmod` or another command. Inside a manual page, type `/word` to search, `n` for the next result and `q` to quit.

The server is disposable, but work as though it contains real organisational data. Read an exact path before deleting anything, and stop only the process named in the incident.
