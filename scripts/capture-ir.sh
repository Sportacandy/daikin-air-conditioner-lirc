#!/bin/bash

trap "killall mode2; exit" SIGINT

# cooler temperature range: [18.0, 32.0]
for d in 18.0 18.5 19.0 19.5 20.0 20.5 21.0 21.5 22.0 22.5 23.0 23.5 24.0 24.5 25.0 25.5 26.0 26.5 27.0 27.5 28.0 28.5 29.0 29.5 30.0 30.5 31.0 31.5 32.0 ; do
    for v in 0 1 2 3 4 5; do
        ID=cooler-wind${v}-${d}
	echo ${ID}
	echo Press enter key to step next.
	read
	file=aircon-${ID}.txt
        mode2 -d /dev/lirc1 -m > ${file} 2> /dev/null &
	cpid=$!
	grep pulse ${file} > /dev/null 2>&1
	while [ $? -ne 0 ]; do
	    grep pulse ${file} > /dev/null 2>&1
        done
	kill -TERM ${cpid}
	wait ${cpid}
    done
done

# heater temperature range: [14.0, 30.0]
for d in 14.0 14.5 15.0 15.5 16.0 16.5 17.0 17.5 18.0 18.5 19.0 19.5 20.0 20.5 21.0 21.5 22.0 22.5 23.0 23.5 24.0 24.5 25.0 25.5 26.0 26.5 27.0 27.5 28.0 28.5 29.0 29.5 30.0 ; do
    for v in 0 1 2 3 4 5; do
        ID=heater-wind${v}-${d}
	echo ${ID}
	echo Press enter key to step next.
	read
	file=aircon-${ID}.txt
        mode2 -d /dev/lirc1 -m > ${file} 2> /dev/null &
	cpid=$!
	grep pulse ${file} > /dev/null 2>&1
	while [ $? -ne 0 ]; do
	    grep pulse ${file} > /dev/null 2>&1
        done
	kill -TERM ${cpid}
	wait ${cpid}
    done
done

