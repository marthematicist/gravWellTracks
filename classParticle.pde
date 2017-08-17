class Particle {
  PVector x;
  PVector px;
  PVector v;
  PVector a;
  float m;
  float r;
  color c;

  Particle() {
    //this.x = PVector.random2D().mult(random(0,U)).add( new PVector( hwidth , hheight ) );
    this.x = new PVector( hwidth , hheight );
    this.px = new PVector( x.x , x.y );
    this.v = PVector.random2D().mult( random(minInitVel,maxInitVel)*U );
    float h = ( abs(v.heading())/PI * widthHue + startHue );
    float s = ( abs(v.heading())/PI * widthSat + startSat );
    float b = ( abs(v.heading())/PI * widthBri + startBri );
    this.a = new PVector( 0 , 0 );
    this.m = pow( random(minParticleMass,maxParticleMass)*U , 3.0 );
    this.r = random( minParticleRadius , maxParticleRadius )*U;
    this.c = hsbColor( h , 0.7 , 0 , particleAlpha );
  }
  
  void updateAcc( WellList w ) {
    this.a = new PVector( 0 , 0 );
    for( int i = 0 ; i < w.num ; i++ ) {
      PVector da = PVector.sub( w.W[i].x , x );
      float d = da.mag();
      da.div( d );
      da.mult( gravConst * w.W[i].m / ( d*d + epsilonSquared ) );
      a.add( da );
    }
  }
  
  void evolveHalfStep( WellList w ) {
    this.updateAcc( w );
    this.v.add( PVector.mult( this.a , dt*0.5 ) );
  }
  
  void evolveFullStep( WellList w ) {
    px = new PVector( x.x , x.y );
    this.x.add( PVector.mult( this.v , dt ) );
    this.updateAcc( w );
    this.v.add( PVector.mult( this.a , dt ) );
  }
  
  void drawLine() {
    pg.stroke(c);
    pg.line( x.x , x.y , px.x , px.y );
  }
  void drawDot() {
    pg.fill(c);
    pg.noStroke();
    pg.ellipse( x.x , x.y , r , r );
  }
}

class ParticleList { 
  int num;
  Particle[] P;
  
  ParticleList( int numIn ) {
    this.num = numIn;
    this.P = new Particle[num];
    for( int i = 0 ; i < num ; i++ ) {
      P[i] = new Particle();
    }
  }
  
  void evolveHalfStep( WellList w ) {
    for( int i = 0 ; i < num ; i++ ) {
      P[i].evolveHalfStep( w );
    }
  }
  
  void evolveFullStep( WellList w ) {
    for( int i = 0 ; i < num ; i++ ) {
      P[i].evolveFullStep( w );
    }
  }
  
  void drawLine() {
    for( int i = 0 ; i < num ; i++ ) {
      P[i].drawLine();
    }
  }
  
  void drawDot() {
    for( int i = 0 ; i < num ; i++ ) {
      P[i].drawDot();
    }
  }
  
}