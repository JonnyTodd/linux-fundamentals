# Step 6 — Complete the systems check

The final task gives you the required evidence, but not the complete command sequence.

## Network evidence

Inspect the machine's network addresses and routes using:

```text
ip -brief addr
ip route
```

Save the output of `ip -brief addr` as:

```text
reports/network-summary.txt
```

## Service evidence

A local status service is listening at:

```text
http://127.0.0.1:8765/status.txt
```

Use `curl` to retrieve it, then save the response as:

```text
reports/service-status.txt
```

Before selecting **CHECK**, confirm that:

- the payroll file is still owned by `root:staff` with permission `640`;
- `report-worker` is no longer running;
- the storage report exists;
- the network report includes the loopback address `127.0.0.1`;
- the service report says `NORTHSTAR-SERVICE: ONLINE`.
