OPC opc;
PImage texture;
Ring rings[];
float smoothX, smoothY;
boolean f = false;


void setup()
{
  size(40, 120, P3D);
  colorMode(HSB, 100);
  texture = loadImage("ring.png");

  opc = new OPC(this, "127.0.0.1", 7890);
  //opc.ledGrid8x8(0, width/2, height/2, height / 16.0, 0, false, false);
  for(int i=0; i<4; i++) {
    opc.ledStrip(i * 12, 12, i * width / 4.0 + width / 8.0,
    height * 0.5, width / 4.0, PI * 0.5, false);
  }

  // We can have up to 100 rings. They all start out invisible.
  rings = new Ring[100];
  for (int i = 0; i < rings.length; i++) {
    rings[i] = new Ring();
  }
}

void draw()
{
  background(0);

  // Smooth out the mouse location. The smoothX and smoothY variables
  // move toward the mouse without changing abruptly.
  float prevX = smoothX;
  float prevY = smoothY;
  smoothX += (mouseX - smoothX) * 0.1;
  smoothY += (mouseY - smoothY) * 0.1;

  // At every frame, randomly respawn one ring
  rings[int(random(rings.length))].respawn(prevX, prevY, smoothX, smoothY);

  // Give each ring a chance to redraw and update
  for (int i = 0; i < rings.length; i++) {
    rings[i].draw();
  }
}
