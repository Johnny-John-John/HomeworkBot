class Slider {
  int x, y, val, maxval , r ; 
  String name ;
  boolean caught ; 
  Slider(String n, float X, float Y, int max) {
    name = n ; 
    x = int(X) ; 
    y = int(Y) ; 
    val = 0 ;
    maxval = max ;
    caught = false ; 
    r = 10 ; 
  }
  void display() { 
    stroke(60) ; 
    strokeWeight(5) ; 
    line( x, y, x + maxval , y) ; 
    if ( inside() || caught ) fill(70,70,240) ;
    else fill(40) ; 
    strokeWeight(2) ;
    circle( x + val, y, 2*r ) ; 
    //textSize(20) ; 
    textAlign(RIGHT, BOTTOM) ; 
    text(name, x, y ) ;  
    if ( inside() || caught ) { 
      textAlign(LEFT, TOP) ; 
      text(val, x + maxval, y ) ;
    }
  }
  boolean inside() { 
    return ( dist( mouseX - panx, mouseY-pany, x + val, y ) < r ) ;
  }
}
