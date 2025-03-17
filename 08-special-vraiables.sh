#!/bin/bash
echo "to get all variables:: $@
echo "no of variables:: $#"
echo "name of the script:: $0"
echo "present working directory:: $PWD"
echo "current user home directory:: $HOME"
echo "user who is running script:: $USER"
echo "hostname of swcript:: $HOSTNAME"
echo "process id of current running script:: $$"
echo "sleep for 60 sec:: sleep 60 &"
echo "process id of last background command:: $!"
echo "check exist status of previous command:: $?"