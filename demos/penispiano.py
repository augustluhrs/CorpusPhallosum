#!/usr/bin/env python

import os
from time import sleep

import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setup(20, GPIO.IN)
GPIO.setup(16, GPIO.IN)
GPIO.setup(12, GPIO.IN)
GPIO.setup(23, GPIO.IN)
GPIO.setup(18, GPIO.IN)
GPIO.setup(26, GPIO.OUT)
GPIO.setup(13, GPIO.OUT)
GPIO.setup(5, GPIO.OUT)
GPIO.setup(17, GPIO.OUT)
GPIO.setup(4, GPIO.OUT)

while True:
	if(GPIO.input(20) == True):
		print "Dildo A -- LED on"
		GPIO.output(26,GPIO.HIGH)
		os.system('omxplayer -o both ../sounds/midA.mp3 &')
	if(GPIO.input(20) == False):
		GPIO.output(26,GPIO.LOW)
	if(GPIO.input(16) == True):
		print "Dildo C -- LED on"
		GPIO.output(13,GPIO.HIGH)
		os.system('omxplayer -o both ../sounds/midC.mp3 &')
	if(GPIO.input(16) == False):
		GPIO.output(13,GPIO.LOW)
	if(GPIO.input(12) == True):
		print "Dildo E -- LED on"
		GPIO.output(5,GPIO.HIGH)
		os.system('omxplayer -o both ../sounds/midE.mp3 &')
	if(GPIO.input(12) == False):
		GPIO.output(5,GPIO.LOW)
	if(GPIO.input(23) == True):
		print "Dildo F -- LED on"
		GPIO.output(17,GPIO.HIGH)
		os.system('omxplayer -o both ../sounds/midF.mp3 &')
	if(GPIO.input(23) == False):
		GPIO.output(17,GPIO.LOW)
	if(GPIO.input(18) == True):
		print "Dildo G -- LED on"
		GPIO.output(4,GPIO.HIGH)
		os.system('omxplayer -o both ../sounds/midG.mp3 &')
	if(GPIO.input(18) == False):
		GPIO.output(4,GPIO.LOW)
	sleep(0.1);
