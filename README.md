# GatheringQoSUsingOpenSimSaveStatsCommand
OpenSim Console command "stats save stats.txt

Author
-----
Hussein Bakri

Program Name
-----------
GatheringQoSUsingOpenSimSaveStatsCommand 1.0

License
-------
This program is licensed under GNU GPL v3 License - you are free to distribute, change, enhance and include any of the code of this application in your tools.
I only expect adequate attribution of this work. The attribution should include the title of the program, the author and the site or the document where the program is taken from.

Description
-----------
[Not complete]
This Bash shell script saves statistics of the Stats Manager module into txt files
It utilizes the OpenSim Console command "stats save stats.txt"
What this script does is it uses the Linux screen command and issue "stats save stat${filenumber}" every second for 3 minutes (180 seconds)


Technicalities
-------------
Set adequate permissions for the Linux shell script to run.
Please don't run it immediately, change the time to wait for loading/shutting down OpenSim world depending on your world.
The script should reside in the bin folder of OpenSim server

TODO
-----
1)Not complete

Enjoy!
