#!/bin/bash

choice=$(echo -e "Suspend\nLock\nShutdown\nStop-i3\nCancel" | dmenu)

if [ $choice == "Shutdown" ]; then
	shutdown 0
elif [ $choice == "Suspend" ]; then
	#~/dotfiles/i3lock/lock && systemctl suspend
	i3lock-fancy && systemctl suspend
elif [ $choice == "Lock" ]; then
	i3lock-fancy
elif [ $choice == "Stop-i3" ]; then
	i3-msg exit
else
	echo Canceled
fi

