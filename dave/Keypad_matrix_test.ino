#include <Wire.h> // Include the I2C library (required)
#include <SparkFunSX1509.h> // Include SX1509 library
#include <FastLED.h>

#define LED_PIN           6
#define COLOR_ORDER       GRB
#define CHIPSET           WS2811
#define NUM_LEDS          69
#define BRIGHTNESS        200
#define FRAMES_PER_SECOND 60

CRGB leds[NUM_LEDS];

const byte SX1509_ADDRESS = 0x3E;  // SX1509 I2C address (00)
SX1509 io; // Create an SX1509 object

#define KEY_ROWS 3
#define KEY_COLS 3

// Handy array we'll use to map row/column pairs to 
// character values:
char keyMap[KEY_ROWS][KEY_COLS] = {
  {'1', '2', '3'},
  {'4', '5', '6'},
  {'7', '8', '9'}};

// ARDUINO pin 2 connected to SX1509 interrupt
#define INTERRUPT_PIN 2

void setup() 
{
  Serial.begin(9600); // Use serial to print output
  if (!io.begin(SX1509_ADDRESS))
  {
    Serial.println("Failed to communicate.");
    while (1)
      ;
  }
  FastLED.addLeds<CHIPSET , LED_PIN , COLOR_ORDER>(leds, NUM_LEDS).setCorrection( TypicalLEDStrip );
  FastLED.setBrightness( BRIGHTNESS );
  // To initialize the keypad engine, you at least need
  // to tell it how many rows and columns are in the matrix.
  // io.keypad(KEY_ROWS, KEY_COLS);
  // You can customize the keypad behavior further, by
  // defining scan time, debounce time, and sleep time:
  // Sleep time range: 128 ms - 8192 ms (powers of 2) 0=OFF
  unsigned int sleepTime = 0;
  // Scan time range: 1-128 ms, powers of 2
  byte scanTime = 16; // Scan time per row, in ms
  // Debounce time range: 0.5 - 64 ms (powers of 2)
  byte debounceTime = 15; // Debounce time
  io.keypad(KEY_ROWS, KEY_COLS, sleepTime, scanTime, debounceTime);

  // Set the ARDUINO pin as an input, to monitor the interrupt
  pinMode(INTERRUPT_PIN, INPUT_PULLUP);
  Serial.println("Row | Col | Key");
}

void loop() 
{
  // If the interrupt pin goes active-low, a keypad button
  // is begin pressed:

  
  if (!digitalRead(INTERRUPT_PIN))
  {
    // Use readKeypad() to get a binary representation for
    // which row and column are pressed
    unsigned int keyData = io.readKeypad();

    // Use the getRow, and getCol helper functions to find
    // which row and column keyData says are active.
    byte row = io.getRow(keyData);
    byte col = io.getCol(keyData);
    char key = keyMap[row][col];
    //Serial.print(String(row) + " | " + String(col) + " | ");
    Serial.println(key);
    if (key == '1') {
      for (int i = 0; i < NUM_LEDS; i++) {
        leds[i, i - 1] = CRGB(255, 0 , 0);
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);
        leds[i, i - 1] = CRGB::Black;
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);    
  }
    }
    else if (key == '2') {
      for (int i = 0; i < NUM_LEDS; i++) {
        leds[i, i - 1] = CRGB(255, 0 , 255);
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);
        leds[i, i - 1] = CRGB::Black;
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);    
  }
    }
    else if (key == '3') {
      for (int i = 0; i < NUM_LEDS; i++) {
        leds[i, i - 1] = CRGB(255, 255 , 255);
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);
        leds[i, i - 1] = CRGB::Black;
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);    
  }
    }
    else if (key == '4') {
      for (int i = 0; i < NUM_LEDS; i++) {
        leds[i, i - 1] = CRGB(255, 255 , 0);
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);
        leds[i, i - 1] = CRGB::Black;
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);    
  }
    }
    else if (key == '5') {
      for (int i = 0; i < NUM_LEDS; i++) {
        leds[i, i - 1] = CRGB(0, 255 , 255);
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);
        leds[i, i - 1] = CRGB::Black;
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);    
  }
    }
    else if (key == '6') {
      for (int i = 0; i < NUM_LEDS; i++) {
        leds[i, i - 1] = CRGB(255, 100 , 100);
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);
        leds[i, i - 1] = CRGB::Black;
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);    
  }
    }
    else if (key == '7') {
      for (int i = 0; i < NUM_LEDS; i++) {
        leds[i, i - 1] = CRGB(100, 255 , 100);
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);
        leds[i, i - 1] = CRGB::Black;
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);    
  }
    }
    else if (key == '8') {
      for (int i = 0; i < NUM_LEDS; i++) {
        leds[i, i - 1] = CRGB(100, 100 , 255);
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);
        leds[i, i - 1] = CRGB::Black;
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);    
  }
    }
    else if (key == '9') {
      for (int i = 0; i < NUM_LEDS; i++) {
        leds[i, i - 1] = CRGB(50, 180 , 200);
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);
        leds[i, i - 1] = CRGB::Black;
        FastLED.show();
        FastLED.delay(1000 / FRAMES_PER_SECOND);    
  }
  }
}
}

