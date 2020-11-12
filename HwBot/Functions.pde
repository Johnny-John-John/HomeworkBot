void changeFont() {
  nextFontIndex = (int)random(fonts.length) ;
  nextSize = 34 ; // random(33, 36) ;
  nextTheta = random(-1, 1)/50 ;
}

void colorBlue() { // fill(#2500FF) ; // 23 82 152 > 38 75 143 >> 34 60 117
  sliders.get(0).val = 23 ; 
  sliders.get(1).val = 82 ; 
  sliders.get(2).val = 152 ;
}

void type() {
  textAlign(LEFT, TOP); 
  textSize(16); 
  for ( stringing s : ss ) {
    float ii = 0; 
    for ( int i = 0; i < s.s.length(); i++ ) {
      //textFont( createFont("Chinmaynormal1" , 64) ) ; //fonts[s.fontIndex.get(i)], 64) ) ;
      textFont( fonts[s.fontIndex.get(i)] ); 
      fill( s.c ) ; //sliders.get(0).val, sliders.get(1).val, sliders.get(2).val ); 
      pushMatrix(); 
      translate(s.x + ii,s.y); 
      rotate(s.theta.get(i)); 
      textSize(s.sizes.get(i)); 
      text( s.s.charAt(i), 0, 0 ); 
      popMatrix(); 
      ii += textWidth(s.s.charAt(i)); // + s.fontIndex[i]/100 ;
    }
  }
}

int fileNumber = 0 ;
void saveWork() { 

  PImage savingWork = get(int(backgroundPagex*zoomscale), int(backgroundPagey*zoomscale), int(backgroundPage.width*zoomscale), int(backgroundPage.height*zoomscale) ) ; 
  savingWork.save("C:\\Users\\Chinmay\\Desktop\\Hello" + fileNumber + ".png") ;
  fileNumber++ ;
}

/////////////////////////////////////
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.awt.Toolkit;
import drop.* ; 
SDrop dropingobject ;  
void dropEvent(DropEvent dropevent) {
  if ( dropevent.isImage() ) {
    backgroundPage = dropevent.loadImage() ;
  }
}
Object getFromClipboard (DataFlavor flavor) {
  Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard(); 
  Transferable contents = clipboard.getContents(null);
  Object object = null;
  if (contents != null && contents.isDataFlavorSupported(flavor))
  {
    try
    {
      object = contents.getTransferData(flavor);
    }
    catch (UnsupportedFlavorException e1) {
    } 
    catch (java.io.IOException e2) {
    }
  }
  return object;
}
