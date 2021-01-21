#!/bin/sh

cd -- "$(dirname "$0")"

echo "Updating Server..."

if [ ! -f version.json ]; then
    echo "[Error]: Missing version.json"
    echo "Downloading newest version.json"
    curl https://api.modpacks.ch/public/modpack/79/220 --output 'version.json'
    echo "Finished Installing version.json"
    echo "Restart Script to update"
    exit
fi

echo "Found version.json"

echo "Checking for update..."
result=`python3 CheckForUpdate.py`

if [ ! $result == "True" ]; then 
    echo "No Update found, everything should be up to date"
    echo "Exiting Update Script"
    exit
fi

echo "Update found!"
echo "Downloading newest version.json"
curl https://api.modpacks.ch/public/modpack/79/220 --output 'version.json'

echo "Backing up world data in backups/"
NOW=$(date +"%Y.%m.%d-%H:%M")
zip backups/world-$NOW.zip -r world

echo "removing the following folders to update"
echo "/kubejs"
rm -r kubejs
echo "/defaultconfigs"
rm -r defaultconfigs
echo "/config"
rm -r config
echo "/mods"
rm -r mods

echo "Finished preparing Update"

echo "Using Python3 to update Server"
echo "Starting UpdateServer.py..."

python3 UpdateServer.py

echo "Finished Updating the Server"
