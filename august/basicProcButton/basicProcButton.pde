import processing.io.*;

void setup() {
  // set pin 4 as an input:
  GPIO.pinMode(6, GPIO.INPUT);
  GPIO.pinMode(4, GPIO.OUTPUT);
  GPIO.digitalWrite(4, GPIO.HIGH);
}

void draw() {
  if (GPIO.digitalRead(6) == GPIO.LOW) { // if the pin is HIGH, the button isn't pressed

    // set the background to black:
    background(0, 0, 0);

  } else { // if the button is pressed:

    // set the background to red:
    background(255, 0, 0);
  }
}
