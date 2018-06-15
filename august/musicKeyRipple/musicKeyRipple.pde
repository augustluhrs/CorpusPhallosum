OPC opc;
PImage texture;
Ring rings[];
float smoothX, smoothY;
boolean f = false;

import processing.io.*;

int[] row = {2,3,4,14,15,17,18,22,23,24,25,27};
int[] col = {5,6,7,8,11,12,13,16,19,20,21,26};
int[][] result = { 
  {1,2,3,4,5,6,7,8,9,10,11,12},
  {13,14,15,16,17,18,19,20,21,22,23,24},
  {25,26,27,28,29,30,31,32,33,34,35,36},
  {37,38,39,40,41,42,43,44,45,46,47,48},
  {49,50,51,52,53,54,55,56,57,58,59,60},
  {61,62,63,64,65,66,67,68,69,70,71,72},
  {73,74,75,76,77,78,79,80,81,82,83,84},
  {85,86,87,88,89,90,91,92,93,94,95,96},
  {97,98,99,100,101,102,103,104,105,106,107,108},
  {109,110,111,112,113,114,115,116,117,118,119,120},
  {121,122,123,124,125,126,127,128,129,130,131,132},
  {133,134,135,136,137,138,139,140,141,142,143,144}
}; // I coulda just done result[12][12] huh...

float dildoX;
float dildoY;
long timer = 0;
float a, b, c;
boolean backSwitch = false;
boolean switchBack = true;

//sound
import processing.sound.*;
SoundFile file;
boolean musicFlip = true;
TriOsc triOsc;
Env env;
float attackTime = 0.001;
float sustainTime = 0.004;
float sustainLevel = 0.2;
float releaseTime = 0.2;


void setup()
{
  size(240, 240, P3D);
  colorMode(HSB, 100);
  texture = loadImage("ring.png");
  //frameRate(10);
  timer = millis();

  opc = new OPC(this, "127.0.0.1", 7890);
  for(int i=0; i<12; i++) {
    opc.ledStrip(i * 12, 12, width * 0.5,
    i * height / 12.0 + height / 24.0, width / 12.0, PI, false);
  }

  // We can have up to 100 rings. They all start out invisible.
  rings = new Ring[100];
  for (int i = 0; i < rings.length; i++) {
    rings[i] = new Ring();
  }
  
  for (int x=0; x<12; x++){
    GPIO.pinMode(row[x], GPIO.OUTPUT);
    GPIO.digitalWrite(row[x], GPIO.LOW); //flipped from example b/c contact keypad, not break
  }
  for (int x=0; x<12; x++){
    GPIO.pinMode(col[x], GPIO.INPUT);
  }
  file = new SoundFile(this, "oh.mp3");
  triOsc = new TriOsc(this);
  env = new Env(this);
}

int keyRead(){
  int value = 0;
  for (int x=0; x<12; x++){
    GPIO.digitalWrite(row[x], GPIO.HIGH);
    delay(5);
    for (int y=0; y<12; y++){
      if (GPIO.digitalRead(col[y]) == GPIO.HIGH){
        delay(10);
        value = result[x][y];
        dildoX = (x) * width / 12 + width / 24;
        dildoY = (y) * height / 12 + height / 24;
      }
    }
    GPIO.digitalWrite(row[x], GPIO.LOW);
  }
  return (value);
}
  
float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0)))*440;
}

void draw()
{
  //background(0);
  long ohTime = millis() - timer;
  int key_stroke;
  key_stroke = keyRead();
  if (musicFlip){
    if (key_stroke != 0){
       println(key_stroke);
       timer = millis();
       backSwitch = !backSwitch;
       if (ohTime >= 50){
         float note = map(key_stroke, 0, 144, 0, 127);
         int noti = (int)note;
         triOsc.play(midiToFreq(noti), 0.8);
         env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
     }
    }
  }
  else{
    if (key_stroke != 0){
     println(key_stroke);
     timer = millis();
     backSwitch = !backSwitch;
     if (ohTime >= 250){
       file.play();
     }
   }
  }
  long timeOut = millis() - timer;
  if (timeOut >= 5000){
     if (backSwitch != switchBack){
       a = random(10, 100);
       b = random(10, 100); 
       c = random(50, 100);
       switchBack = backSwitch;
       musicFlip = !musicFlip;
     }
     else{
       background(a,b,c);
     }
  }
  else{
    background(0);
    rings[int(random(rings.length))].respawn(dildoX, dildoY);
    for (int i = 0; i < rings.length; i++) {
      rings[i].draw();
    }
  }
}
