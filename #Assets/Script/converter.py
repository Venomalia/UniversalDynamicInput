import argparse
import json
from pathlib import Path

STYLES = ["Defaultstyle", "Defaultstyle_Pressed", "Flat", "Flat_Pressed", "Simple-Default", "Text-Default", "v2"]

parser = argparse.ArgumentParser(description="Convert UniversalDynamicInput packs for Dolphin emulator.")
parser.add_argument("file", nargs='+', help="Input file")
parser.add_argument("-t", "--type", default="Defaultstyle" , help="Output style")
parser.add_argument("-d", "--devices", help="Device:Icon mappings")
parser.add_argument("-r", "--removeunused", action="store_true", help="Remove unused host_controls")
args = parser.parse_args()

if(args.type not in STYLES):
    exit("Unrecognized type")

output = {}
for file in args.file:
    in_file = open(file, "r")

    data = json.load(in_file)

    if(args.type != "v2"):
        print("Not yet implemented")
    else:
        output["specification"]=2.0
        original_style = Path(file).stem[7:] # Find a better way to do this
        dhc = output.get("default_host_controls") or {}
        for device in data["default_host_controls"]:
            inputs = dhc.get(device) or []
            for input in data["default_host_controls"][device]:
                entry = {"keys": [input], "image": data["default_host_controls"][device][input]}
                if(original_style != "Defaultstyle"):
                    entry["tag"] = original_style
                inputs.append(entry)
            dhc[device]=inputs
        output["default_host_controls"]=dhc

        output["generated_folder_name"]=data["generated_folder_name"]
        output["preserve_aspect_ratio"]=data["preserve_aspect_ratio"] # TODO: Null checking

        ot = output.get("output_textures") or {}
        for texture in data["output_textures"]:
            current = data["output_textures"][texture]
            entry = {}
            entry["image"]=current["image"]
            for controller in current["emulated_controls"]:
                ec = {}
                val = []
                for key in current["emulated_controls"][controller]:
                    keyval = {"key": key, "region": current["emulated_controls"][controller][key][0]}
                    if(original_style != "Defaultstyle"):
                        keyval["tag"] = original_style
                    val.append(keyval)
                ec[controller]=val
                entry["emulated_controls"]=ec
            ot[texture] = entry
        output["output_textures"] = ot

    in_file.close

out_file = open(str(Path(args.file[0]).parent) + "/output_" + args.type + ".json", "w") # There's got to be a better way

json.dump(output, out_file, indent=2)

out_file.close