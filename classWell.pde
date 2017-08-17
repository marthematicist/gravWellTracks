class Well {
  PVector x;
  PVector v;
  float m;
  float r;
  
  Well() {
    boolean done = false;
    this.x = new PVector( 0 , 0 );
    this.v = PVector.random2D().mult(1);
    while( !done ) {
      this.x = new PVector( random(0,width) , random(0,height) );
      if( PVector.dist( this.x , cVector ) > minWellDist*U ) {
        done = true;
      }
    }
    this.m = random(minWellMass,maxWellMass)*U*U*U;
    this.r = pow( this.m , 1.0 / 3.0 );
  }
  
  void evolve() {
    this.x.add( this.v );
    if( this.x.x > width ) {
      this.x.x = width;
      this.v.x = -abs( this.v.x );
    }
    if( this.x.y > height ) {
      this.x.y = height ;
      this.v.y = -abs( this.v.y );
    }
    if( this.x.x < 0 ) {
      this.x.x = 0;
      this.v.x = abs( this.v.x );
    }
    if( this.x.y < 0 ) {
      this.x.y = 0;
      this.v.y = abs( this.v.y );
    }
    if( PVector.dist( cVector , this.x ) < minWellDist*U ) {
      //println( "too close!!!" );
      PVector un = PVector.sub( this.x , cVector ).normalize();
      PVector vn = PVector.mult( un , un.dot( this.v ) );
      this.v.sub( PVector.mult( vn , 2 ) );
    }
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
    pg.fill( 255 , 0 , 0 );
    pg.stroke( 255 );
    for( int i = 0 ; i < num ; i++ ) {
      pg.ellipse( W[i].x.x , W[i].x.y , 8 , 8 );
    }
  }
  
  void evolve() {
    for( int i = 0 ; i < num ; i++ ) {
      this.W[i].evolve();
    }
  }
  
  void randomizeVelocities() {
    for( int i = 0 ; i < num ; i++ ) {
      this.W[i].v = PVector.random2D().mult( random( minWellVel , maxWellVel ) );
    }
  }
  
}