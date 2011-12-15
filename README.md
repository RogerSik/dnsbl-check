Script that check if it your mail server in a <a href="http://en.wikipedia.org/wiki/DNSBL">DNSBL</a> (DNS Blackhole List).

From <a href="http://www.heise.de/netze/artikel/Verdrehte-Abfrage-223890.html">heise Netze</a> added with little features thats come from the comments.

<h1>How to use</h1>
Download it
    curl -s http://github.com/RogerSik/dnsbl-check/raw/master/dnsbl-check-standalone > /usr/local/bin/dnsbl-check-standalone
    chmod 755 /usr/local/bin/dnsbl-check-standalone

Writte in the file your postmaster.

Add it to your crontab to get daily notifications.
    @daily root ( /usr/local/bin/dnsbl-check-standalone -H YOUR_IP)
