#!/usr/bin/python

from pad4pi import rpi_gpio
import time
import os
import opc

numLEDs = 36
client = opc.Client('localhost:7890')

def print_key(key):
	print(key)

def key_pressed(key):
	int_key = int(key)
	if int_key == 8:
		#os.system("cd python/; ./chase.py")
		#print("FC active")
		for i in range(numLEDs):
			pixels = [ (0,0,0) ] * numLEDs
			pixels[i] = (255, 255, 255)
			client.put_pixels(pixels)
			time.sleep(0.01)
	if int_key == 4:
		for i in range(numLEDs):
			pixels = [ (0,0,0) ] * numLEDs
			pixels[i] = (255, 0, 0)
			client.put_pixels(pixels)
			time.sleep(0.01)

	if int_key == 1:
		for i in range(numLEDs):
			pixels = [ (0,0,0) ] * numLEDs
			pixels[i] = (0, 255, 0)
			client.put_pixels(pixels)
			time.sleep(0.01)
	if int_key == 0:
		for i in range(numLEDs):
			pixels = [ (0,0,0) ] * numLEDs
			pixels[i] = (0, 0, 255)
			client.put_pixels(pixels)
			time.sleep(0.01)

try:
	factory = rpi_gpio.KeypadFactory()
	keypad = factory.create_4_by_3_keypad()

	keypad.registerKeyPressHandler(print_key)
	keypad.registerKeyPressHandler(key_pressed)
	print("Press buttons on your keypad. Ctrl-C to exit.")
	while True:
		time.sleep(1)
except KeyboardInterrupt:
	print("goodbye")
finally:
	keypad.cleanup()
