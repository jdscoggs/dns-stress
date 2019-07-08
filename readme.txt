###############################################
#################### README ###################
###############################################

This is a readme file for the script dns-stress.sh version 1.1.
 
The script simply wraps around the binary queryperf, which is included with the BIND 9.2.1 distribution from www.isc.org.

To use dns-stress.sh you must do the following:
  - have network connection to the DNS server you wish to put under stress.
  - place the target system in the local /etc/hosts file
  - execute the script with 2 variables
        1. first is the number of times the script will run
        2. second is the target system's name

The script runs for 120 seconds, as many time as is specified and appends queryperf output to a file called <systemname>.out.  The input file namedump.txt, is, oddly enough, in the directory called input and contains 202,968 entries.

The files contained in this tar file are as follows:
	dns-stress/dns-stress.sh
	dns-stress/readme
	dns-stress/queryperf
	dns-stress/input/namedump.txt

This is by no means the script to end all scripts.  So, if you have any additions I ask that you either email your mods. to me and I will incorporate them into the script with the appropriate kudos to the author or you can update the script yourself, increment the version number and lastly update the version in VSS.

Thanx to Dan Smith for assisting.

Enjoy!
DanS
