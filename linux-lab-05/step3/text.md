# Investigate the local service

The configuration file states that the Northstar status service should listen on `127.0.0.1:8080`.

Read it first:

```bash
cat config/northstar-web.conf
```

## Your task

1. Find the running Python HTTP service.
2. prove that TCP port `8080` is listening;
3. retrieve the status response;
4. save the port evidence in `evidence/listening-port.txt`;
5. save the response in `evidence/service-response.txt`.

Useful commands:

```bash
pgrep -af "http.server 8080"
ss -ltnp
ss -ltnp | grep ':8080'
curl -fsS http://127.0.0.1:8080/status.txt
```

Use `>` to save the two required pieces of evidence. Do not stop the service.

Select **CHECK** when both evidence files prove the current live state.
