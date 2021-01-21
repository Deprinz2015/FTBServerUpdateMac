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

### Additional Info
This script is written for the Direwolf20 1.16 modpack, so i cant guarantee functionality for other modpacks, but at least the newer versions, that have the a version.json file should work. Also, this tool is not tested for anything other than this modpack, so please open an issue to tell me any problems you have that i may fix. The main purpose for this tool is to make my life easier to update the server files of the modpack, and as there are no really working server install files for mac from the FTB-Team themselves, i helped myself a bit and make it work. Therefor the missing update functionality, that i wanted to fill. This is afterall a small hobby-project so dont expect high perfomance or totally optimized code. Errors and bugs are bound to happen, but i will try to fix them if you cant fix them yourself.
