from openrgb import OpenRGBClient
from openrgb.utils import RGBColor, DeviceType
import sys

client = OpenRGBClient()

ram = client.get_devices_by_name('corsair', False)

for r in ram:
    r.set_mode("static")

def setAll(color):
    for d in client.devices:
        d.set_color(color)

c = input("")
def num(s):
    try:
        return int(s)
    except ValueError:
        try:
            return float(s)
        except ValueError:
            return None

while c != "quit":
    cs = c.split()
    if cs[0] == "set_all":
        rgb = cs[1].split(",")
        try:
            setAll(RGBColor(num(rgb[0]), num(rgb[1]), num(rgb[2])))
        except:
            print("Invalid command, could not parse numbers")
    c = input("")
print("exiting....")
