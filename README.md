# Elective Security for Web Developers

## CVE vs CWE

### CVE - Common Vulnerabilities and Exposures

- Definition: Public identifier for known cybersecurity vulnerabilities.
- Format: CVE-YYYY-NNNNN (year + unique number).
- Purpose: Standard way to track, share, and reference vulnerabilities across tools and databases.
- Authority: Managed by MITRE, used globally.
- Usage: Security teams use CVEs to patch, monitor, and mitigate risks quickly.
- Severity: Often paired with CVSS scores for impact rating.

---

### CWE Common Weakness Enumeration

- It’s a catalog of software and hardware weaknesses (like insecure coding patterns, design flaws, and
  misconfigurations).
- Managed by MITRE, used worldwide.
- Each weakness has a unique CWE-ID (e.g., CWE-89: SQL Injection).
- Helps developers, testers, and security teams:
    - Classify vulnerabilities (root causes, not just exploits).
    - Prioritize fixes.
    - Map to CVEs (CWE = weakness, CVE = actual instance in a product).

---

### Key difference

**_CWE_** → describes the type of flaw (general category).

**_CVE_** → documents a specific vulnerability in a product/version.

---

<br>

## ChatGPT on Mediator, Interpreter and Translator

### Mediator 🕹

_ComputerScience_: A design pattern/component that manages communication between modules so they don’t talk to each
other directly.

_Cybersecurity_: Can be a security control/proxy (e.g., WAF, message broker) that regulates interactions to reduce
attack surface.

### Interpreter 📜

CS: Executes code line-by-line without compiling to machine code first (e.g., Python interpreter).

Cybersecurity: A target for injection attacks (e.g., SQL interpreter, command interpreter in shells).

### Translator 🌐

_ComputerScience_: Converts code/data from one representation to another (e.g., compiler translates source code →
machine code, protocol translators).

_Cybersecurity_: May introduce parsing/format-conversion vulnerabilities (e.g., encoding issues, file format exploits).

---

<br>

## TOOLS ⚒️

### ZAP Proxy (by OWASP)

free, open-source web app security scanner.

Acts as a proxy between browser & app.

Lets you intercept, inspect, modify HTTP(S).

Supports scanning, fuzzing, automation.

A free alternative to _Burp Suite_.

---

### Linux Kali 🐉

A Debian-based Linux distro for penetration testing & security auditing.

Preloaded with hacking, forensics, and vulnerability assessment tools.

---

### VMware 💻

Virtualization software to run multiple OSes on one machine.

Used for testing, isolation, and simulating networks safely.

---

### Burp Suite 🕵️

A web security testing toolkit with proxy, scanner, and exploit tools.

Popular for finding web app flaws like XSS, SQLi.

---

### Postman 📬

An API client for building, testing, and debugging APIs.

Automates requests and helps validate backend functionality.

---

<br>

## LINKS

[Am I allowed perform security tests my own servers?](https://www.linode.com/community/questions/24329/am-i-allowed-perform-security-tests-my-own-servers)

[The Transport Layer Security (TLS) Protocol](https://datatracker.ietf.org/doc/html/rfc5246)
