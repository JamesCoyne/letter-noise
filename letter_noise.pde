void setup(){
  size(800,800);
  pixelDensity(displayDensity());
  smooth(16);
  //frameRate(10);
  
  terrain = new float[round(cols)][round(rows)];
   textSize(scl);
}

float cols = 40;
float rows = 40;
float scl = 20;
float flying = 0;
float[][] terrain;

void draw(){
 
    float yoff = 0;
for(int y = 0; y < rows; y++){
  float xoff = 0;
  for(int x = 0; x < cols; x++){
    float current = map(noise(xoff,yoff,(float)frameCount/200)*1.5,0,1,65,89) ;
    terrain[x][y] = current;
     xoff += 0.005;
  }
  yoff += 0.005;
}
  
  background(0);
  translate(0,scl-5);
  for(int x = 0; x < cols; x++){
    for(int y = 0; y < rows; y++){
      text(char(round(terrain[x][y])),x*scl,y*scl);
    }
  }
  println((float)frameCount/60);
  saveFrame("ss/####.png");
}