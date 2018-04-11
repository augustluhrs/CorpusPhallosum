#!/usr/bin/env python

import os
from time import sleep

import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setup(12, GPIO.IN)
GPIO.setup(16, GPIO.IN)
GPIO.setup(18, GPIO.OUT)

while True:
	if(GPIO.input(12) == True):
		print "LED on"
		GPIO.output(18,GPIO.HIGH)
		os.system('omxplayer -o both help.mp3')
	if(GPIO.input(12) == False):
		GPIO.output(18,GPIO.LOW)
	if(GPIO.input(16) == True):
		os.system('omxplayer -o both --pos 00:00:06 doorspring.mp3')
	sleep(0.1);
