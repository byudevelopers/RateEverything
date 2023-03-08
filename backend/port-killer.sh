#!/bin/bash

# Created by: JJ Stephens

# INSTRUCTIONS:

# To run kill all ports associated with the emulator, type the following 
# command in the terminal:
# ./port-killer.sh

# If you want to kill a specific port, type the following command in the terminal:
# ./port-killer.sh <port number>
# (Replace <port number> with the port number you want to kill)


# if there is an argument for a specific port, then kill that port
# otherwise kill all the ports that are being used by the backend server
if [ $# -eq 1 ]; then
  lsof -t -i:$1 | xargs kill -9
  echo "Killed port $1"
else
  lsof -t -i:5000 -i:5001 -i:8080 -i:9000 -i:9099 -i:9199 -i:9090 | xargs kill -9
  echo "Killed all ports"
fi

