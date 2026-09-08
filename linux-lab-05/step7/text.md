# Complete the administration audit

Produce one final report that brings together evidence from the live system.

Create:

```text
reports/final-audit.txt
```

Append the output of these checks in this order:

1. the installed `tree` package name, version and status;
2. the two UFW default policies and two added rules;
3. the current number of `404` records in the access log;
4. the live service response;
5. the result of verifying the backup checksum.

You may use:

```bash
dpkg-query -W -f='${Package} ${Version} ${Status}\n' tree > reports/final-audit.txt
grep -E '^DEFAULT_(INPUT|OUTPUT)_POLICY' /etc/default/ufw >> reports/final-audit.txt
ufw show added | grep '^ufw ' >> reports/final-audit.txt
grep -c " 404 " logs/web-access.log >> reports/final-audit.txt
curl -fsS http://127.0.0.1:8080/status.txt >> reports/final-audit.txt
sha256sum -c evidence/backup.sha256 >> reports/final-audit.txt
cat reports/final-audit.txt
```

Before selecting **CHECK**, use inspection commands to confirm that:

- UFW is still inactive;
- the service is still running;
- the archive and checksum still agree;
- your final report describes the current system rather than copied answers.

The final CHECK is cumulative.
