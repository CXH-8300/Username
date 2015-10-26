#!/bin/sh
#USERNAME.


SIZE="$[ 1 + $[ RANDOM % 4 ]]"
ORDEROFMAGNITUDE="$[ 1 + $[ RANDOM % 4 ]]"


#grab some random bytes and convert. trim to only desired output characters.
#and then take only what was decided.
PREFIX=$(dd if=/dev/urandom bs=1024 count=1|base64 |tr -dc 'A-Z'|head -c $SIZE)
POSTFIX=$(dd if=/dev/urandom bs=1024 count=1|base64 |tr -dc '0-9'|head -c $ORDEROFMAGNITUDE)

#clear base64's output and construct USERNAME.
clear && echo "$PREFIX-${POSTFIX}00"
