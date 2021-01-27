#!/bin/bash

if [ $# == 0 ]
then
	top -b -n2 | grep "Cpu(s)" | awk '{print $2+$4 "%"}' | tail -n1
elif [ $1 == '-cpu' ]
then
	top -b -n2 | grep "Cpu(s)" | awk '{print $2+$4 "%"}' | tail -n1
elif [ $1 == '-mem' ]
then
	free | grep Mem | awk '{printf "%.1f%\n",$3/$2 * 100.0}'
else
	echo "unknown argument $1"
fi
