# Active Passice Reconnaissance

Passive reconnaissance lets you gather information
about your target without any kind of direct engagement or connection.

You are watching from afar or checking publicly available information.

---

## Whois

Registrar: Via which registrar was the domain name registered?

Contact info of registrant: Name, organization, address, phone, among other things.
(unless made hidden via a privacy service)
Creation, update, and expiration dates:

- When was the domain name first registered?
- When was it last updated?
- When does it need to be renewed?

Name Server: Which server to ask to resolve the domain name?

--

## Nslookup

Query Domain Name System (_DNS_) servers to obtain information about domain names,
IP addresses, and other _DNS-related_ information.
It is commonly used to troubleshoot network-related issues, perform _DNS lookups_, and gather
information about _DNS records_.

`nslookup -type=mx tryhackme.com` if you want to learn about the email servers and configurations for a particular
domain.

---

## Dig

For more advanced _DNS queries_ and additional functionality, you can use _dig_.

---

## DNSDumpster

_DNSDumpster_ will return the collected _DNS information_ in easy-to-read tables and a graph.
_DNSDumpster_ will also provide any collected information about listening servers
_DNSDumpster_ resolved list of dns servers, the domain names to IP addresses and
even tried to geolocate them.

_MX records_; _DNSDumpster_ will resolve mail exchange servers to
their respective IP addresses and provided more information about the owner and location.
Finally, we can see TXT records. Practically a single query was enough to retrieve all this information.
Good at finding subdomains

---

## SHODAN.IO

_Shodan.io_ tries to connect to every device reachable online
to build a search engine of connected “things” in contrast with a search engine for web pages.
Once it gets a response, it collects all the information related to the service and
saves it in the database to make it searchable.
Consider the saved record of one of tryhackme.com’s servers.

---

## Host

_Host_ is another useful alternative for querying _DNS servers_ for _DNS records_.

---

## ADVANCE DNS SERVICES

Third parties that offer paid services for historical _WHOIS data_.
One example is WHOIS history, which provides a history of _WHOIS data_ and
can come in handy if the domain registrant didn’t use WHOIS privacy when they registered the domain.
https://viewdns.info/
https://threatintelligenceplatform.com/

---

## RECON-NG

Helping with OSINT checkout thm --> https://tryhackme.com/room/redteamrecon

--- 

## ACTIVE reconnaissance

Active reconnaissance requires you to make some kind of contact with your target.

PING -->    wijfiwj

---

## TRACEROUTE

The final tool that ships with Unix-like systems is _traceroute_, or on _MS Windows systems_, _tracert_.
As the name indicates, it traces the route taken by the packets from our system to the target host.
The console output below shows that traceroute provided us with the
routers _(hops)_ connecting us to the target system. It's worth stressing
that some routers don’t respond to the packets sent by traceroute,
and as a result, we don’t see their IP addresses; a * is used to indicate such a case.
_traceroute_ relies on _ICMP_ and using _TTL (time to live)_
where it starts with 1 which makes first router throw exception
that reveals IP-address, than ttl increases by one and same thing happens until final IP is reached

---

## TELNET

wkfpw

NC / NETCAT -->    wfwf


