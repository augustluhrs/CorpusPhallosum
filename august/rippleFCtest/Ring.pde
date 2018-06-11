class Ring
{
  float x, y, size, intensity, hue;

  void respawn(float x1, float y1, float x2, float y2)
  {
    // Start at the newer mouse position
    x = x2;
    y = y2;
    
    // Intensity is just the distance between mouse points
    //intensity = dist(x1, y1, x2, y2);
    intensity = 20;
    
    // Hue is the angle of mouse movement, scaled from -PI..PI to 0..100
    hue = random(100);

    // Default size is based on the screen size
    size = height * 0.1;
  }

  void draw()
  {
    // Particles fade each frame
    
    intensity *= 0.85; //original .95
    
    // They grow at a rate based on their intensity
    size += height * intensity * 0.01;

    // If the particle is still alive, draw it
    if (intensity >= 1) {
      blendMode(ADD);
      tint(hue, 50, intensity);
      //tint((random(256)),(random(256)), (random(256)));
      image(texture, x - size/2, y - size/2, size, size);
    }
  }
};
