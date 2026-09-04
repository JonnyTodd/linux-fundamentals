# Incident 6 — complete the recovery check

The earlier fixes must remain in place. Complete the final systems check by producing two more evidence files.

## Network evidence

Save a brief summary of the server's network addresses in:

```text
evidence/network-summary.txt
```

The file must include the loopback address `127.0.0.1/8`.

## Service evidence

Retrieve:

```text
http://127.0.0.1:8766/status.txt
```

Save the response in:

```text
evidence/service-status.txt
```

Useful command families include:

```text
ip -brief addr    curl    >    cat
```

Before selecting **CHECK**, verify all six incident outcomes. This final CHECK is cumulative: it tests your evidence and the actual server state.
