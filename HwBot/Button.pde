class Button { 
  float x, y, bx, by ;
  String name ; 
  color c ; 
  Button(String temp_name, float temp_x, float temp_y , float bxx , float byy ) { 
    name = temp_name ;
    c = color(0,0,0) ;
    x = temp_x ; 
    y = temp_y ; 
    bx = bxx ; 
    by = byy ; 
  }
  Button(color temp_c , float temp_x, float temp_y) { 
    name = null ;
    c = temp_c ;
    x = temp_x ; 
    y = temp_y ; 
  }
  void display() { 
    stroke(230);
    if ( inside() ) fill(200, 0, 240 ) ; 
    else fill(50) ; 
    rectMode(CENTER) ;
    textAlign( CENTER , CENTER ) ; 
    rect( x, y, 2*bx, 2*by ) ;
    fill(250) ; 
    text(name, x, y) ;
  }
  boolean inside() { 
    return ( mouseX - panx > x - bx 
    && mouseX - panx < x + bx 
    && mouseY - pany > y - by 
    && mouseY - pany < y + by ) ;
  }
}
