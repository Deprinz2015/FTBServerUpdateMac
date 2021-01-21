# FTBServerUpdateMac
A Server Update Script to make the life easier for admins of local FTB-Servers on a MacOS machine. If there is a new update to the modpack, this script will see it and update it automatically. Though, there should be at least some knowledge of scripting in bash and python to use this. This is the first functional version of the scripts, so most likely i will optimize them a bit and make them easier to use.

## Requirements
This tool uses python3 and two tools installed via pip3. These should be installed via the commands:
- pip3 install requests
- pip3 install packaging
Everything else should work by default.

## Usage
There are a few things you should do, before you can use this.
First, you need to find a version.json in your modpack files for the client. To do this, just open the FTB-Launcher, select the installed modpack -> open folder and look for a file called version.json.
This file has one very important line near the bottom. The value of the changelog field is the one your looking for. This link is needed to find the version.json for this modpack and to automatically update it on server start. Copy this link without the '/changelog' at the end and paste it in the following spots:
- UpdateServer.sh line 10
- UpdateServer.sh line 29
- CheckForUpdate.py line 7  

After that, you just paste all 3 files into the server root directory and you are good to go.
From here on, you have 2 possible ways to use this tool. Either you manually call the UpdateServer.sh script whenever the FTB-Launcher has a new update for you client pack. If thats the case, there is nothing left to do and this tool should be ready for everything.
Or you have a dedicated StartServer.sh script, where you can add the command '. ./UpdateServer.sh' just before starting the server. With that you check for available updates, whenever the server is started via this startup script.  
