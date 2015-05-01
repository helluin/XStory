import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

import codeanticode.syphon.*;


//-----------------------ToxicLibs calls.
//ArrayList for particles
ArrayList<Particle> particles;
//Attractor Class
Attractor attractor;
//Toxi particles
VerletPhysics2D physics;


//-----------------------Booleans
//boolean displayCross = false;  //displays calibration cross
//--Physics/Wind related Booleans
boolean rightWind=false;
boolean leftWind=false;
boolean noGrav = false;
boolean addGrav = false;
boolean addAttraction = false;
boolean deleteAttraction = false;
boolean showAttractor=false;

PGraphics canvas;

//--------Syphon
SyphonServer server;


//----------------------------------Setup
void setup() {
  size(800, 600, P3D);
  canvas = createGraphics(800, 600, P3D);

  //--------------Syphon
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");

  smooth();

  //-----------------Sets Up Physics
  physics = new VerletPhysics2D ();
  physics.setDrag(0.05f);
  physics.setWorldBounds(new Rect(0, 0, canvas.width, canvas.height+100));
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.2f)));

  particles = new ArrayList<Particle>();
  for (int i = 0; i < 300; i++) {
    particles.add(new Particle(new Vec2D(random(width), height), i));
  }

  attractor = new Attractor(new Vec2D(0, 0));
}

//----------------------------------Draw
void draw() {


  background(0);
  physics.update ();

  //--------------Physics Part 2 Attractor:
  attractor.lock();
  //if (calibrating==false) {
  attractor.set(mouseX, mouseY);
  //}

  canvas.beginDraw();
  //canvas.background(0);
  canvas.fill(0, 5);
  canvas.rect(0, 0, width, height); 
  canvas.fill(0, 255, 0);
  canvas.imageMode(CENTER);
  attractor.changeBehavior();
  if (showAttractor==true) {
    attractor.display();
  }

  pushStyle();
  canvas.colorMode(HSB, 100, 100, 100, 100);
  canvas.imageMode(CENTER);
  canvas.tint(100, 0, 100, 10);
  for (Particle p : particles) {
    p.display();
  }
  popStyle();
  canvas.endDraw();


  image(canvas, 0, 0);

  //----------Syphon
  server.sendImage(canvas);
}



void keyPressed() {




  if (key == 'r' || key == 'R') {
    rightWind=!rightWind;
  }

  if (key == 'l' || key == 'L') {
    leftWind=!leftWind;
  }

  if (key == 'u' || key == 'U') {
    noGrav=!noGrav;
  }

  if (key == 'g' || key == 'G') {
    addGrav=!addGrav;
  }

  if (key == 'a' || key == 'A') {
    addAttraction=!addAttraction;
  }

  if (key == 'd' || key == 'D') {
    deleteAttraction=!deleteAttraction;
  }


  if (key == 's') {
    showAttractor=!showAttractor;
  }
}
