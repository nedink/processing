boolean clicked = false;

class XY {
  float x, y;
  XY(float x_, float y_) {
    x = x_;
    y = y_;
  }
}

class Node {
  XY xy;
  Node(XY xy_) {
    xy = xy_;
  }
}

class Edge {
  Node head;
  Node tail;
  Edge(Node h, Node t) {
    head = h;
    tail = t;
  }
}



ArrayList<Node> nodes = new ArrayList();
ArrayList<Edge> edges = new ArrayList();

XY down = new XY(0,0);
boolean drag = false;
Node dragNode = null;


void setup() {
  size(600, 400);
  background(0);
}



void draw() {
  
  background(0);
  
  noStroke();
  for (Node n : nodes) {
    if (dist(mouseX, mouseY, n.xy.x, n.xy.y) < 30) {
      // on node
      fill(250);
    } 
    else {
      fill(180);
    }
    ellipse(n.xy.x, n.xy.y, 30, 30);
  }
  
  if (dragNode != null) {
    
  }
  
}



void mousePressed() {
  
  down = new XY(mouseX, mouseY);
  drag = true;
  
  XY mouse = new XY(mouseX, mouseY);
  
  for (Node n : nodes) {
    if (dist(mouseX, mouseY, n.xy.x, n.xy.y) < 30) {
      
      return;
    } 
  }

  nodes.add(new Node(mouse));
}

void mouseReleased() {
  
}
