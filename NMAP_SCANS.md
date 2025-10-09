# Scanning W NMAP

Multiple scans for different purposes against prod env.

```bash
# ===============================================================================
# Ping sweep ICMP and port probes - '-sP' does a ping scan (host discovery only)
nmap -sP munchora.pro
Starting Nmap 7.95 ( https://nmap.org ) at 2025-10-09 18:32 CEST
Nmap scan report for munchora.pro (139.162.157.131)
Host is up (0.024s latency).
rDNS record for 139.162.157.131: 139-162-157-131.ip.linodeusercontent.com
Nmap done: 1 IP address (1 host up) scanned in 0.10 seconds


# ===============================================================================
# Don’t bother ping, just find hosts and ports: nmap -Pn munchora.pro
nmap -Pn munchora.pro
Starting Nmap 7.95 ( https://nmap.org ) at 2025-10-09 18:37 CEST
Nmap scan report for munchora.pro (139.162.157.131)
Host is up (0.030s latency).
rDNS record for 139.162.157.131: 139-162-157-131.ip.linodeusercontent.com
Not shown: 997 filtered tcp ports (no-response)
PORT    STATE SERVICE
22/tcp  open  ssh
80/tcp  open  http
443/tcp open  https

Nmap done: 1 IP address (1 host up) scanned in 6.37 seconds


# ===============================================================================
# Scan only for ports 80 and 443: nmap -p 80,433 munchora.pro
nmap -p 80,433 munchora.pro
Starting Nmap 7.95 ( https://nmap.org ) at 2025-10-09 18:39 CEST
Nmap scan report for munchora.pro (139.162.157.131)
Host is up (0.024s latency).
rDNS record for 139.162.157.131: 139-162-157-131.ip.linodeusercontent.com

PORT    STATE    SERVICE
80/tcp  open     http
433/tcp filtered nnsp

Nmap done: 1 IP address (1 host up) scanned in 1.37 second


# ===============================================================================
# Scan just for UDP port 161: nmap -sU -p 161 munchora.pro
nmap -sU -p 161 munchora.pro
Starting Nmap 7.95 ( https://nmap.org ) at 2025-10-09 18:40 CEST
Nmap scan report for munchora.pro (139.162.157.131)
Host is up (0.024s latency).
rDNS record for 139.162.157.131: 139-162-157-131.ip.linodeusercontent.com

PORT    STATE         SERVICE
161/udp open|filtered snmp

Nmap done: 1 IP address (1 host up) scanned in 0.44 seconds
```
