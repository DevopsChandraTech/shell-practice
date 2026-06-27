#!/bin/bash

#set -e
echo "before error"
ajfjajdlfjlf
echo "after error"

trap 'the error linenumber is $LINENO and the error is $BASH_COMMAND' ERR

# here trap call the ERR signal and stop the script if any error found
# set -euo stop the script if any error found direct.

