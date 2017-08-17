class Well {
  PVector x;
  float m;
  float r;
  
  Well() {
    boolean done = false;
    this.x = new PVector( 0 , 0 );
    while( !done ) {
      this.x = new PVector( random(0,width) , random(0,height) );
      if( PVector.dist( this.x , cVector ) > minWellDist*U ) {
        done = true;
      }
    }
    this.m = random(minWellMass,maxWellMass)*U*U*U;
    this.r = pow( this.m , 1.0 / 3.0 );
  }
}

class WellList {
  int num;
  Well[] W;
  
  WellList( int numIn ) {
    this.num = numIn;
    this.W = new Well[this.num];
    for( int i = 0 ; i < num ; i++ ) {
      W[i] = new Well();
    }
  }
  
  void draw() {
    pg.fill( 255 );
    pg.stroke( 255 );
    for( int i = 0 ; i < num ; i++ ) {
      pg.ellipse( W[i].x.x , W[i].x.y , 0.02*W[i].r , 0.02*W[i].r );
    }
  }
  
}