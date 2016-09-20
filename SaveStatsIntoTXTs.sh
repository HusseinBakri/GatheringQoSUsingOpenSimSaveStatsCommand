#!/bin/bash
##################################################################################################################################################
#Author: Hussein Bakri
#Script Title: OpenSim Console command "stats save stats.txt"  --NOT COMPLETE CHECK
#License: GNU GPL v3 License - you are free to distribute, change, enhance and include any of the code of this script in your tools. I only expect #adequate attribution of this work. The attribution should include the title of the script, the author and the site or the document where the #script is taken from.
#Method 3 or C Stats Manager
#This Bash shell script saves statistics of the Stats Manager module into txt files
#It utilizes the OpenSim Console command "stats save stats.txt"
#What this script does is it uses the Linux screen command and issue "stats save stat${filenumber}" every second for 3 minutes (180 seconds)
#
##################################################################################################################################################
echo "Let us begin the retrieval of Stats files from OpenSim server."
echo "...Using the OpenSim Server Console command -stats save statN.txt-"
echo "Retrieval every 1 second for 3 minutes (180 seconds)"

echo

filenumber=0
echo "Creating a screen session for OpenSim server named: OpenSimSession..."
echo
screen -S OpenSimSession -d -m
sleep 3

echo "Launching OpenSim server through the mono framework by usingscreen -S OpenSimSession -X stuff ..."
screen -S OpenSimSession -X stuff 'mono OpenSim.exe'`echo -ne '\015'`

echo "please wait untill it loads completely - time to wait is 5 minutes (300 seconds)...."
#########################################################################################################
sleep 700 			#### change denpending on startup time of the OpenSim world
				#### Example: Cathedral takes 8 minutes and 17 seconds (497 seconds) to load
				#### Give always additional time.
##########################################################################################################

echo "I finished loading OpenSim server in the screen session created previously. Moving on to the next step..."
sleep 3
echo "Please go and launch any avatar mobility script(s)/ Viewers etc..."
sleep 2
read -rsp $'When ready, Press any key in this terminal to continue - terminal should be in focus...\n' -n1 key

echo "Creating a folder called savestats...."
mkdir -p savestats
echo
echo "looping 180 times (each with a second duration) and sending the save stats command - please wait..."


while [ $filenumber -lt 180 ]
do
screen -r OpenSimSession -X stuff $'stats save stat${savestats/filenumber}\n'
sleep 1 #Wait a second.
((filenumber++))
done
echo "I finished the loop (saving every second - stats txt file, you should have 180 stats txt files in your folder...."
echo
echo "Continuing to the Next step"
echo "..."
sleep 4
echo "Now shutting down OpenSim server.... "
echo "Please go and terminate or shutdown any avatar mobility script(s)/ Viewers etc..."
sleep 2
read -rsp $'When ready, Press any key in this terminal to continue - terminal should be in focus...\n' -n1 key


echo "Sending a shutdown to the OpenSim server - it takes time (around 2 minutes)"
screen -r OpenSimSession -X stuff $'shutdown\n'		#sending a shutdown command
#sending a shutdown command 
#########################################################################################################
sleep 60	 		#### time to wait for OpenSim to shutdown – normally should be higher
				#### change denpending on startup time of the OpenSim world
				#### Give always additional time.
##########################################################################################################

echo "Making sure that OpenSim is closed"
OpenSimID=`ps –ef | grep OpenSim |grep ‘mono OpenSim.exe’ | gawk ‘{ print $2 }’`
kill -9 $OpenSimID

echo "Exiting the screen session itself...." 
sleep 2
screen -r OpenSimSession -X stuff $'exit\n' #exiting the session itself (i.e terminating)
echo "Fin"


