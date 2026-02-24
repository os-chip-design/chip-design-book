import subprocess

# the fiollowing does not work as openroad needs a command file and not just the file name
subprocess.Popen(["openroad", "-gui", "librelane_run/3-openroad-tapendcapinsertion/adder.odb"])