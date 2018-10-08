class Gota {

  // We need to keep track of a Body and a radius
  Body body;
  float r;
  
  color col;
  
  Gota(float x, float y) {
    r = random(7, 13);
    
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x,y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;
    
    // Attach fixture to body
    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));

    col = color(154, 219, 232);
  }

  // This function removes the particle from the box2d world
  void eliminaElBody(){
    //esta función de box2D elimina el atributo body de mi objeto de Box2D;
    box2d.destroyBody(body);
  }
  
  boolean estaEnPantalla(){
    //esta función evalúa si el objeto está dentro de los límites de la pantalla
    Vec2 posicion = box2d.getBodyPixelCoord(body);
    if(posicion.y>height+max(r,r) || P == 2){
      eliminaElBody();
      return false;
    }
    else{
      return true;
    }
  }

  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(col);
    noStroke();
    ellipse(0,0,(r*2) + 7,(r*2) + 6.5);
    popMatrix();
  }


}
