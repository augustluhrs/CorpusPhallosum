#!/usr/bin/env python

import os
import serial
ser = serial.Serial('/dev/ttyACM0',9600)

import opc, time
numLEDs = 50
client = opc.Client('localhost:7890')

while 1:
	read_ser=ser.readline()
	print(read_ser)
	#if ser.readline() == 4:
		#os.system('./python/chase.py')
	for i in range(numLEDs):
		pixels = [ (0,0,0) ] * numLEDs
		pixels[i] = (255,255,255)
		client.put_pixels(pixels)
		time.sleep(0.01)
