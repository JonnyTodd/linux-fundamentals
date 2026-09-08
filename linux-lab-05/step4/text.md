# Design the firewall rules

UFW means **Uncomplicated Firewall**. It provides a simpler interface for managing Linux firewall rules.

## Safe remote-administration rule

In a real remote server, enabling a firewall before allowing the required management and service traffic can lock an administrator out. In this lab you will create and inspect genuine rules, but you will **leave UFW inactive**.

## Required rule set

- default incoming traffic: deny;
- default outgoing traffic: allow;
- allow the required web service on `8080/tcp`;
- explicitly deny insecure Telnet traffic on `23/tcp`.

Useful commands:

```bash
ufw status
ufw default deny incoming
ufw default allow outgoing
ufw allow 8080/tcp
ufw deny 23/tcp
ufw show added
```

Save the two default-policy lines followed by the two added rules in:

```text
evidence/firewall-rules.txt
```

One valid route is:

```bash
grep -E '^DEFAULT_(INPUT|OUTPUT)_POLICY' /etc/default/ufw > evidence/firewall-rules.txt
ufw show added | grep '^ufw ' >> evidence/firewall-rules.txt
cat evidence/firewall-rules.txt
```

Do **not** run `ufw enable`.

Select **CHECK** when all four settings are present in the live UFW configuration, the four-line evidence file matches and the firewall remains inactive.
