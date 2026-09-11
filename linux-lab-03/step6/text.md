# Step 6 — Complete the systems check

The final task collects network and service evidence while preserving the earlier fixes.

## Part A — network evidence

First inspect the machine's addresses and routes:

```bash
ip -brief addr
ip route
```

### Break down the commands

- `ip` displays or changes Linux networking information.
- `-brief` requests a compact, one-line-per-interface display.
- `addr` selects network-address information.
- `route` selects the routing table, which shows where network traffic would be sent.

The `lo` interface is the **loopback** interface. Its IPv4 address is `127.0.0.1/8`, and it lets the machine communicate with services on itself.

Now save the brief address output:

```bash
ip -brief addr > reports/network-summary.txt
cat reports/network-summary.txt
```

In plain English: **request the compact address list, replace the network report with that output, then display the saved report**.

## Part B — service evidence

A harmless local status service is listening at:

```text
http://127.0.0.1:8765/status.txt
```

Retrieve and save its response:

```bash
curl http://127.0.0.1:8765/status.txt > reports/service-status.txt
cat reports/service-status.txt
```

- `curl` transfers data from or to a URL. Here it performs a web request and prints the returned text.
- `127.0.0.1` means this same machine.
- `8765` is the service's TCP port number.
- `/status.txt` is the requested resource.
- `>` saves the response instead of leaving it only on screen.

Useful help:

```bash
ip help
curl --help
```

## Final verification

Before selecting **CHECK**, confirm that:

- `stat -c "%a %U %G" data/payroll.csv` reports `640 root staff`;
- `pgrep -a report-worker` produces no output;
- `reports/storage-usage.txt` contains the current directory comparison;
- `reports/network-summary.txt` includes `127.0.0.1/8`;
- `reports/service-status.txt` says `NORTHSTAR-SERVICE: ONLINE`.

This CHECK is cumulative: changing an earlier correct result will cause it to fail.
