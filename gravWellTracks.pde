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
  angOffset += dAng;
  WL.evolve();
  pg.beginDraw();
  if( frameCount%4 == 0 ) {
    pg.background( 255 , 255 , 255 , 16 );
  }
  pg.strokeWeight(0.5);
  int N = 20;
  for( int i = 0 ; i < N ; i++ ) {
    float ang = float(i) / float(N) * TWO_PI + angOffset;
    Track t = new Track( 100 , WL  );
    //Track t = new Track( 100 , WL  , new PVector( U*minInitVel*cos(ang) , U*minInitVel*sin(ang) ) );
    t.drawTrack();
  }
  //WL.draw();
  pg.endDraw();
  image( pg , 0 , 0 );
  
  if( frameCount%200 == 0 ) { 
    println( frameCount , frameRate );
    //WL = new WellList( numWells );
    WL.randomizeVelocities();
    startHue += dStartHue;
    startSat += dStartSat;
    startBri += dStartBri;
    
  }
  
}