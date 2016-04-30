# dnsbl-check

Script that checks if your mail server is in a <a href="http://en.wikipedia.org/wiki/DNSBL">DNSBL</a> (DNS Blackhole List).

From <a href="http://www.heise.de/netze/artikel/Verdrehte-Abfrage-223890.html">heise Netze</a> added with little features thats come from the comments.

# How to use

Download it to the current directory:

	curl -L -o ./dnsbl.sh https://github.com/m-hennecke/dnsbl-check/raw/master/dnsbl-check-standalone.sh
	chmod 755 dnsbl.sh

The script echos found blacklist entries to stdout.

Add it to your crontab to get daily notifications:

	@daily	${PATH_TO_SCRIPT}/dnsbl.sh -H YOUR_IP
