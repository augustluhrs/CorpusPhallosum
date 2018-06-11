import processing.io.*; 

int[] row = {4,17,27,22};
int[] col = {5,6,13,26};
int[][] result = {{1,2,3,4},{5,6,7,8},{9,10,11,12},{13,14,15,16}};


void setup(){
 frameRate(20);
 for (int x=0; x<4; x++){
  GPIO.pinMode(row[x], GPIO.OUTPUT);
  GPIO.pinMode(col[x], GPIO.INPUT);
  GPIO.digitalWrite(row[x], GPIO.LOW); //flipped from example b/c contact keypad, not break
 }
}

int keyRead(){
  int value = 0;
  for (int x=0; x<4; x++){
    GPIO.digitalWrite(row[x], GPIO.HIGH);
    delay(5);
    for (int y=0; y<4; y++){
      if (GPIO.digitalRead(col[y]) == GPIO.HIGH){
        delay(250);
        value = result[x][y];
      }
    }
    GPIO.digitalWrite(row[x], GPIO.LOW);
  }
  return (value);
}

void draw(){
  //debugging
  /*for (int x=0; x<4; x++){ 
    println(GPIO.digitalRead(row[x]));
    println(row[x]);
    delay(5);
    for (int y=0; y<4; y++){
      println(GPIO.digitalRead(col[y]));
      println(col[y]);
      }
    }*/
  int key_stroke;
  key_stroke = keyRead();
  if (key_stroke != 0){
     println(key_stroke);
  }
}
