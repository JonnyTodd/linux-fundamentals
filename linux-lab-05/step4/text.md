# Step 4 - Design the firewall rules safely

A firewall uses rules to decide which network traffic may pass. **UFW** means **Uncomplicated Firewall** and provides a simpler interface to Ubuntu's firewall system.

## Important safety rule

Enabling a firewall on a remote computer before allowing required management traffic can lock the administrator out. You will create and inspect genuine rules, but you will **leave UFW inactive**.

Do not run `ufw enable`.

## Required design

| Traffic | Required decision | Reason |
|---|---|---|
| Unrequested incoming traffic | Deny by default | Reduces unnecessary exposure. |
| Outgoing traffic | Allow by default | Permits normal outbound connections for this exercise. |
| `8080/tcp` | Allow | The Northstar status service needs this port. |
| `23/tcp` | Deny | Telnet is an insecure legacy remote-access protocol. |

## 1. Confirm the starting state

```bash
ufw status
```

It should report:

```text
Status: inactive
```

## 2. Configure the two defaults

```bash
ufw default deny incoming
ufw default allow outgoing
```

`default` sets the fallback decision when no more specific rule matches.

## 3. Add the service rules

```bash
ufw allow 8080/tcp
ufw deny 23/tcp
```

- `allow` permits matching traffic.
- `deny` blocks matching traffic.
- `/tcp` limits the rule to the TCP protocol.

## 4. Inspect what has been added

```bash
ufw show added
```

This displays rules in command form. It does not activate the firewall.

## 5. Create the evidence file

Run these commands in order:

```bash
grep -E '^DEFAULT_(INPUT|OUTPUT)_POLICY' /etc/default/ufw > evidence/firewall-rules.txt
ufw show added | grep '^ufw ' >> evidence/firewall-rules.txt
cat -n evidence/firewall-rules.txt
```

The less familiar symbols mean:

| Part | Meaning |
|---|---|
| `grep -E` | Use an extended search pattern. |
| `^` | Match only at the beginning of a line. |
| `(INPUT|OUTPUT)` | Match either `INPUT` or `OUTPUT`; `|` inside this pattern means OR. |
| `>` | Create or overwrite the evidence file with the two policy lines. |
| `>>` | Append the two UFW rules without erasing the policy lines. |
| `cat -n` | Display the finished file with numbered lines. |

You should have exactly four lines: two defaults followed by the two added rules.

## Verify the safety condition

```bash
ufw status
```

It must still say `Status: inactive`.

## If CHECK does not pass

- Confirm that `cat -n evidence/firewall-rules.txt` shows four lines in the required order.
- Confirm the file uses `>` once and `>>` for the second command.
- Run `ufw show added` and compare it with the final two evidence lines.
- Do not solve a problem by enabling UFW.

Use `ufw --help`, `grep --help` or `man grep` if required. Select **CHECK** only while UFW remains inactive.
