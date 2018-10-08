// Las pantallas del programa

class Pantalla{
  
  String t;
  
  Pantalla(String t_){
    t = t_;
  }
  
  void inicio(){
    noStroke();
    fill(255);
    rect(0, 0, 1080, 720);
    textFont(font1);
    fill(210);
    textSize(25);
    text(t, 430, 550);
  }
  
  void p1(){
    noStroke();
    fill(255);
    rect(0, 0, 1080, 720);
    textFont(font1);
    fill(210);
    textSize(25);
    text(t, 170, 30);
  }
  
  void p2(){
    noStroke();
    fill(255);
    rect(0, 0, 1080, 720);
    textFont(font1);
    fill(210);
    textSize(25);
    text(t, 30, 30);
  }

  void fin(){
    noStroke();
    fill(255);
    rect(0, 0, 1080, 720);
    textFont(font1);
    fill(210);
    textSize(50);
    text(t, 440, 50);
  }
  
  void display(){
  }
  
}
