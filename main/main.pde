Montagna[][] montagne;
CieloStellato cieloGrande;
PuntoLuminoso s;
Immagine ai, aimask;
color[] colori;
// Intero che calcola la variazione della trasparenza delle immagini
int alphaImage;

float t, y, rectHeight;
int scene1 = 480, scene2 = 960, scene3 = 1440;

public void settings() {
  size(1920, 1080);
}

void setup() {
  frameRate(24);
  
  montagne = new Montagna[4][2];
  
  montagne[0][0] = new Montagna(0, 898, width/2, height, 1.4, 9, 40, color(#000000));
  montagne[0][1] = new Montagna(width/2, height, width, 898, 1.4, 9, 40, color(#000000));
  montagne[1][0] = new Montagna(0, 1007, width/2, 791, 1.2, 9, 60, color(#000000));
  montagne[1][1] = new Montagna(width/2, 791, width, 1007, 1.2, 9, 60, color(#000000));
  montagne[2][0] = new Montagna(0, 820, width/2, 647, 1, 6, 80, color(#000000));
  montagne[2][1] = new Montagna(width/2, 647, width, 820, 1, 6, 80, color(#000000));
  montagne[3][0] = new Montagna(0, 539, width/2, 474, 1, 6, 120, color(#000000));
  montagne[3][1] = new Montagna(width/2, 474, width, 539, 1, 6, 120, color(#000000));
  
  s = new PuntoLuminoso(width/2, height, 50.0, 900.0, 200, 0, color(252, 183, 74), color(255, 132, 0));
  cieloGrande = new CieloStellato(750, 0, 3, 0, 2 * PI);
  cieloGrande.setSpeed(0.002);
  
  // Definisco i due oggetti Immagine, una l'immagine vera e propria, e l'altra la sua maschera
  
  ai = new Immagine(0, 0, "ai.jpg");
  aimask = new Immagine(0, 0, "ai_mask.png");
  
  // Carico le immagini
  
  ai.load();
  aimask.load();
  
  // Rimpicciolisco le immagini
  
  ai.reSize(ai.getWidth() / 2, ai.getHeight() / 2);
  aimask.reSize(aimask.getWidth() / 2, aimask.getHeight() / 2);
  
  // Applico la maschera
  
  ai.maschera(aimask.getImg());
}

void draw() {
 
  if (frameCount <= scene1) {
    background(lerpColor(color(252, 183, 74), color(38, 42, 90), map(frameCount, 0, scene1, 0.7, 1)));
    s.display();    
    t = map(frameCount, 0, scene1, 1, 0);
    y = 1-pow(t, 2.6);
    
    // Sposto l'immagine sull'asse x
    ai.setX(frameCount * 2);
    // Sposto la sua maschera
    aimask.setX(frameCount * 2);
    // Rendo la maschera trasparente
    aimask.setTint(255, 0);
    // Disegno la maschera
    aimask.display();
    
    // Test per vedere la dinamicità della trasparenza
    if (frameCount <= 50){
      alphaImage += 1;
      ai.setTint(255, alphaImage);
      ai.display();
    }
    else if(frameCount > 50 && frameCount <= 100){
      ai.setTint(255, alphaImage);
      ai.display();
    }
    else{
      alphaImage -= 1;
      ai.setTint(255, alphaImage);
      ai.display(); 
    }

    montagne[0][0].setColour(lerpColor(color(242, 176, 102), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));
    montagne[0][1].setColour(lerpColor(color(242, 176, 102), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));
    montagne[1][0].setColour(lerpColor(color(177, 91, 58), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));
    montagne[1][1].setColour(lerpColor(color(177, 91, 58), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));
    montagne[2][0].setColour(lerpColor(color(110, 44, 28), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));
    montagne[2][1].setColour(lerpColor(color(110, 44, 28), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));
    montagne[3][0].setColour(lerpColor(color(50, 19, 25), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));
    montagne[3][1].setColour(lerpColor(color(50, 19, 25), color(255, 132, 0), map(frameCount, 0, scene1, 0.5, 0.3)));
    
    for (Montagna[] m : montagne) {
      m[0].scaleY(y);
      m[1].scaleY(y);
    }
    
    for (int i = 3; i >= 0; i--) {
       montagne[i][0].display();
       montagne[i][1].display();
    }

    rectHeight = map(y, 0, 1, -height, 0);
    s.setY(montagne[3][0].getLastY());
    
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
    
    s.setY(map(y, 0, 1, montagne[3][0].getLastY(), height));
    s.setR2(map(frameCount, scene1, scene2, 900, 300));
    s.display();
    
    float halfScene = scene1+(scene2-scene1)/4;
    
    if (frameCount < halfScene) {
      montagne[0][0].setColour(lerpColor(color(242, 176, 102), color(255, 132, 0), map(frameCount, scene1, halfScene, 0.3, 0)));
      montagne[0][1].setColour(lerpColor(color(242, 176, 102), color(255, 132, 0), map(frameCount, scene1, halfScene, 0.3, 0)));
      montagne[1][0].setColour(lerpColor(color(177, 91, 58), color(255, 132, 0), map(frameCount, scene1, halfScene, 0.3, 0)));
      montagne[1][1].setColour(lerpColor(color(177, 91, 58), color(255, 132, 0), map(frameCount, scene1, halfScene, 0.3, 0)));
      montagne[2][0].setColour(lerpColor(color(110, 44, 28), color(255, 132, 0), map(frameCount, scene1, halfScene, 0.3, 0)));
      montagne[2][1].setColour(lerpColor(color(110, 44, 28), color(255, 132, 0), map(frameCount, scene1, halfScene, 0.3, 0)));
      montagne[3][0].setColour(lerpColor(color(50, 19, 25), color(255, 132, 0), map(frameCount, scene1, halfScene, 0.3, 0)));
      montagne[3][1].setColour(lerpColor(color(50, 19, 25), color(255, 132, 0), map(frameCount, scene1, halfScene, 0.3, 0)));
    } else {
      montagne[0][0].setColour(lerpColor(color(242, 176, 102), color(#0d0f16), map(frameCount, halfScene, scene2, 0, 0.8)));
      montagne[0][1].setColour(lerpColor(color(242, 176, 102), color(#0d0f16), map(frameCount, halfScene, scene2, 0, 0.8)));
      montagne[1][0].setColour(lerpColor(color(177, 91, 58), color(#0d0f16), map(frameCount, halfScene, scene2, 0, 0.8)));
      montagne[1][1].setColour(lerpColor(color(177, 91, 58), color(#0d0f16), map(frameCount, halfScene, scene2, 0, 0.8)));
      montagne[2][0].setColour(lerpColor(color(110, 44, 28), color(#0d0f16), map(frameCount, halfScene, scene2, 0, 0.8)));
      montagne[2][1].setColour(lerpColor(color(110, 44, 28), color(#0d0f16), map(frameCount, halfScene, scene2, 0, 0.8)));
      montagne[3][0].setColour(lerpColor(color(50, 19, 25), color(#0d0f16), map(frameCount, halfScene, scene2, 0, 0.8)));
      montagne[3][1].setColour(lerpColor(color(50, 19, 25), color(#0d0f16), map(frameCount, halfScene, scene2, 0, 0.8)));
    }
    
    for (int i = 3; i >= 0; i--) {
       montagne[i][0].display();
       montagne[i][1].display();
    }

  }
  
  if ( frameCount > scene2 && frameCount <= scene3){
    fill(color(13, 15, 22), map(frameCount, scene2, scene3, 10, 2));
    rect(0, 0, width, height);
    
    pushMatrix();
    translate(width/2, height/4 - 100);
    cieloGrande.display((int)map(frameCount, (scene2-scene1)/2+scene1, scene2, 0, 255));  
    popMatrix();
    
    montagne[0][0].setColour(lerpColor(color(242, 176, 102), color(#0d0f16), 0.8));
    montagne[0][1].setColour(lerpColor(color(242, 176, 102), color(#0d0f16), 0.8));
    montagne[1][0].setColour(lerpColor(color(177, 91, 58), color(#0d0f16), 0.8));
    montagne[1][1].setColour(lerpColor(color(177, 91, 58), color(#0d0f16), 0.8));
    montagne[2][0].setColour(lerpColor(color(110, 44, 28), color(#0d0f16), 0.8));
    montagne[2][1].setColour(lerpColor(color(110, 44, 28), color(#0d0f16), 0.8));
    montagne[3][0].setColour(lerpColor(color(50, 19, 25), color(#0d0f16), 0.8));
    montagne[3][1].setColour(lerpColor(color(50, 19, 25), color(#0d0f16), 0.8));
    
    for (int i = 3; i >= 0; i--) {
       montagne[i][0].display();
       montagne[i][1].display();
    }
  }  
  
  // saveFrame("line-####.tif"); 
}
