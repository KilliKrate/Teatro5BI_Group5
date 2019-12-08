
//Montagna m1 = new Montagna(25.0, 500.0, 1000.0, 500.0, 1.0, 16, 300); //<>//
PuntoLuminoso s = new PuntoLuminoso(500.0, 250.0, 50.0, 600.0, 200, 0, color(252, 183, 74), color(255, 132, 0));
Montagna m2 = new Montagna(250, 500, 1000, 300, 1.4, 18, 20);
Montagna m3 = new Montagna(0, 320, 1000, 420, 1.2, 18, 30);
Montagna m4 = new Montagna(0, 230, 1000, 310, 1, 14, 50);
Montagna m5 = new Montagna(0, 150, 1000, 180, 0.9, 12, 60);

public void settings() {
  size(1000, 500);
}

void setup() {
  background(38, 42, 90);
  
  s.display();
  m5.display(500, color(69, 65, 58));
  m4.display(500, color(99, 94, 83));
  m3.display(500, color(153, 145, 130)); //<>//
  m2.display(500, color(196, 186, 167));
}

void draw() {
  
}
