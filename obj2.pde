class Montagna { //<>//
  
  float roughness;
  float displacement;
  float[][] points;
  
  public Montagna(float x1, float y1, float x2, float y2, float roughness, int distance) {
    this.displacement = abs(y1 - y2);
    this.roughness = roughness;
    this.points = new float[int(pow(2, distance)+1)][2];
    
    this.points[0][0] = x1;
    this.points[0][1] = y1;
    this.points[points.length - 1][0] = x2;
    this.points[points.length - 1][1] = y2;
    
    this.points = this.computeDisplacement(points);
  }
  
  public Montagna(float x1, float y1, float x2, float y2, float roughness, int distance, float displacement) {
    this.displacement = displacement;
    this.roughness = roughness;
    this.points = new float[int(pow(2, distance)+1)][2];
    
    this.points[0][0] = x1;
    this.points[0][1] = y1;
    this.points[points.length - 1][0] = x2;
    this.points[points.length - 1][1] = y2;
    
    this.points = this.computeDisplacement(points);
  }
  
  public float[][] computeDisplacement(float[][] ptArr) {
    
    int i = 0;
    int dist = ptArr.length - 1;
    while (dist != 1.0) {
      while (true) {
        if (ptArr[int(this.avg(i, i+dist))][0] == 0.0) {
          ptArr[int(this.avg(i, i+dist))][0] = this.avg(ptArr[i][0], ptArr[i+dist][0]); //<>//
          ptArr[int(this.avg(i, i+dist))][1] = this.avg(ptArr[i][1], ptArr[i+dist][1]) + (int(random(0, 2)) == 1 ? this.displacement : -this.displacement); //<>//
        }
        
        if (i+dist == ptArr.length-1) {
          break; 
        } else
          i += dist;
      }
      i = 0;
      dist /= 2;
      this.displacement *= pow(2, -this.roughness);;
    }
    
    return ptArr;
  }
  
  public void display() {
    noStroke();
    noFill();
    beginShape();
    for (int i = 0; i < this.points.length; i++) {
      vertex(this.points[i][0], this.points[i][1]);
    }
    endShape();
  }
  
  public void display(float canvasHeight, color colore) {
    noStroke();
    fill(colore);
    beginShape();
    vertex(this.points[0][0], canvasHeight);
    for (int i = 0; i < this.points.length; i++) {
      vertex(this.points[i][0], this.points[i][1]);
    }
    vertex(this.points[this.points.length-1][0], canvasHeight);
    endShape(CLOSE);
  }
  
  public float[] getMidpoint(float x1, float y1, float x2, float y2) {
    float[] midpoint = new float[]{this.avg(x1, x2), this.avg(y1, y2)};
    return midpoint;
  }
  
  private float avg(float n1, float n2){
    return (n1+n2)/2;
  }
  
  private float avg(int n1, int n2){
    return (n1+n2)/2;
  }
  
}
