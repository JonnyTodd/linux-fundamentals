# Recommend the first response

Northstar needs actions that protect the organisation while preserving evidence.

Create `evidence/response-plan.txt` containing these five lines:

```text
PRESERVE: Keep the message, logs and process snapshot unchanged.
CONTAIN_ACCOUNT: Disable r.singh and revoke active sessions.
CONTAIN_HOST: Isolate ns-fin-07 from the network.
RECOVER: Reset credentials and restore the host from a trusted state.
ESCALATE: Notify the incident lead and system owner.
```

You can use a here document, as in the previous step, or use `echo 'text' >> evidence/response-plan.txt` for each line.

Before selecting **CHECK**, review your result:

```bash
cat evidence/response-plan.txt
```

### Why these actions differ

- **Preserve** keeps evidence reliable for review.
- **Contain** limits further access or spread.
- **Recover** returns the service and device to a trusted condition.
- **Escalate** brings in people with authority to coordinate the response.

Do not attempt to contact the fictional address, visit the URL or run the scripts. The investigation ends inside the prepared environment.

Select **CHECK** to complete the case.
