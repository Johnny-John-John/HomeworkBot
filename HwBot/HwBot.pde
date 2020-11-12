ArrayList<stringing> ss ; 
float cursorx = 0, cursory = 0 ; 
PFont[] fonts ; 
PImage backgroundPage ; 
int backgroundPagex = 100, backgroundPagey = 0 ; 
float panedx = 0, panedy = 0, panx, pany ; 
boolean panning = false ; 

ArrayList<Slider> sliders ; 
ArrayList<Button> buttons ; 


void setup() { 
  size(700, 900) ; //
  //fullScreen() ; 
  sliders = new ArrayList<Slider>() ; 
  buttons = new ArrayList<Button>() ; 
  sliders.add( new Slider( "Red", 64, height*0.92, 255) ) ; 
  sliders.add( new Slider( "Green", 64, height*0.95, 255) ) ;
  sliders.add( new Slider( "Blue", 64, height*0.98, 255) ) ;
  buttons.add( new Button( "Line", 50, height - 280, 30, 15) );
  buttons.add( new Button( "Text", 50, height - 320, 30, 15) ) ; 
  dropingobject = new SDrop(this) ;

  fonts = new PFont[] { 
    createFont("C:\\Users\\Chinmay\\Desktop\\Homeworkbot\\HAND FONTS\\FINAL1.ttf", 128 ), 
    //createFont("C:\\Users\\Chinmay\\Desktop\\Homeworkbot\\HAND FONTS\\Omega1-Regular.ttf", 128 )
  } ; // PFont.list() ; 
  backgroundPage = loadImage("C:\\Users\\Chinmay\\Desktop\\Homeworkbot\\Labpage_Lines1.jpg"); 
  backgroundPage.resize(backgroundPage.width/4, backgroundPage.height/4); 
  ss = new ArrayList<stringing>(); 
  ss.add( new stringing(0, 0) ); 
  frameRate(144); 
  textSize(32); 
  colorBlue(); 
  changeFont();
}

void draw() {
  background(20); 

  ss.get(ss.size()-1).c = color( sliders.get(0).val, sliders.get(1).val, sliders.get(2).val ) ;

  //if ( panhold ) translate( - panholdx + mouseX, - panholdy + mouseY ); 
  //else translate( -panholdx, -panholdy );
  translate(panx,pany) ; 
  scale(zoomscale) ; 
  image(backgroundPage, backgroundPagex, backgroundPagey); 

  UI() ; 
  type(); 
  scopezoom() ;
  //if( savingWork != null ) image( savingWork , 0 , 0 ) ;
}
