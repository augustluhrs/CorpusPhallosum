#!/usr/bin/env python

import os
import serial
ser = serial.Serial('/dev/ttyACM0',9600)


while 1:
	read_ser=ser.readline()
	print(read_ser)
