#!/bin/bash
#send starwars to everyone on the system
command="tee"
for tty in $(ls /dev/ttys* | awk '/ttys[0-9]{3}/{print}')
do
    if [ "$tty" != `tty` ]; then
        command="$command $tty";
    fi;
done
telnet towel.blinkenlights.nl | $command &> /dev/null
