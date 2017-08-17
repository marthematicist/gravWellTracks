class Track {
  PVector[] T;
  int num;
  color c;
  
  Track( int numIn , WellList wl ) {
    this.num = numIn;
    this.T = new PVector[num];
    Particle p = new Particle();
    this.c = p.c;
    T[0] = p.x.copy();
    p.evolveHalfStep( wl );
    for( int i = 1 ; i < num ; i++ ) {
      for( int j = 0 ; j < vertexEvery ; j++ ) {
        p.evolveFullStep( wl );
      }
      T[i] = p.x.copy();
    }
  }
  
  Track( int numIn , WellList wl , PVector vIn ) {
    this.num = numIn;
    this.T = new PVector[num];
    Particle p = new Particle();
    p.v = vIn;
    this.c = p.c;
    T[0] = p.x.copy();
    p.evolveHalfStep( wl );
    for( int i = 1 ; i < num ; i++ ) {
      for( int j = 0 ; j < vertexEvery ; j++ ) {
        p.evolveFullStep( wl );
      }
      T[i] = p.x.copy();
    }
  }
  
  void drawTrack() {
    pg.noFill();
    pg.stroke( this.c );
    pg.beginShape();
    for( int i = 0 ; i < num ; i++ ) {
      pg.vertex( T[i].x , T[i].y );
    }
    pg.endShape();
  }
}