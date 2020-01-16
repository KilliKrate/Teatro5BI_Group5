Montagna m1, m2, m3, m4, m11, m22,m33, m44;
CieloStellato cieloGrande;
PuntoLuminoso s;

float t, y, rectHeight;
int alpha = 0, posx = 0, posy = 0;
int scene1 = 480, scene2 = 960, scene3 = 1440;

public void settings() {
  size(1920, 1080);
}

void setup() {
  frameRate(24);
  m1 = new Montagna(0, 898, width/2, height, 1.4, 9, 40);
  m2 = new Montagna(0, 1007, width/2, 791, 1.2, 9, 60);
  m3 = new Montagna(0, 820, width/2, 647, 1, 6, 80);
  m4 = new Montagna(0, 539, width/2, 474, 1, 6, 120);
  
  m11 = new Montagna(width/2, height, width, 898, 1.4, 9, 40);
  m22 = new Montagna(width/2, 791, width, 1007, 1.2, 9, 60);
  m33 = new Montagna(width/2, 647, width, 820, 1, 6, 80);
  m44 = new Montagna(width/2, 474, width, 539, 1, 6, 120);
  
  s = new PuntoLuminoso(width/2, height, 50.0, 900.0, 200, 0, color(252, 183, 74), color(255, 132, 0));
  cieloGrande = new CieloStellato(750, 0, 3, 0, 2 * PI);
  cieloGrande.setSpeed(0.002);


}

void draw() {
  if (frameCount <= scene1) {
    background(lerpColor(color(252, 183, 74), color(38, 42, 90), map(frameCount, 0, scene1, 0.7, 1)));
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

    m4.display(lerpColor(color(252, 183, 74), color(150, 150, 150), map(frameCount, 0, scene1, 0.7, 1)));
    m44.display(lerpColor(color(252, 183, 74), color(150, 150, 150), map(frameCount, 0, scene1, 0.7, 1)));
    m3.display(lerpColor(color(252, 183, 74), color(122, 122, 122), map(frameCount, 0, scene1, 0.7, 1)));
    m33.display(lerpColor(color(252, 183, 74), color(122, 122, 122), map(frameCount, 0, scene1, 0.7, 1)));
    m2.display(lerpColor(color(252, 183, 74), color(105, 105, 105), map(frameCount, 0, scene1, 0.7, 1)));
    m22.display(lerpColor(color(252, 183, 74), color(105, 105, 105), map(frameCount, 0, scene1, 0.7, 1)));
    m1.display(lerpColor(color(252, 183, 74), color(84, 84, 84), map(frameCount, 0, scene1, 0.7, 1)));
    m11.display(lerpColor(color(252, 183, 74), color(84, 84, 84), map(frameCount, 0, scene1, 0.7, 1)));

    rectHeight = map(y, 0, 1, -height, 0);
    s.setY(m4.getLastY());
    
    fill(0, 0, 0);
    rect(0, height, width, rectHeight);
    noFill();
  } 

  if ( frameCount > scene1 && frameCount <= scene2) {
    background(lerpColor(color(38, 42, 90), color(#0d0f16), map(frameCount, scene1, scene2, 0, 1)), map(frameCount, scene1, scene2, 100, 0));
    
    pushMatrix();
    translate(width/2, height/4 - 100);
    cieloGrande.display((int)map(frameCount, (scene2-scene1)/2+scene1, scene2, 0, 255));  
    popMatrix();   
    
    t = map(frameCount, scene1, scene2, 1, 0);
    y = 1-pow(t, 2.6);
    
    s.setY(map(y, 0, 1, m4.getLastY(), height));
    s.setR2(map(frameCount, scene1, scene2, 900, 300));
    s.display();
    
    m4.display(lerpColor(color(150, 150, 150), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.8)));
    m44.display(lerpColor(color(150, 150, 150), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.8)));
    m3.display(lerpColor(color(122, 122, 122), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.8)));
    m33.display(lerpColor(color(122, 122, 122), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.8)));
    m2.display(lerpColor(color(105, 105, 105), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.8)));
    m22.display(lerpColor(color(105, 105, 105), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.8)));
    m1.display(lerpColor(color(84, 84, 84), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.8)));
    m11.display(lerpColor(color(84, 84, 84), color(#0d0f16), map(frameCount, scene1, scene2, 0, 0.8)));

  }
  
  if ( frameCount > scene2 && frameCount <= scene3){
    fill(color(13, 15, 22), map(frameCount, scene2, scene3, 10, 2));
    rect(0, 0, width, height);
    
    pushMatrix();
    translate(width/2, height/4 - 100);
    cieloGrande.display((int)map(frameCount, (scene2-scene1)/2+scene1, scene2, 0, 255));  
    popMatrix();    
    
    m4.display(lerpColor(color(150, 150, 150), color(#0d0f16), 0.8));
    m44.display(lerpColor(color(150, 150, 150), color(#0d0f16), 0.8));
    m3.display(lerpColor(color(122, 122, 122), color(#0d0f16), 0.8));
    m33.display(lerpColor(color(122, 122, 122), color(#0d0f16), 0.8));
    m2.display(lerpColor(color(105, 105, 105), color(#0d0f16), 0.8));
    m22.display(lerpColor(color(105, 105, 105), color(#0d0f16), 0.8));
    m1.display(lerpColor(color(84, 84, 84), color(#0d0f16), 0.8));
    m11.display(lerpColor(color(84, 84, 84), color(#0d0f16), 0.8));
  }  
  
  saveFrame("line-####.tif"); 

}
