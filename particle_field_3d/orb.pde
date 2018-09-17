class xyz {
  float x, y, z;
  xyz(float x_, float y_, float z_) {
    x = x_;
    y = y_;
    z = z_;    
  }
}

class Orb {
  float x, y, z, dx, dy, dz, angle1, angle2, vel;
  xyz range;
  HashMap<Orb, Float> dists = new HashMap();
  
  Orb(float x_, float y_, float z_, float angle1_, float angle2_, float vel_, xyz range_) {
    x = x_;
    y = y_;
    z = z_;
    angle1 = angle1_;
    angle2 = angle2_;
    vel = vel_;
    range = range_;
  }
  
  void step() {
    dx = cos(angle1) * vel;
    dy = sin(angle1) * vel;
    dy = cos(angle2) * vel;
    x += dx;
    y += dy;
    z += dz;
    
    // wrap
    if (x < -range.x/2) 
      x = range.x/2;
    if (x > range.x/2)
      x = -range.x/2;
    if (y < -range.y/2)
      y = range.y/2;
    if (y > range.y/2)
      y = -range.y/2;
    if (z < -range.z/2)
      z = range.z/2;
    if (z > range.z/2)
      z = -range.z/2;
      
    
    for (int i = 0; i < orbs.length; i++) {
      if (orbs[i] == this)
        continue;
      
      float dist = dist(this.x, this.y, this.z, orbs[i].x, orbs[i].y, orbs[i].z);
      dists.put(orbs[i], dist);
    }
  }
}
