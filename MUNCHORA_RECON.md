# Recon of Munchora

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

