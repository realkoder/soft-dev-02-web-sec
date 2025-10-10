# Remember to add "https://" for subdomains in file

while read url; do
    echo "Scanning: $url"
    gobuster dir -u "$url" \
        -w /usr/share/seclists/Discovery/Web-Content/common-api-endpoints-mazen160.txt \
        -o "results_$(echo $url | sed 's|https\?://||' | tr '/' '_').txt"
done < ek-subdomains.txt
