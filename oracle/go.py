import RPi.GPIO as GPIO
import time
import os
import subprocess
#import uinput
# set up keystroke input
#device = uinput.Device([uinput.KEY_Q])
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(4, GPIO.IN, pull_up_down=GPIO.PUD_UP) # input for on bat
#GPIO.setup(8, GPIO.IN, pull_up_down=GPIO.PUD_UP) # input for low bat
#GPIO.setup(17, GPIO.IN, pull_up_down=GPIO.PUD_UP) # input for ac fail

# you need to have the 3 messages on the pi in wav format in the /home/pi dir this example

isPlaying = False
omx_process = None

os.system('omxplayer -o both /home/pi/Desktop/ambientSpace.mp3 &')

while True:
#   print(isPlaying)
    if isPlaying == False and GPIO.input(4) == 0:
#        os.system("aplay /home/pi/Desktop/oracleAudio.wav")
	os.system('pkill -f omxplayer')
        os.system('omxplayer -o both /home/pi/Desktop/oracleAudio.wav &')
#        omx_process = subprocess.Popen(['omxplayer', '/home/pi/Desktop/oracleAudio.wav'])
	isPlaying = True
    elif isPlaying == True and GPIO.input(4) == 1 :
        #device.emit_click(uinput.KEY_Q)
	os.system('pkill -f omxplayer')
	os.system('omxplayer -o both /home/pi/Desktop/ambientSpace.mp3 &')
#        if omx_process is not None:
#            omx_process.terminate()
#	    omx_process.wait()
        isPlaying = False
#        os.system("killall aplay")
        
        
#    if GPIO.input(8) == 0:
 #       os.system("aplay /home/pi/lowbat.wav")
        
        
  #  if GPIO.input(17) == 0:
   #     os.system("aplay /home/pi/acfail.wav")  
        

    #time.sleep(180)
    
