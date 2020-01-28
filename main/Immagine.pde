/*
    Wrapper dell'oggetto PImage

    @author David Constantin Cirdan
*/


class Immagine{
  
  // Variabili dell'oggetto Immagine
  
  // Posizione nelle ascisse dell'oggetto
  float x;
  //Posizione nelle ordinate dell'oggetto
  float y;
  // Il filename dell'immagine che vogliamo utilizzare
  String fname;
  // Oggetto PImage di riferimento
  PImage img;
  
  // Eventuale array di interi per la maskArray
  // int pix[];
  
  // Primo constructor
  Immagine(String filename){
    this.fname = filename;
  }
  // Secondo constructor
  Immagine(float posx, float posy, String filename){
    this.x = posx;
    this.y = posy;
    this.fname = filename;
  }
  // Carico il file dell'immagine all'interno dell'oggetto PImage
  public void load( ){
    img = loadImage(this.fname);
  }
  // Disegno l'immagine sul canvas 
  // avendo come parametri l'oggetto e le sue posizioni in x e y
  public void display(){
     image(img, this.x, this.y);
  }
  // Applico un'immagine PImage come maschera all'immagine attualmente in uso
  public void maschera(PImage maskImg){
    img.mask(maskImg);
  }
  // Cambio la tinta dell'immagine rendendola più o meno trasparente oppure più o meno chiara
  public void setTint(int grayscale, float alpha){
    tint(grayscale, alpha);
  }
  // Tint con i colori
  public void setColoredTint( int r, int g, int b, float a){
    tint( r, g, b, a);
  }
  // Cambio la dimensione dell'immagine
  public void reSize(int w, int h){
    img.resize(w, h);
  }

  /*
  
  Questi sono i metodi per usare la funzione mask
  con la maskArray (valori alpha dell'immagine)
  al posto dell'oggetto PImage 
  
  public void loadPix(){
    int[] pix = new int[img.width * img.height - 1];
    this.pix = pix;
    img.loadPixels();
    for (int i = 0; i < (img.width * img.height); i++){
      this.pix[i] = int(alpha(pixels[i]));
    }
    img.updatePixels();
  }
  
  public int[] getPixels(int[] ptArr){
    for(int i = 0; i < ptArr.length; i++){
      ptArr[i] = this.pix[i];
    }
    return ptArr;
  }
  
  public int getDimension(){
    return (img.width * img.height);
  }
  
  */
  
  public float getX(){
    return this.x;  
  }
  
  public void setX(float newX){
    this.x = newX;
  }
  
  public float getY(){
    return this.y;
  }
  
  public void setY(float newY){
    this.x = newY;
  }
  
  public String getFname(){
    return this.fname;
  }
  public PImage getImg(){
    return img;
  }
  
  public int getWidth(){
    return img.width;
  }
  
  public int getHeight(){
    return img.height;
  }
  
}
