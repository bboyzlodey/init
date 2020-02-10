#!/bin/sh

USER=$(who | awk '{print $1}' | sort -u)
echo "Which of the active users do you want to delete?"
echo $USER
read USERNAME

VALID=$(cat /etc/passwd | grep $USERNAME)
if [ "$VALID" != "$NULL" ]; then
	sudo passwd -l $USERNAME
	if [ "$(pgrep -u $USERNAME)" != "$NULL" ]; then
		sudo kill -9 $(pgrep -u $USERNAME)
	fi
	sudo userdel -r $USERNAME
	echo "User deleted"
else
	echo "User is not found"
fi