#!/bin/bash
echo "all variables:: $@"
echo "no of variables:: $#"
echo "name of the script:: $0"
echo "pwd of user running script:: $PWD"
echo "user running script:: $USER"
echo "hostname:: $HOSTNAME"
sleep 60 &
echo "pid of current script:: $$"
echo "pid of lasst background command:: $!"
echo "exit status of previous command:: $?"