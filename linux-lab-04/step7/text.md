# Incident 6 — complete the recovery check

The earlier fixes must remain in place. Complete the final systems check by producing two more evidence files.

## Part A — network evidence

Inspect the compact address summary:

```bash
ip -brief addr
```

- `ip` displays or changes networking information.
- `-brief` requests a compact, one-line-per-interface format.
- `addr` selects address information.

The `lo` interface is the loopback interface. `127.0.0.1/8` means this machine can communicate with services running on itself.

Save and verify the output:

```bash
ip -brief addr > evidence/network-summary.txt
cat evidence/network-summary.txt
```

## Part B — local service evidence

The service URL is:

```text
http://127.0.0.1:8766/status.txt
```

Retrieve and save it:

```bash
curl http://127.0.0.1:8766/status.txt > evidence/service-status.txt
cat evidence/service-status.txt
```

- `curl` transfers data using a URL. Here it makes a local web request and prints the response.
- `127.0.0.1` selects this machine.
- `8766` is the TCP port used by the prepared service.
- `/status.txt` is the requested resource.
- `>` saves the returned text as evidence.

The service evidence should say:

```text
NORTHSTAR-RECOVERY: READY
```

Useful help:

```bash
ip help
curl --help
```

## Cumulative verification

Before selecting **CHECK**, prove all six outcomes:

1. `find . -name "quarterly-plan.txt"` returns only the secure copy.
2. Both failed-login evidence files contain the correct complete lines and count.
3. `stat -c "%a %U %G" data/payroll.csv` reports `640 root staff`.
4. `pgrep -a backup-loop` produces no output.
5. The temporary cache is absent, the monthly backup remains and the storage evidence is current.
6. The network evidence contains `127.0.0.1/8` and the service evidence contains the exact readiness message.

This final CHECK tests the evidence **and** the actual server state. If it fails, inspect each outcome in order rather than repeating every command.
