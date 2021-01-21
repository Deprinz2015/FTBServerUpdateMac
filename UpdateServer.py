import json, requests, os

with open('version.json') as json_file:
    data = json.load(json_file)
    print(f"Modpack Version: {data['name']}")
    print("Collecting all Mod names...")

    for mod in data['files']:
        if mod['clientonly']: 
            print("Skipping Client-Only Mod: " + mod['name'])
            continue

        print("Installing Mod: " + mod['name'])
        url = mod['url']
        r = requests.get(url)

        filename = mod['path'] + mod['name']
        os.makedirs(os.path.dirname(filename), exist_ok=True)
        
        open(filename, 'wb').write(r.content)
        print("Finished installing Mod: " + mod['name'])
