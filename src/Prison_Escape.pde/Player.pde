class Player {
  float x, y;
  float r = 40;
  float w, h;
  PImage p2;

  Player(float x, float y) {
    p2 = loadImage("prisoner 1.png");
    this.x = x;
    this.y = y;

    w = r * 2;     
    h = r * 3.2;    
  }

  void display() {
    image(p2, x - r, y - r, w, h);
  }

  void move(float dx, float dy) {
    x += dx;
    y += dy;
  }
}
