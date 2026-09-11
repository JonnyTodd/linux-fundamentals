# Step 7 - Complete the administration audit

The final report must describe the **current live system**. Do not type remembered answers: generate each line from a fresh command.

Create:

```text
reports/final-audit.txt
```

## Understand the redirections first

- `>` creates or overwrites a file.
- `>>` appends output to the end of an existing file.

The first command below uses `>` deliberately. Every later command uses `>>` so the earlier evidence is retained.

## 1. Start with current package evidence

```bash
dpkg-query -W -f='${Package} ${Version} ${Status}\n' tree > reports/final-audit.txt
```

This recreates the installed package name, version and status. It starts a fresh final report.

## 2. Append the firewall design

```bash
grep -E '^DEFAULT_(INPUT|OUTPUT)_POLICY' /etc/default/ufw >> reports/final-audit.txt
ufw show added | grep '^ufw ' >> reports/final-audit.txt
```

The first command appends the two default-policy lines. The second appends the two rules you added. UFW still remains inactive.

## 3. Append the current 404 count

```bash
grep -c ' 404 ' logs/web-access.log >> reports/final-audit.txt
```

This performs a fresh count from the source log rather than copying the earlier report.

## 4. Append the live service response

```bash
curl -fsS http://127.0.0.1:8080/status.txt >> reports/final-audit.txt
```

This proves that the local service still responds at the time the audit is created.

## 5. Append the backup verification result

```bash
sha256sum -c evidence/backup.sha256 >> reports/final-audit.txt
```

This adds the current `OK` or `FAILED` result rather than merely copying the recorded fingerprint.

## 6. Inspect the finished report

```bash
cat -n reports/final-audit.txt
```

`cat -n` adds temporary display line numbers; it does not alter the file. A correct report normally has eight lines:

1. package evidence;
2. incoming default policy;
3. outgoing default policy;
4. allow rule for `8080/tcp`;
5. deny rule for `23/tcp`;
6. the current 404 count;
7. `NORTHSTAR-ADMIN: READY`;
8. the backup checksum result ending `OK`.

## 7. Perform final independent checks

```bash
ufw status
pgrep -af "http.server 8080"
curl -fsS http://127.0.0.1:8080/status.txt
sha256sum -c evidence/backup.sha256
```

Confirm that:

- UFW is still inactive;
- the service is still running;
- the service displays the READY message;
- the archive checksum still reports OK.

## If the final CHECK does not pass

1. Run `cat -n reports/final-audit.txt`.
2. Compare all eight lines with the required order above.
3. Recreate the report from the first `dpkg-query` command if a line is missing, duplicated or out of order.
4. Revisit the earlier stage if its live check now fails.
5. Do not edit the report by guessing what the checker wants; generate it from the current commands.

Select **CHECK** when you can explain where every line came from.
