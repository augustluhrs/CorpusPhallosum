class Ring
{
  float x, y, size, intensity, hue;
  //int ripCount;

  void respawn(float x1, float y1)
  {
    // Start at the newer mouse position
    x1 = dildoX;
    y1 = dildoY;


    size = height * 0.1;
    intensity = 100; //was 50
    //ripCount = 0;
    hue = random(100);

  }

  /*void pebble(float x1, float y1){
      size = height * 0.1;
      intensity = 80;
      ripCount = 0;

  }*/

  /*void ripple(){
    intensity *= 0.85;
    size += height * 1.5
    ripCount++;


  }*/
  void draw(){
    intensity *= 0.85; //original .95
    size += height * .08;
    //ripCount++;
    //if (ripCount % 5 == 0){
    if (intensity >= 5){ //was 1
      blendMode(ADD);
      //tint(hue, 50, intensity);
      tint(hue, 100, intensity);
      //tint((random(256)),(random(256)), (random(256)));
    //}
    //image(texture, x - size/2, y - size/2, size, size);
      image(texture, dildoX - size/2, dildoY - size/2, size, size);
    }
  }
};
