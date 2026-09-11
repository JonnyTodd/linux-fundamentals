# Step 3 - Investigate the local service

A **service** is a program that runs to provide a function. The Northstar service is a harmless Python web server available only through the local address `127.0.0.1` on TCP port `8080`.

Do not stop it. Your task is to prove that its process, port and response agree with the supplied configuration.

## 1. Read the intended configuration

```bash
cat config/northstar-web.conf
```

Look for:

```text
listen_address=127.0.0.1
listen_port=8080
```

`127.0.0.1` is the loopback address: it refers back to this same machine.

## 2. Find the running process

```bash
pgrep -af "http.server 8080"
```

| Part | Meaning |
|---|---|
| `pgrep` | Search the current process list. |
| `-a` | Show the full command line beside each matching process identifier. |
| `-f` | Match against the full command line rather than only the short process name. |
| `"http.server 8080"` | The text pattern to locate. |

The number at the start of the line is the process identifier or **PID**. Do not use `kill` on it.

## 3. Inspect listening TCP ports

```bash
ss -ltnp
```

`ss` displays socket information. Its combined options mean:

| Option | Meaning |
|---|---|
| `-l` | Show listening sockets. |
| `-t` | Show TCP sockets. |
| `-n` | Show numeric addresses and port numbers instead of translating them into names. |
| `-p` | Show process information when permissions allow. |

Filter the longer output and save the matching port evidence:

```bash
ss -ltnp | grep ':8080' | tee evidence/listening-port.txt
```

- The first pipe sends `ss` output to `grep`.
- `grep ':8080'` keeps the line containing port 8080.
- The second pipe sends that line to `tee`, which displays and saves it.

## 4. Ask the service for its status page

```bash
curl -fsS http://127.0.0.1:8080/status.txt | tee evidence/service-response.txt
```

| Part | Meaning |
|---|---|
| `curl` | Transfer data using a URL. Here it makes a local HTTP request. |
| `-f` | Return an error when the server reports an HTTP failure. |
| `-s` | Hide the normal progress display. |
| `-S` | Still show an error message if silent mode encounters a problem. |
| `http://127.0.0.1:8080/status.txt` | Request `status.txt` from port 8080 on this machine. |

The expected response is:

```text
NORTHSTAR-ADMIN: READY
```

## If CHECK does not pass

Run:

```bash
pwd
cat evidence/listening-port.txt
cat evidence/service-response.txt
pgrep -af "http.server 8080"
```

The port evidence must contain `:8080`, the response file must contain the exact READY message and the service must still be running.

Use `ss --help`, `curl --help` or the relevant manual pages if needed. Select **CHECK** when all three sources agree.
