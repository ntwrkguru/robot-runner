#!/bin/bash

# Entrypoint script for robot runner

# Additional Python packages can be installed by mounting a requirements.txt
# file (or a directory containing one) to /packages
# i.e. -v $PWD/requirements.txt:/packages/requirements.txt or
# -v /some/dir/:/packages

ADDS="/packages/requirements.txt"
[ -a $ADDS ] && pip3 install -r $ADDS

# Now, we can execute robot

robot 
