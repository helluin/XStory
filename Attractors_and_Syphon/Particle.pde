

// class Spore extends the class "VerletParticle2D"
class Particle extends VerletParticle2D {

  PImage img1 = loadImage("image01.png");
  PImage img2 = loadImage("image02.png");
  PImage img3 = loadImage("image03.png");
  float r;
  int d;
  float rr;
  float g;
  float b;
  float a;
  float scale;

  Particle (Vec2D loc, int L) {

    super(loc);
    r = 20;
    d = L;

    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, 20, -1.2f, 0.01f));
    //physics.addBehavior(new GravityBehavior(new Vec2D(0, 0)));
    rr=random (254, 255);
    g=random (254, 255);
    b=random (254, 255);
    a=random(0, 100);
    scale = random(30, 100);
  }

  void display () {


    if (noGrav==true) {
      //physics.addBehavior(new GravityBehavior(new Vec2D(.01, 0)));
      //particle.addForce(wind);
      //physics.addBehavior(new ConstantForceBehavior(new Vec2D(.15, -.05)));
      physics.addBehavior(new ConstantForceBehavior(new Vec2D(0, -0.2f)));
      noGrav=false;
    }
    if (addGrav==true) {
      //physics.removeBehavior(ConstantForceBehavior);
      //physics.addBehavior(new ConstantForceBehavior(new Vec2D(-.15, .05)));
      physics.addBehavior(new ConstantForceBehavior(new Vec2D(0, 0.2f)));
      addGrav=false;
    }

    if (rightWind==true) {
      physics.addBehavior(new ConstantForceBehavior(new Vec2D(.15, -.05)));
      rightWind=false;
    }

    if (leftWind==true) {
      physics.addBehavior(new ConstantForceBehavior(new Vec2D(-.15, .05)));
      leftWind=false;
    }
    //canvas.noStroke();
    //canvas.fill(rr, g, b, a);
    //canvas.ellipse (x, y, 5, 5);
    int index = int(random(1, 3));


    switch(index) {
    case 1:

      canvas.image(img1, x, y, scale, scale);
      break;
    case 2:
      canvas.image(img2, x, y, scale, scale);
      break;
    case 3:
      canvas.image(img3, x, y, scale, scale);
      break;
    default:
      canvas.image(img1, x, y, scale, scale);
    }


    //canvas.noFill();
  }
}
