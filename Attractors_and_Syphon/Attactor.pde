class Attractor extends VerletParticle2D {

  float r;

  Attractor (Vec2D loc) {
    super (loc);
    r = 50;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, 600, 0.3f));
  }

  void changeBehavior () {
    if (deleteAttraction==true) {
      println("deleting attraction");
      physics.addBehavior(new AttractionBehavior(this, 600, -0.3f));
      deleteAttraction=false;
    }

    if (addAttraction==true) {
      println("adding attraction");
      physics.addBehavior(new AttractionBehavior(this, 600, 0.3f));
      addAttraction=false;
    }
  }

  void display () {
    canvas.fill(255);
    canvas.ellipse (x, y, r*2, r*2);
  }
}
