#!/bin/bash
if [ -e finput ]; then
	if [ $1 = 0 ]; then
		echo "set_all 100,100,100" > finput
	else
		echo "set_all 100,0,0" > finput
	fi
fi
