import re
import os
import subprocess

current_dir = os.path.dirname(__file__)
config_dir = os.path.join(current_dir, "Conf")
extension = ".xboxconf"
event_path = "/dev/input/event"
name_pattern = 'N: Name="(.+?)"'
handlers_event_pattern = 'H: Handlers=(.*?)event(.[0-9]?)'

processes = []

with open('/proc/bus/input/devices','r') as file:

    data = file.read().split('\n\n')
    filtered = list(filter(None, data))

    for x in filtered:
        name = re.search(name_pattern, x).group(1)
        config = os.path.join(config_dir, name + extension)

        if(not os.path.isfile(config)):
            continue

        event = re.search(handlers_event_pattern, x).group(2)
        event_file = event_path + event

        args = ["xboxdrv","--evdev=" + event_file,"--config",config]
        print(args)

        proc = subprocess.Popen(args)
        processes.append(proc)

input("Processes started.\n")

print("Killing processes.")

for p in processes:
    p.kill()
    print(p.args)

print("Done")

