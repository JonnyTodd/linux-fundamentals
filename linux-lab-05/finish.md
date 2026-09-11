# Linux Lab 5 complete

You have completed a realistic, tightly controlled Ubuntu administration workflow.

You can now explain how to:

- inspect an unfamiliar Ubuntu machine before making changes;
- distinguish `apt update`, `apt install` and `apt upgrade`;
- install and verify a single package;
- identify a running process and listening TCP port;
- use `curl` to check a local web service;
- create and inspect UFW policies without activating the firewall;
- use pipelines, `>`, `>>`, `grep`, `awk`, `sort` and `uniq` to produce evidence;
- create and inspect a compressed `tar.gz` archive;
- generate and check a SHA-256 fingerprint;
- build a final report from fresh system evidence.

## The administration habit to retain

```text
Inspect -> plan -> change -> verify -> record
```

The commands matter, but the workflow matters more. A responsible administrator understands the intended result, limits the scope of a change and independently verifies what happened.

## Important final reminder

This was a disposable, authorised training environment. Do not apply firewall, package or process-management commands to a production system without permission, a change plan and a recovery route.

If you have time remaining, return to any step and use `--help` or `man` to investigate one option you did not previously understand.
