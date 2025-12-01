// Torr Hardin, Janame Lindberg | Nov 12, 2025 | Prison Escape

Player p1;
Map m1;
Security s1;

PImage bg1, go1;

boolean wPressed, aPressed, sPressed, dPressed, play;

void setup() {
  fullScreen();

  m1 = new Map();
  p1 = new Player(width/2, height/2);
  s1 = new Security(200, 200);

  bg1 = loadImage("Prison Escape Start Screen.png");
  go1 = loadImage("Prison End Screen.png");

  play = false;
}

void draw() {
  if (!play) {
    startScreen();
    return;
  }

  background(0);

  // Display world
  pushMatrix();

  // CAMERA
  translate(width/2 - p1.x, height/2 - p1.y);

  // WORLD
  m1.display();
  s1.display();
  p1.display();

popMatrix();


  // Update movement
  float speed = 30;
  if (wPressed) p1.move(0, -speed);
  if (sPressed) p1.move(0,  speed);
  if (aPressed) p1.move(-speed, 0);
  if (dPressed) p1.move( speed, 0);

  // Check collisions
  gameOver();
}

void keyPressed() {
  if (key == 'w' || key == 'W') wPressed = true;
  if (key == 's' || key == 'S') sPressed = true;
  if (key == 'a' || key == 'A') aPressed = true;
  if (key == 'd' || key == 'D') dPressed = true;

  if (!play && key == ' ') play = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wPressed = false;
  if (key == 's' || key == 'S') sPressed = false;
  if (key == 'a' || key == 'A') aPressed = false;
  if (key == 'd' || key == 'D') dPressed = false;
}

void startScreen() {
  image(bg1, 0, 0, width, height);
}


boolean collideRect(float x1, float y1, float w1, float h1,
                    float x2, float y2, float w2, float h2) {

  return !(x1 + w1 < x2 ||
           x1 > x2 + w2 ||
           y1 + h1 < y2 ||
           y1 > y2 + h2);
}

// Collision Detection
void gameOver() {

  // --- Player hitbox ---
  float pX = p1.x - p1.r;
  float pY = p1.y - p1.r;
  float pW = p1.w;
  float pH = p1.h;

  // --- Security hitbox ---
  float sX = s1.x - s1.r;
  float sY = s1.y - s1.r;
  float sW = s1.r * 2;
  float sH = s1.r * 2;

  // --- Collision ---
  if (collideRect(pX, pY, pW, pH, sX, sY, sW, sH)) {
    image(go1, 0, 0, width, height);
    noLoop();
  }
}
