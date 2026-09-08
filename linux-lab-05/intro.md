# Deploy and Secure an Ubuntu Service

Northstar Services has prepared a small internal status server. Before it can be handed to the operations team, it needs a basic administration review.

You will:

1. inspect the Ubuntu system;
2. update the package catalogue and install one small package;
3. identify a running service and its listening port;
4. create safe UFW firewall rules;
5. analyse the service access log;
6. create and verify a compressed administration backup;
7. produce a final audit report.

This is an optional self-study lab. It combines commands from Sessions 1–4 with several new administration tools.

## Important limits

- Do not run `apt upgrade` or `apt full-upgrade`.
- Do not enable UFW in this remote training environment.
- Do not stop the Northstar status service.
- Read command output before moving to the next task.

Aim to complete the core route within **45–55 minutes**.
