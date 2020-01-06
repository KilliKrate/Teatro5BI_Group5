Montagna m1, m2, m3, m4, m11, m22,m33, m44;
PuntoLuminoso s;
PImage ai;
PImage bruno;
PImage mask;
int alpha = 0;
int posx = 0;
int posy = 0;
float t, y;

public void settings() {
  size(1920, 1080);
}

void setup() {
  frameRate(24);
  m1 = new Montagna(0, 648, width/2, height, 1.4, 9, 40);
  m2 = new Montagna(0, 907, width/2, 691, 1.2, 9, 60);
  m3 = new Montagna(0, 670, width/2, 497, 1, 6, 80);
  m4 = new Montagna(0, 389, width/2, 324, 0.9, 6, 120);
  
  m11 = new Montagna(width/2, height, width, 648, 1.4, 9, 40);
  m22 = new Montagna(width/2, 691, width, 907, 1.2, 9, 60);
  m33 = new Montagna(width/2, 497, width, 670, 1, 6, 80);
  m44 = new Montagna(width/2, 324, width, 389, 0.9, 6, 120);
  s = new PuntoLuminoso(width/2, m4.getLastY(), 50.0, 600.0, 200, 0, color(252, 183, 74), color(255, 132, 0));
  ai = loadImage("ai.jpg");
  bruno = loadImage("bruno.jpg");
  bruno.loadPixels();
  ai.loadPixels();
  mask = loadImage("moon.png");
  bruno.mask(mask);
  for (int i = 0; i < ai.width; i++){
    for (int j = 0; j < ai.height; j++){
      int pos = i+j*ai.width;
      float r = red(ai.pixels[pos]);
      float g = green(ai.pixels[pos]);
      float b = blue(ai.pixels[pos]);
      float d = dist(ai.width / 2, ai.height / 2, i, j);
      float factor = map (d, 0, 400, 2, 0);
      ai.pixels[pos] = color(r*factor, g*factor, b*factor);
    }
  }
  ai.updatePixels();
  for (int i = 0; i < bruno.width; i++){
    for (int j = 0; j < bruno.height; j++){
      int pos = i+j*bruno.width;
      float r = red(bruno.pixels[pos]);
      float g = green(bruno.pixels[pos]);
      float b = blue(bruno.pixels[pos]);
      float d = dist(bruno.width / 2, ai.height / 2, i, j);
      float factor = map (d, 0, 500, 2, 0);
      bruno.pixels[pos] = color(r*factor, g*factor, b*factor);
    }
  }
  bruno.updatePixels();
}

void draw() {
  background(38, 42, 90);
  s.display();
  if (frameCount < 144) {
    
    t = map(frameCount, 0, 144, 0, 1);
    y = pow(t, 2);
        
    m1.scaleY(y);
    m2.scaleY(y);
    m3.scaleY(y);
    m4.scaleY(y);
    m11.scaleY(y);
    m22.scaleY(y);
    m33.scaleY(y);
    m44.scaleY(y);

    alpha++;
    posx++;
    tint(255, alpha);
    image(ai, posx, posy);
  } 
  if (frameCount >= 144 && frameCount <= 240){
    alpha-=5;
    posx++;
    tint(255, alpha);
    image(ai, posx, posy);
  }
  if ( frameCount > 240 && frameCount <= 400){
    alpha++;
    tint(255, alpha);
    image(bruno, 0, 0);
  }
  /*
  if( frameCount > 400){
    alpha-=2;
    tint(255, alpha);
    image(bruno, 0, 0);
  }
  */ //<>//
  m4.display(color(150, 150, 150));
  m44.display(color(150, 150, 150));
  m3.display(color(122, 122, 122));
  m33.display(color(122, 122, 122));
  m2.display(color(105, 105, 105));
  m22.display(color(105, 105, 105));
  m1.display(color(84, 84, 84));
  m11.display(color(84, 84, 84));
  //image(bruno, 500, 0);
  // saveFrame("line-####.tif");
  
}
