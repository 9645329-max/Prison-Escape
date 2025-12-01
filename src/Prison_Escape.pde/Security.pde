class Security {
  float x, y;
  float r = 40;     // used as a base size
  float w, h;       // actual rectangular hitbox
  PImage s2;

  Security(float x, float y) {
    s2 = loadImage("guard 1.png");
    this.x = x;
    this.y = y;

    w = r * 2;        // width of sprite
    h = r * 3.2;      // height of sprite
  }

  void display() {
    image(s2, x - r, y - r, w, h);
  }

  void move(float dx, float dy) {
    x += dx;
    y += dy;
  }
}
