# =============================================
# WE COULD USE GOOGLE
# subdomains for *.kea.dk
# site:*kea.dk
# site:*kea.dk "login"
# site:*kea.dk filetype:env
# =============================================

# =============================================
# subdomains for *.ek.dk
# site:*ek.dk
# site:*ek.dk "login"
# site:*ek.dk filetype:env
# =============================================

require 'net/http'
require 'json'
require 'uri'
require 'openssl'
require 'fileutils'

def fetch_subdomains(domain)
  url = URI("https://crt.sh/?q=%25.#{domain}&output=json")

  puts "fetching subdomains"
  response = Net::HTTP.get(url)
  puts "fetched #{response.length} subdomains"

  begin
    JSON.parse(response)
  rescue JSON::ParserError => e
    abort "Failed to parse JSON from crt.sh: #{e.message}"
  rescue => e
    abort "Network or HTTP error while fetching crt.sh: #{e.message}"
  end
end

def write_raw_json_to_file(domain, results)
  raw_path = "./assets/#{domain}-subs-get-res.json"
  File.open(raw_path, 'w') do |f|
    f.write(JSON.pretty_generate(results))
    puts "Wrote raw JSON to: #{raw_path}"
  rescue => e
    abort "Failed to write raw JSON file: #{e}"
  end
end

def write_subdomain_to_file(domain, results)
  names = results.flat_map do |entry|
    nv = entry['name_value'].to_s
    nv.split("\n").map(&:strip) # name_value can contain multiple hostnames separated by newlines
  end

  cleaned_subdomains = names.reject(&:empty?).map(&:downcase).uniq.sort

  subs_path = "./#{domain}-subdomains.txt"
  File.open(subs_path, 'w') do |f|
    cleaned_subdomains.each { |s| f.puts(s) }
  end

  puts "Wrote #{cleaned_subdomains.size} unique subdomain(s) to: #{subs_path}"
rescue => e
  abort "Failed to write subdomains JSON file: #{e}"
end

def execute(domain)
  results = fetch_subdomains(domain)
  write_raw_json_to_file(domain, results)
  write_subdomain_to_file(domain, results)
end

# =============================================
# subdomains for *.kea.dk by fetching crt.sh
# =============================================

execute('kea.dk')

# =============================================
# subdomains for *.kea.dk by fetching crt.sh
# =============================================

execute('ek.dk')