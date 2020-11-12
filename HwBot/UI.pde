boolean showui = true ; 

void UI() { 
  if ( showui ) {
    stroke( sliders.get(0).val, sliders.get(1).val, sliders.get(2).val ); 
    line( cursorx, cursory, cursorx, cursory + nextSize - 13 ) ;

    textFont( fonts[nextFontIndex] ); 
    textSize( 50 ); 
    for (Slider s : sliders) s.display(); 
    for ( Button b : buttons )  b.display(); 
    fill( sliders.get(0).val, sliders.get(1).val, sliders.get(2).val ); 
    textAlign(LEFT, CENTER); 
    textSize(nextSize*6); 
    pushMatrix(); 
    translate( 64, height - 170 ); 
    rotate(nextTheta); 
    text( "A", 0, 0 ); 
    popMatrix();
  }
}
