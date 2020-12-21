ArrayList<PVector> points = new ArrayList<PVector>();


color black = color(10, 15, 13);
color white = color(196, 203, 202);
color blue = color(60, 187, 177);
color red = color(238, 66, 102);
color purp = color(42, 30, 92); 

int inCircle;
int outCircle;


void setup() {

  size(600, 600);
  background(white);
  strokeWeight(2);
  stroke(black);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
  strokeWeight(1);
  for (int i = 0; i < width; i += width/10) {
    line(0, i, width, i);
  }

  for (int i = 0; i < height; i += height/10) {
    line(i, 0, i, height);
  }

  ellipseMode(CENTER);
  pushMatrix();
  translate(width/2, height/2);
  fill(0, 0, 0, 0);
  stroke(blue);
  ellipse(0, 0, width, height);
  popMatrix();
}


void draw() {
  println("\n");
  stroke(red); 
  fill(red);
  strokeWeight(2);
  for (int i = 0; i < 1000; i++) {
    setDot();
  }
  println("Result " + frameCount);
  println("In Circle: " + inCircle);
  println("Total Points: " + (inCircle+outCircle));
  println("PI: " + 4f*inCircle/points.size());
}



void setDot() {
  points.add(new PVector(random(0, width), random(0, height)));
  PVector point = points.get(points.size()-1);
  ellipse(point.x, point.y, 2, 2);

  double num = Math.sqrt(Math.pow(point.x, 2) + Math.pow(point.y, 2));
  if (num < width) {
    inCircle++;
    fill(blue);
    ellipse(point.x, point.y, 1, 1);
  } else {
    outCircle++;
  }
}

void drawDot() {
  stroke(red); 
  fill(red);
  strokeWeight(2);
  for (PVector point : points) {
    ellipse(point.x, point.y, 3, 3);
  }
}
