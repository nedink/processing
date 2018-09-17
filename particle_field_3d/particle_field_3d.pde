import java.util.Comparator;
import java.util.Arrays;

int depth;
Orb[] orbs;
//float[] xs, ys, zs;
int num;
float STROKE_WEIGHT;

void setup() {
  //size(200, 200, P3D);
  fullScreen(P3D);
  background(0);
  
  num = (int)(width * 0.1);
  DIST = width * 0.075;
  depth = (int)(width * 0.5);
  STROKE_WEIGHT = width * 0.001;

  //xs = new float[num]; 
  //ys = new float[num]; 
  //zs = new float[num];
  
  orbs = new Orb[num];
  
  for (int i = 0; i < num; ++i) {
    orbs[i] = new Orb(random(width) - width/2, 
      random(height) - height/2, 
      random(depth) - depth/2, 
      random(PI * 2), 
      random(PI * 2), 
      1,
      new xyz(width*1.5, height*1.5, depth*1.5));
    
    //xs[i] = random(width);
    //xs[i] -= width/2;
    //ys[i] = random(height);
    //ys[i] -= height/2;
    //zs[i] = random(depth);
    //zs[i] -= depth/2;
  }
}

float d = 0;
float r = 0;
float DIST;

void draw() {
  if (mousePressed)
    return;
    
  background(0);
  translate(width/2, height/2, depth/4);
  

  //rotateY((r++) * 0.01);
  
  //line(0, 0, 0, 0, height, 0);
  
  
  for (int i = 0; i < num; ++i) {
    orbs[i].step();
    //if (!mousePressed)
      
    
    //stroke(255);
    //strokeWeight(2);
    //point(xs[i], ys[i], zs[i]);
    //point(orbs[i].x, orbs[i].y, orbs[i].z);
    
    for (Orb o : orbs[i].dists.keySet()) {
      float dist = orbs[i].dists.get(o);
      if (dist > DIST)
        continue;
      float norm = norm(dist, DIST, 0);
        float val = norm * 255;
        //strokeWeight(norm(orbs[i].z, 0, orbs[i].range.z) * 10);
        strokeWeight(STROKE_WEIGHT);
        stroke(255, val);
        //line(xs[i], ys[i], zs[i], xs[j], ys[j], zs[j]);
        line(orbs[i].x, orbs[i].y, orbs[i].z, o.x, o.y, o.z);
    }
  }
}
