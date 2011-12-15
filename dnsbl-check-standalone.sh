#!/bin/sh
#
# dnsbl-check-standalone.sh
#
# By Damon Tajeddini (dta)
# # 10.03.2009
#
MAIL_RCPT=""

DNSBLlist=`grep -v ^# <<!
rfc-ignorant.org
cbl.abuseat.org
dnsbl.ahbl.org
ircbl.ahbl.org
virbl.dnsbl.bit.nl
blackholes.five-ten-sg.com
dnsbl.inps.de
ix.dnsbl.manitu.net
no-more-funn.moensted.dk
combined.njabl.org
dnsbl.njabl.org
dnsbl.sorbs.net
bl.spamcannibal.org
bl.spamcop.net
sbl.spamhaus.org
xbl.spamhaus.org
pbl.spamhaus.org
dnsbl-1.uceprotect.net
# dnsbl-2.uceprotect.net
# dnsbl-3.uceprotect.net
!`

# reverse IP address bytes
convertIP()
{
 set `IFS=".";echo $1`
 echo $4.$3.$2.$1
}

usage()
{
 echo "Usage: $0 [-H &lt;host&gt;|-p]"
 echo " -H IP address to check"
 echo " -p Print list of DNSBLs"
 exit 3
}

# Checks the IP with list of DNSBL servers
check()
{
 for i in $DNSBLlist
 do
 if dig $ip_arpa.$i +short | grep -q "^127.0.0."
 then
 mail -s "** Service Alert: $ip found on $i **" $MAIL_RCPT <<!
 *** DNSBL WARNING ***
 Service: $progname
 Host: `hostname`
 Date/Time: `date`
 Additional Info: DNSBL-Alarm: $ip is listed on $i
!
 fi
 done
 exit
} # check

case $1 in
 -H)
 if [ -z "$2" ]; then
 echo "ip address missing"
 exit
 fi
 ip=$2
 ip_arpa=`convertIP $ip`
 check;;

 -p)
 for i in $DNSBLlist
 do
 echo $i
 done
 exit;;

 --help)
 usage
 exit;;

 *)
 if [ -z "$1" ]; then
 usage
 fi
 echo "unknown command: $1"
 exit;;
esac
