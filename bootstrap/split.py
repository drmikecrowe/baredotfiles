lines = open("/home/mcrowe/bin/bootstrap", "r").read().split("\n")

in_output = False
in_cmd = False
command = []


prefix = [
    "#!/bin/bash",
    "",
    "source $HOME/bootstrap/_setup.sh",
    "",
]

for line in lines:
    if not in_cmd:
        if line.startswith("ask_install"):
            in_cmd = True
            name = "_".join(line.split("_", 3)[2:]).split("(")[0]
    else:
        if in_output:
            if line.strip() == "fi":
                in_output = False
                open(f"/home/mcrowe/bootstrap/{name}.sh", "w").write("\n".join(prefix) + "\n".join(command))
                command = []
                name = None
            else:
                command.append(line.replace("        ", "").replace("local ", ""))
        else:
            if line.strip().startswith("if confirm"):
                in_output = True
            if line == "}":
                in_cmd = False
