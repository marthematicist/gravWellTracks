PGraphics pg;
WellList WL;
ParticleList PL;

void setup() {
  size( 800 , 480 );
  pg = createGraphics( 800 , 480 );
  setupGlobalVariables();
  
  WL = new WellList( numWells );
  pg.beginDraw();
  pg.background(255);
  //WL.draw();
  pg.endDraw();
  
  PL = new ParticleList( numParticles );
  PL.evolveHalfStep( WL );
}

void draw() {
  
  
  pg.beginDraw();
  pg.background( 255 , 255 , 255 , 4 );
  pg.strokeWeight(0.5);
  for( int i = 0 ; i < 20 ; i++ ) {
    Track t = new Track( 100 , WL );
    t.drawTrack();
  }
  pg.endDraw();
  image( pg , 0 , 0 );
  
  if( frameCount%200 == 0 ) { 
    println( frameCount , frameRate );
    WL = new WellList( numWells );
    startHue += dStartHue;
    startSat += dStartSat;
    startBri += dStartBri;
    
  }
  
}