#!/usr/bin/env python

import os
from time import sleep

import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)
GPIO.setup(37, GPIO.IN)
while True:
	if(GPIO.input(37) == True):
		print "chase me daddy"
		os.system('./python/chase.py &')
	if(GPIO.input(37) == False):
		print "off"
	sleep(0.1);
