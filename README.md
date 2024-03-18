# LIRC Configuration for DAIKIN Air Conditioner


## Abstract

This repository provides LIRC configuration file for DAIKIN air conditioner.

This repository contents are a part of my Raspberry-Pi's IR remote commander project.


- - -

## Contents of this repository

    * README.md                     This file.
    * daikin-aircon.conf            LIRC remote configuration file for DAIKIN air conditioner.
    * scripts/                      
        format-alt-data.pl          PERL script to format the capture data file.
        create-conf.sh              Shell script to create LIRC remote configuration file.
        capture-ir.sh               Reference shell script to capture DAIKIN IR signals.
<br/>

- - -

## Prerequisites

### Hardware
Assume your Raspberry-PI has already set up the IR transmitter circuit.

Following schematic is an example. Note that take care of the total current consumption, because LED's current consumption is much higher than you think.
<br/>

![schematic diagram of IR-transmitter-receiver](ir-transmitter-receiver.png "IR Transmitter Receiver")

## config.txt
To enable IR modules, edit 'GPIO LIRC' section in file '/boot/config.txt'.

Find the IR configuration section (if any) and insert the following lines.

>>      dtoverlay=gpio-ir,gpio_pin=22
>>      dtoverlay=gpio-ir-tx,gpio_pin=17

Here, GPIO #17 (pin#11) is assigned as output pin (IR Transmitter), and GPIO #22 (pin#15) is assigned as output pin (IR Receiver).

RPi must be rebooted to activate these configurations.

<br/>

- - -

# How to Use

1. Download 'daikin-aircon.conf' and put it in /etc/lirc/lircd.conf.d (or /etc/lirc/remotes, depending on your LIRC version).

2. Edit '/etc/lirc/lircd.conf' to include DAIKIN LIRC configuration file, if necessary.
   (If your lircd.conf includes line 'include "lircd.conf.d/*.conf"', you don't have to do anything on lircd.conf.)
   Add 'include' statements to include your command definition files as follows.
   
>> include "/etc/lirc/remotes/daikin-aircon.conf"

3. Restart LIRC service.
> \# systemctl restart lircd

> (or, 'service lirc restart', depending on your Linux version.)


4. Try it.
* To list IR modules:
> \# irsend LIST '' ''
>><br/>
>>:<br/>
>>:<br/>
>>aircon<br/>
>>:<br/>
>>:<br/>

* To list commands for DAIKIN air conditioner:
> \# irsend LIST aircon ''
>><br/>
>>:<br/>
>>:<br/>
>>00000000000001ea heater-wind5-29.5<br/>
>>00000000000001eb heater-wind5-30.0<br/>
>>00000000000001ec off<br/>

* To power on DAIKIN air conditioner with 'AUTO' mode:
> \# irsend aircon auto

* To power on DAIKIN air conditioner on cooler mode with 26.5 degrees centigrade and with auto wind mode:
> \# irsend aircon cooler-auto-26.5

* To power off DAIKIN air conditioner:
> \# irsend aircon off
