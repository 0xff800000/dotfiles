#!/bin/bash

choice=$(echo -e "Shutdown\nSuspend\nLock\nCancel" | dmenu)

if [ $choice == "Shutdown" ]; then
	shutdown 0
elif [ $choice == "Suspend" ]; then
	~/dotfiles/i3lock/lock && systemctl suspend 
elif [ $choice == "Lock" ]; then
	~/dotfiles/i3lock/lock
else
	echo Canceled
fi

