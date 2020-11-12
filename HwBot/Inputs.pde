boolean pasting = false ;
void mousePressed() { 
  if ( mouseButton == RIGHT ) {
    panning = true; 
    panedx += mouseX; 
    panedy += mouseY;
  }
  if ( mouseButton == LEFT ) {
    for (Slider s : sliders) { 
      if ( s.inside() ) {
        //caughtsomething = true; 
        s.caught = true;
      }
    }
   // if ( !caughtsomething ) {
      
        cursorx = mouseX - panx ; 
        cursory = mouseY - pany ;
      
      ss.add( new stringing(int(cursorx), int(cursory)));
    //}
  }
}

void mouseDragged() { 
  if ( panning ) {
    panx = mouseX - panedx ; 
    pany = mouseY - panedy ;
  } else { 
    for (Slider s : sliders) { 
      if ( s.caught ) {
        s.val = int(mouseX - panx - s.x); 
        s.val = constrain( s.val, 0, s.maxval );
      }
    }
  }
}

void mouseReleased() { 
  //caughtsomething = false; 
  for (Slider s : sliders) { 
    s.caught = false;
  }
  if ( panning ) { 
    panning = false;
    panedx = -panx ; 
    panedy = -pany ;
  }
}

void keyPressed() { 
  if ( key == 8 ) ss.get(ss.size()-1).remove(); 
  if ( key == 126 ) saveWork() ;       
  if ( key == '*' ) { 
    String t = (String) getFromClipboard(DataFlavor.stringFlavor); 
    for ( int i = 0; i < t.length(); i++ ) {
      ss.get(ss.size()-1).add(t.charAt(i));
    }
  }
  if ( key == '`' ) {
    zoomscale = 1 ; 
    panning = false; 
    panx = panedx = pany = panedy = 0 ; 
    return;
  } 
  if ( key == TAB ) showui = !showui ;
  if ( key > 8 && key < 126 && !pasting ) ss.get(ss.size()-1).add(key);
}

float zoomscale = 1 ; 
void mouseWheel(MouseEvent event) {   
  zoomscale -= event.getCount()/50.0 ;
  //zoomscale = constrain( zoomscale , 0.5 , 5 ) ;
}

void scopezoom() {
  if ( mouseButton == CENTER ) {
    copy( mouseX - 50, mouseY - 50, 100, 100, constrain(mouseX + 50, 0, width - 400), constrain(mouseY + 50, 0, height - 400), 400, 400); 
    noFill(); 
    stroke(50); 
    rectMode(CORNER); 
    rect( mouseX - 50, mouseY-50, 100, 100 );
  }
}
