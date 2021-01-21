import json, requests
from packaging import version

with open('version.json') as last_json:
    last_version = json.load(last_json)['name']
    
    url = 'https://api.modpacks.ch/public/modpack/79/220'
    r = requests.get(url)
    new_version = r.json()['name']
    print(version.parse(new_version) > version.parse(last_version))