#!/usr/bin/python

from pad4pi import rpi_gpio
import time
import os

def print_key(key):
	print(key)

def key_pressed(key):
	int_key = int(key)
	if int_key == 8:
		os.system("cd python/; ./chase.py")
		print("FC active")

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
