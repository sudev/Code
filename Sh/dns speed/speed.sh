#!/bin/bash
isp=$(dig +noall +stats 2>&1 | awk '$2~/^SERVER:$/{split($3,dnsip,"#");print dnsip[1]}');
echo $isp; 
m="-------------------------------------------------------------------------------";
s="                                                                               ";
h="+${m:0:25}+${m:0:12}+${m:0:12}+${m:0:12}+";
header=("Domain${s:0:23}" "My ISP${s:0:10}" "Google${s:0:10}" "OpenDNS${s:0:10}");
echo "${h}";
echo "| ${header[0]:0:23} | ${header[1]:0:10} | ${header[2]:0:10} | ${header[3]:0:10} |";
echo "${h}";
for i in "yahoo.com" "identi.ca" "twitter.com"  "brutaldeluxe.us" "google.com" "bbc.co.uk" "athena.nitc.ac.in";
do
  ii="${i}${s:23}";
  echo -n "| ${ii:0:23} |";
  for j in "${isp}"  "8.8.8.8"  "208.67.222.222" "192.168.254.3";
  do
    r="${s:10}$(dig +noall +stats +time=9 @${j} ${i} 2>&1 | awk '$2~/^Query$/{print $4" "$5}')";
    echo -n " ${r:${#r}-10} |";
  done
  echo -ne "\n${h}\n";
done 
