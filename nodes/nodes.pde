
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



int NODE_SIZE = 32;
ArrayList<Node> nodes = new ArrayList();
ArrayList<Edge> edges = new ArrayList();

XY down;
boolean clicked = false;
boolean drag = false;
Node toMove = null;
Node toExtend = null;
Edge newEdge = null;
Node dragNode = null;

XY lineExt = null;
Node lineExtNode = null;
Node newEdgeFrom = null;
Edge lineExtEdge = null;



void setup() {
  size(600, 400);
  background(0);
  frameRate(120);
  noLoop();
}



void draw() {

  background(0);

  noStroke();

  // draw nodes
  for (Node n : nodes) {
    // highlight node
    if (n == toMove)
      fill(250, 220);
    else
      fill(250, 150);
    ellipse(n.xy.x, n.xy.y, NODE_SIZE, NODE_SIZE);
  }

  // draw edge-extend handle
  if (toExtend != null) {
    float angle;
    angle = atan((mouseX - toExtend.xy.x) / (mouseY - toExtend.xy.y));
    
    if (toExtend.xy.y - mouseY > 0)
      angle += PI;
    
    float distX = sin(angle) * (NODE_SIZE - 16);
    float distY = cos(angle) * (NODE_SIZE - 16);
    fill(250, 220);
    ellipse(toExtend.xy.x + distX, toExtend.xy.y + distY, 12, 12);
  }
  
  if (newEdge != null) {
    strokeWeight(2);
    stroke(255, 220);
    line(toExtend.xy.x, toExtend.xy.y, mouseX, mouseY);
    
    return;
  }
}



void mousePressed() {

  down = new XY(mouseX, mouseY);

  // check if node clicked
  if (toMove != null) {
    dragNode = toMove;
    
    return;
  }
  
  nodes.add(new Node(down));

  redraw();
}

void mouseDragged() {
  
  if (down == null)
    return;
    
  if (dragNode != null) {
    dragNode.xy.x = down.x;
    dragNode.xy.y = down.y;
    redraw();
    down.x = mouseX;
    down.y = mouseY;
    
    return;
  }
  
  if (toExtend != null) {
    
  }
}

void mouseReleased() {
  dragNode = null;
}

void mouseMoved() {

  toMove = null;
  lineExt = null;
  lineExtNode = null;

  for (Node n : nodes) {
    float dist = dist(n.xy.x, n.xy.y, mouseX, mouseY);

    if (dist < NODE_SIZE / 2 - 4) {
      toMove = n;
    
    } else if (dist < NODE_SIZE / 2 + 16) {
      toExtend = n;
      
    }
    
  }

  redraw();
}
