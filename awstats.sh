#!/bin/bash
CONFDIR=/etc/awstats
STATSDIR=/var/www/stats
LOGSDIR=/var/www/logs

domain=$1

# create config file
echo "LogFile=\"$LOGSDIR/$domain.access.log\"
LogFormat=1
SiteDomain=\"$domain\"
DirData=\"$STATSDIR/$domain.awstats\"" > $CONFDIR/awstats.$domain.conf
echo "Config file created: awstats.$domain.conf"

# create data dir and set perms
mkdir -p $STATSDIR/$domain.awstats
chown www-data:www-data $STATSDIR/$domain.awstats
echo "Data dir created: $STATSDIR/$domain.awstats"

# build the db
/usr/lib/cgi-bin/awstats.pl -update -config=$domain
echo "DB created"

echo "Ready to go, visit localhost/awstats/awstats.pl?config=$domain"
