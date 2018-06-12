OPC opc;
PImage texture;
Ring rings[];
float smoothX, smoothY;
boolean f = false;

import processing.io.*;

int[] row = {2,3,4,14,15,17,18,22,23,24,25,27};
int[] col = {5,6,13,26};
int[][] result = { //flipped 90 degrees so each line is a col, inverted so top is leftmost strip
  {1,2,3,4,5,6,7,8,9,10,11,12},
  {13,14,15,16,17,18,19,20,21,22,23,24},
  {25,26,27,28,29,30,31,32,33,34,35,36},
  {37,38,39,40,41,42,43,44,45,46,47,48}
};

float dildoX = width/2;
float dildoY = height/2;
long timer = 0;
float a, b, c;
boolean backSwitch = false;
boolean switchBack = true;

void setup()
{
  size(80, 240, P3D);
  colorMode(HSB, 100);
  texture = loadImage("ring.png");
  //frameRate(10);
  timer = millis();

  opc = new OPC(this, "127.0.0.1", 7890);
  for(int i=0; i<4; i++) {
    opc.ledStrip(i * 12, 12, i * width / 4.0 + width / 8.0,
    height * 0.5, width / 4.0, PI * 0.5, false);
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
  for (int x=0; x<4; x++){
    GPIO.pinMode(col[x], GPIO.INPUT);
  }
}

int keyRead(){
  int value = 0;
  for (int x=0; x<12; x++){
    GPIO.digitalWrite(row[x], GPIO.HIGH);
    delay(5);
    for (int y=0; y<4; y++){
      if (GPIO.digitalRead(col[y]) == GPIO.HIGH){
        delay(250);
        value = result[y][x];
        dildoX = (y) * width / 4 + width / 8;
        dildoY = (x) * height / 12 + height / 24;
      }
    }
    GPIO.digitalWrite(row[x], GPIO.LOW);
  }
  return (value);
}
  
void draw()
{
  //background(0);
  
  int key_stroke;
  key_stroke = keyRead();
  if (key_stroke != 0){
     println(key_stroke);
     timer = millis();
     backSwitch = !backSwitch;
  }
  long timeOut = millis() - timer;
  if (timeOut >= 5000){
     if (backSwitch != switchBack){
       a = random(10, 256);
       b = random(10, 256); 
       c = random(10, 256);
       backSwitch = switchBack;
     }
     else{
       background(a,b,c);
     }
  }
  else{
     background(0);
  // At every frame, randomly respawn one ring
  //ripCount++;
  /*if (ripCount % 5 == 0){
    rings[int(random(rings.length))].respawn(dildoX, dildoY);
  }*/
    rings[int(random(rings.length))].respawn(dildoX, dildoY);
  /*for (int i=0;i<rings.length;i*=2){
    rings[i].respawn(dildoX, dildoY);
  }*/
  
  // Give each ring a chance to redraw and update
    for (int i = 0; i < rings.length; i++) {
      rings[i].draw();
    }
  }
}
