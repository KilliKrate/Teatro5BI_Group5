Montagna m2;
Montagna m3;
Montagna m4;
Montagna m5;
PuntoLuminoso s;

public void settings() {
  size(1920, 1080);
}

void setup() {  
  m2 = new Montagna(480, height, width, 648, 1.4, 19, 40);
  m3 = new Montagna(0, 691, width, 907, 1.2, 20, 60);
  m4 = new Montagna(0, 497, width, 670, 1, 16, 80);
  m5 = new Montagna(0, 324, width, 389, 0.9, 14, 120);
  s = new PuntoLuminoso(width/2, m5.getMiddleY(), 50.0, 600.0, 200, 0, color(252, 183, 74), color(255, 132, 0));
  
  background(38, 42, 90);
  s.display();
  stroke(color(255, 132, 0));
  strokeWeight(4);
  m5.display(lerpColor(color(69, 65, 58), color(255, 132, 0), 0.3));
  noStroke();
  m4.display(lerpColor(color(99, 94, 83), color(255, 132, 0), 0.2));
  m3.display(lerpColor(color(153, 145, 130), color(255, 132, 0), 0.1));
  m2.scaleX(1, Direction.LEFT);
  m2.display(lerpColor(color(196, 186, 167), color(255, 132, 0), 0));

}
