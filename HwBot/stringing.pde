int nextFontIndex ;
float nextTheta, nextSize ; 

class stringing {
  String s ; 
  int x, y ;
  IntList fontIndex ; 
  FloatList sizes , theta ; 
  color c ;  
  
  stringing(int X, int Y) { 
    s = "" ; 
    fontIndex = new IntList() ;
    sizes = new FloatList() ; 
    theta = new FloatList() ; 
    x = X ; 
    y = Y ;
  }
  void add(char c) { 
    s += c ; 
    fontIndex.append( nextFontIndex ) ;
    sizes.append( nextSize ) ;
    theta.append( nextTheta ) ; 
    //textFont( createFont(fonts[fontIndex.get(fontIndex.size()-1)], 64) ) ;
    //textFont( fonts[fontIndex.get(fontIndex.size()-1)] ) ; 
    textFont( fonts[nextFontIndex] ) ;
    textSize( nextSize ) ; 
    cursorx += textWidth(c) + 0.55  ;
    changeFont() ; 
  }
  void remove() { 
    if ( s.length() > 0 ) {
      //textFont( createFont(fonts[fontIndex.get(fontIndex.size()-1)], 64) ) ;
      //textFont( fonts[fontIndex.get(fontIndex.size()-1)] ) ; 
      cursorx -= textWidth(s.charAt(s.length()-1)) ; 
      s = s.substring(0, s.length()-1) ;
      fontIndex.remove(fontIndex.size()-1) ; 
      sizes.remove(sizes.size()-1 ) ;
      theta.remove(theta.size()-1 ) ;
    }
  }
}
