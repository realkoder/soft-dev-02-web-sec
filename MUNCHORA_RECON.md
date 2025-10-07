# Recon of Munchora

**Preperations**

For local testing of Munchora (don’t use production — it has strict rate limits),
enter the `soft-dev-02-databases project`,
then enter `soft-dev-02-databases` project and start it by running `make dev`,
then find real machines local IP by `ipconfig getifaddr en0`
and now use that local IP for recon and other stuff from _Kali machine_.

```bash
# Find local machine IP which is the victim IP
ipconfig getifaddr en0
```

Happy xploit!

## Domain / OSINT reconnaissance

### Google search

Search for sensitive pages, config files, or credentials accidentally exposed:

```text
site:munchora.pro "login"
site:munchora.pro filetype:env
```

### Subdomain enumeration

Tools: _sublist3r_, _amass_, _assetfinder_

Example:

```bash
amass enum -d munchora.pro
```

---

<br>

### Gobuster directory and endpoint brute forcing

**Network Binding for Local Development**

_To make it work where Rails server is running locally with mac but accessible for VMWare Kali machine:_

Web servers often default to 127.0.0.1 (localhost-only binding),
blocking external access from VMs or other machines.

Use -b 0.0.0.0 to bind to all network interfaces, making the app accessible via machine's IP address.
This allows security tools in VMs to scan locally hosted applications during development and testing.
Fix by running rails server this way: `bin/rails server -b 0.0.0.0`

```
gobuster dir -u http://192.168.18.12:3000/api/v1 -w /usr/share/seclists/Discovery/Web-Content/common-api-endpoints-mazen160.txt
```

![Gobuster Brute Forcing Endpoints](assets/gobuster-endpoint-brute-force-api-v1.png)

---

<br>

### DNS recon

_dig_, _nslookup_, host to check A/AAAA, MX, TXT, and CNAME records.

Detect third-party services, email providers, or misconfigured domains.

### WHOIS / SSL info

_WHOIS_ for ownership and registrar info.

Check _SSL certs_ with:

```bash
nmap --script ssl-cert -p 443 munchora.pro
```

---

## Network & port scanning (nmap)

Goal: Discover open ports, services, and OS info on your server.

### Nmap workflow

**_nmap OS detection_**

```bash
sudo nmap -O -p1-100 munchora.pro
[sudo] password for alex: 
Starting Nmap 7.94SVN ( https://nmap.org ) at 2025-09-25 13:49 CEST
Nmap scan report for munchora.pro (139.162.157.131)
Host is up (0.026s latency).
rDNS record for 139.162.157.131: 139-162-157-131.ip.linodeusercontent.com
Not shown: 98 filtered tcp ports (no-response)
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
OS fingerprint not ideal because: Missing a closed TCP port so results incomplete
No OS matches for host

OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 6.01 seconds
```

