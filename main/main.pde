PImage ai, bruno, mask;
Montagna m1, m2, m3, m4, m11, m22,m33, m44;
PuntoLuminoso s;

float t, y, rectHeight;
int alpha = 0, posx = 0, posy = 0;
int scene1 = 240/5, scene2 = 480/5, scene3 = 720/5;

public void settings() {
  size(1920, 1080);
}

void setup() {
  frameRate(24);
  m1 = new Montagna(0, 748, width/2, height, 1.4, 9, 40);
  m2 = new Montagna(0, 1007, width/2, 791, 1.2, 9, 60);
  m3 = new Montagna(0, 770, width/2, 597, 1, 6, 80);
  m4 = new Montagna(0, 489, width/2, 424, 0.9, 6, 120);

  m11 = new Montagna(width/2, height, width, 748, 1.4, 9, 40);
  m22 = new Montagna(width/2, 791, width, 1007, 1.2, 9, 60);
  m33 = new Montagna(width/2, 597, width, 770, 1, 6, 80);
  m44 = new Montagna(width/2, 424, width, 489, 0.9, 6, 120);
  s = new PuntoLuminoso(width/2, height, 50.0, 900.0, 200, 0, color(252, 183, 74), color(255, 132, 0));

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
  if (frameCount <= scene1) {
    background(38, 42, 90);
    s.display();    
    t = map(frameCount, 0, scene1, 1, 0);
    y = 1-pow(t, 2.6);
        
    m1.scaleY(y);
    m2.scaleY(y);
    m3.scaleY(y);
    m4.scaleY(y);
    m11.scaleY(y);
    m22.scaleY(y);
    m33.scaleY(y);
    m44.scaleY(y);

    m4.display(color(150, 150, 150));
    m44.display(color(150, 150, 150));
    m3.display(color(122, 122, 122));
    m33.display(color(122, 122, 122));
    m2.display(color(105, 105, 105));
    m22.display(color(105, 105, 105));
    m1.display(color(84, 84, 84));
    m11.display(color(84, 84, 84));

    alpha++;
    posx++;
    tint(255, alpha);
    image(ai, posx, posy);

    rectHeight = map(y, 0, 1, -height, 0);
    s.setY(m4.getLastY());
    
    fill(color(252, 183, 74), 255/4);
    rect(0, 0, width, height);
    noFill();
    
    fill(0, 0, 0);
    rect(0, height, width, rectHeight);
    noFill();
  } 

  if ( frameCount > scene1 && frameCount <= scene2) {
    background(lerpColor(color(38, 42, 90), color(#0d0f16), map(frameCount, scene1, scene2, 0, 1)));
    s.setY(map(frameCount, scene1, scene2, m4.getLastY(), height));
    s.setR2(map(frameCount, scene1, scene2, 900, 300));
    s.display();
    
    m4.display(color(150, 150, 150));
    m44.display(color(150, 150, 150));
    m3.display(color(122, 122, 122));
    m33.display(color(122, 122, 122));
    m2.display(color(105, 105, 105));
    m22.display(color(105, 105, 105));
    m1.display(color(84, 84, 84));
    m11.display(color(84, 84, 84));

    alpha-=5;
    posx++;
    tint(255, alpha);
    image(ai, posx, posy);
    
    fill(lerpColor(color(252, 183, 74), color(#0d0f16), map(frameCount, scene1, scene2, 0, 1)), map(frameCount, scene1, scene2, 255/4, 255/1.5));
    rect(0, 0, width, height);
    noFill();
  }

  if ( frameCount > scene2 && frameCount <= scene3){
    alpha++;
    tint(255, alpha);
    image(bruno, 0, 0);
  }  
  
  //saveFrame("line-####.tif"); 

}
