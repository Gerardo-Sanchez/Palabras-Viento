// Librerías de Box2D
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.common.*;

// El mundo de Box2D
Box2DProcessing box2d;

// Las clases de Box2D
ArrayList <Gota> gota;

ArrayList<Boundary> boundaries;

ArrayList<Hoja> hojas;

ArrayList <Caja> cajas;

PImage leaf1;
PImage leaf2;

// Las clases Pantalla
Pantalla inicio;
Pantalla p1;
Pantalla p2;
Pantalla p3;
Pantalla p4;
Pantalla fin;

//Variables globales
PFont font1;
int P = 0;
int j;

void setup(){
  size(1080, 720);
  
  // Inicializa las físicas de box2d y crea el mundo
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // Gravedad personalizada
  box2d.setGravity(0, -10);
  
  // Inicializa los objetos que usan Box2D 
  gota = new ArrayList<Gota>();
  
  boundaries = new ArrayList<Boundary>();
  
  boundaries.add(new Boundary(width/2,height-50,width/4.5,10,0));
  
  boundaries.add(new Boundary(700,height/2+32,10,height-150,-0.10 * HALF_PI));
  boundaries.add(new Boundary(380,height/2+32,10,height-150,0.10 * HALF_PI));
  
   hojas = new ArrayList<Hoja>();
  
  cajas = new ArrayList<Caja>();
  
  leaf1 = loadImage("Leaf1.png");
  leaf2 = loadImage("Leaf2.png");
  
  
  // Inicializa las clases Pantalla
  inicio = new Pantalla("Presiona A para continuar");
  p1 = new Pantalla("La Gota que colmo el Vaso");
  p2 = new Pantalla("Las Palabras se las lleva el Viento");
  fin = new Pantalla("THE END");  
  
  // Inicializa las fuentes
  font1 = loadFont("TimesNewRomanPSMT-150.vlw");
  
  j = 0;
}

void draw() {
  background(255);
  
  box2d.step();
  
  if(P == 0){
    inicio.inicio();
    
    fill(0);
    textSize(150);
    text("W O R D S", 180, height/2);
    
  }
  
  if(P == 1){
    
    p1.p1();
    
    for (int i = gota.size()-1; i>=0; i--){
     boolean r = gota.get(i).estaEnPantalla();
     if (r){
       gota.get(i).display();
     }
     else{
       gota.remove(i);
     }
   }
   println(gota.size());
   
   for (Boundary wall: boundaries) {
    wall.display();
  }
  
  textFont(font1);
   fill(255);
   textSize(15);
   textAlign(CENTER);
   text("nadie cuenta las gotas.\n\nCuando una chica llora\n\n\ncolmo el vaso.\n\nPero esto fue la gota que\n\n\ny yo tampoco.\n\nÉl no es perfecto\n\n\npero eso no evitará que pase.\n\nYo confíe que esto no pasaría\n\n\nnadie cuenta las gotas.\n\nCuando la lluvia cae", width/2, 270);
   
   if(gota.size() >= 3){
     fill(200);
     textSize(20);
     text("Presiona A para continuar", 900,670);
   }
   
  }
  
  if(P == 2){
    
    p2.p2();
    
    for (int i = cajas.size()-1; i>=0; i--){
   boolean r = cajas.get(i).estaEnPantalla();
   if (r){
     cajas.get(i).display();
   }
   else{
     cajas.remove(i);
   }
 }
 
 for (Caja b: cajas) {
   Vec2 wind = new Vec2(50,0);
   b.applyForce(wind);
  }
 

  // When the mouse is clicked, add a new Box object
  if (random(4) < 0.1) {
    Hoja p = new Hoja(-5,random(height));
    hojas.add(p);
  }
  
  for (Hoja b: hojas) {
   Vec2 wind = new Vec2(50,0);
   b.applyForce(wind);
  }
    
  // Display all the boxes
    for (Hoja b: hojas) { 
      
    b.display1();
    }

  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = hojas.size()-1; i >= 0; i--) {
    Hoja b = hojas.get(i);
    if (b.done()) {
      hojas.remove(i);
    }
  }
  
  println(j);
  
  textAlign(LEFT);
    
    pushMatrix();
    fill(223);
    noStroke();
    rect(220, 95, 160, 30, 10);
    
    fill(0);
    textFont(font1);
    textSize(19);
    text("¿Cómo pudiste...?", 150, 100);
    popMatrix();
  
  if(j >= 3 && j < 35){
    
    pushMatrix();
    fill(223);
    noStroke();
    rect(260, 145, 240, 30, 10);
    
    fill(0);
    textFont(font1);
    textSize(19);
    text("¿Crees que eso es suficiente?", 150, 150);
    
    popMatrix();
  }
  
  if(j >= 7 && j < 35) {
     
    pushMatrix();
    fill(223);
    noStroke();
    rect(260, 225, 240, 90, 10);
    
    fill(0);
    textFont(font1);
    textSize(19);
    text("Me heriste ¿de acuerdo?\nNo creas que unas cuantas\npalabras van a cambiar eso.", 150, 205);
    
    popMatrix();
   }
   
   if(j >= 13 && j < 35) {
    
    pushMatrix();
    fill(223);
    noStroke();
    rect(230, 320, 180, 60, 10);
    
    fill(0);
    textFont(font1);
    textSize(19);
    text("Las acciones tienen\nconsecuencias.", 150, 315);
    
    popMatrix();
   }
   
   if(j >= 17 && j < 35) {
    
    pushMatrix();
    fill(223);
    noStroke();
    rect(230, 400, 180, 60, 10);
    
    fill(0);
    textFont(font1);
    textSize(19);
    text("Te di mi confianza\ny tu solo...", 150, 395);
    
    popMatrix();
   }
   
   if(j >= 23 && j < 35) {
     
    pushMatrix();
    fill(223);
    noStroke();
    rect(210, 480, 140, 60, 10);
    
    fill(0);
    textFont(font1);
    textSize(19);
    text("Esto se acabo.\n¡Me largo!", 150, 475);
    
    popMatrix();
   }
   
   if(j >= 31 && j < 35) {
     
    pushMatrix();
    fill(223);
    noStroke();
    rect(210, 550, 140, 30, 10);
    
    fill(0);
    textFont(font1);
    textSize(19);
    text("Déjame en paz.", 150, 555);
    
    popMatrix();
   }
   
   if(j >= 35) {
    
    pushMatrix();
    fill(223);
    noStroke();
    rect(260, 95, 245, 30, 10);
    
    fill(0);
    textFont(font1);
    textSize(19);
    text("Este usuario te ha bloqueado.", 150, 100);
    
    popMatrix();
   }
   
  }
  
  if(P >= 3){
    fin.fin();
  }
  
}

void keyPressed(){
  if(keyPressed){
    if(key == 'a' || key == 'A'){
      P = P + 1;
      
    }
  }
}

void mousePressed(){
  if(P == 1){
    Gota c = new Gota(mouseX,mouseY);
    gota.add(c);
  }
  
  if(P == 2){
    j = j + 1;
  
    if(j <= 35){
      Caja c = new Caja(mouseX,mouseY, 90,30);
      cajas.add(c);
    }
    else {
    }
  }
}
