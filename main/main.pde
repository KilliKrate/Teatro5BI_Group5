Montagna m1, m2, m3, m4, m11, m22,m33, m44;
PuntoLuminoso s;

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
  }
   //<>//
  m4.display(color(150, 150, 150));
  m44.display(color(150, 150, 150));
  m3.display(color(122, 122, 122));
  m33.display(color(122, 122, 122));
  m2.display(color(105, 105, 105));
  m22.display(color(105, 105, 105));
  m1.display(color(84, 84, 84));
  m11.display(color(84, 84, 84));
  
  saveFrame("line-####.tif");
  
}
