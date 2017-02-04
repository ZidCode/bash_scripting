#!/bin/sh
TMP='/tmp/ipaddress'
if [ -f $TMP ]; then
  old_addr=$(cat $TMP)
  output=$(/sbin/ifconfig | awk -F':' '/inet addr/&&!/127.0.0.1/{split($2,_," ");print _[1]}')
  if [ "$old_addr" != "$output" ]; then
    echo "Sending address cause it changed"
    echo $output | mail -s "Raspberry sends ip address" youremail 
    echo $output > $TMP
  fi
else
  echo "Sending address cause no file is present"
  output=$(/sbin/ifconfig | awk -F':' '/inet addr/&&!/127.0.0.1/{split($2,_," ");print _[1]}')
  echo $output > $TMP
  echo $output | mail -s "Raspberry sends ip address" youremail
fi


