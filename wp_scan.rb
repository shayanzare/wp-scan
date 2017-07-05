#!/usr/bin/ruby

require "net/http"
require "colorize"
require "uri"

puts """

 █     █░ ██▓███    ██████  ▄████▄   ▄▄▄       ███▄    █ 
▓█░ █ ░█░▓██░  ██▒▒██    ▒ ▒██▀ ▀█  ▒████▄     ██ ▀█   █ 
▒█░ █ ░█ ▓██░ ██▓▒░ ▓██▄   ▒▓█    ▄ ▒██  ▀█▄  ▓██  ▀█ ██▒
░█░ █ ░█ ▒██▄█▓▒ ▒  ▒   ██▒▒▓▓▄ ▄██▒░██▄▄▄▄██ ▓██▒  ▐▌██▒
░░██▒██▓ ▒██▒ ░  ░▒██████▒▒▒ ▓███▀ ░ ▓█   ▓██▒▒██░   ▓██░
░ ▓░▒ ▒  ▒▓▒░ ░  ░▒ ▒▓▒ ▒ ░░ ░▒ ▒  ░ ▒▒   ▓▒█░░ ▒░   ▒ ▒ 
  ▒ ░ ░  ░▒ ░     ░ ░▒  ░ ░  ░  ▒     ▒   ▒▒ ░░ ░░   ░ ▒░
  ░   ░  ░░       ░  ░  ░  ░          ░   ▒      ░   ░ ░ 
    ░                   ░  ░ ░            ░  ░         ░ 
                           ░                             


                  Coded By ViRuS007

                   CyberSoldiersST

"""

print "[*] Enter WP Website : ".yellow
host = gets.chomp

puts "[*] Start Scanning ...\n".blue
#create file for outputs
output = File.open("output.txt", "a+")

count = 0

File.open("wp_vuln_url.txt", "r+") do |file|
    while line = file.gets
    	count2 += 1
        url = host + line
        uri = URI.parse(URI.encode(url.strip))
        puts "[+][#{count2}] Scanning : #{url}".green
        # encoded_url = URI.encode(url)
        res = Net::HTTP.get_response(uri)
        
        if res.code == "200"
            puts "\n[+][#{count2}] #{url} is Vulnerable!\n".yellow
            output.puts("[+] #{url} is Vulnerable!")
        end
    end
end