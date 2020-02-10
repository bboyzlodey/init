#!/bin/sh
cat /etc/passwd | cut -d ':' -f1,3,7 | sed 's/:/ /g' | column -t