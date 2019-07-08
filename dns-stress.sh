#!/sbin/sh
# A script wrapped around ISC's BIND 9.2.1 queryperf. 
#    Written by Dan Scoggins
# Version 1.0 - 11/15/2002
#
# Usage: ./dns-stress.sh <number of times script will run> <systemname>
# 
# Note: system name must be in the /etc/hosts file
#       output is written to <systemname>.out

SYSTEM=$2
WARNINGMSG1="Please specify a system to test."
WARNINGMSG2="System not in /etc/hosts file."
#
if [ -f /usr/local/dns-stress/queryperf ]; then

	cd /usr/local/dns-stress
   else
	cat readme
	exit
fi
#
if [ "x$2" != "x" ]; then 
  /usr/xpg4/bin/grep -q "$2" /etc/hosts
  test=$?
    if [ $test -eq "1" ] 
    then
	echo $WARNINGMSG2
		cat ./readme
	exit
    else 
	test -f $SYSTEM.out.2 && mv $SYSTEM.out.2 $SYSTEM.out.3
	test -f $SYSTEM.out.1 && mv $SYSTEM.out.1 $SYSTEM.out.2
	test -f $SYSTEM.out.0 && mv $SYSTEM.out.0 $SYSTEM.out.1
	cp $SYSTEM.out   $SYSTEM.out.0
	cat /dev/null > $SYSTEM.out
    fi
else
	echo $WARNINGMSG1
		cat ./readme
	exit
fi
#
if [ "$1" -gt "0" ]; then 
		num=$1 
	else
		num=10 
fi 
#
while [ "$num" -gt "0" ]; do 
date >> $SYSTEM.out
#./queryperf -d input/namedump.txt -s $SYSTEM -q 900 -l 1200 | grep -v "Query timed out" >> $SYSTEM.out
./queryperf -d input/namedump.txt -s $SYSTEM -q 900 | grep -v "Query timed out" >> $SYSTEM.out
	echo $num 
	num=`expr $num - 1` 
done
