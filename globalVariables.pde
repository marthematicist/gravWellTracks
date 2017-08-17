float hwidth;
float hheight;
float U;
PVector cVector;

// color values
float startHue = 0;
float dStartHue = 125;
float widthHue = 60;
float startSat = 0;
float dStartSat = 0.1;
float widthSat = 1;
float startBri = 0;
float dStartBri = 0.31419;
float widthBri = 0.5;

// physics sim values
float gravConst = 1;
float epsilon = 0.01;
float epsilonSquared = epsilon*epsilon;
float dt = 0.05;

// track values
int vertexEvery = 10;

// particle values
int numParticles = 10;
float minInitVel = 0.04;
float maxInitVel = 0.04;
float minParticleMass = 4;
float maxParticleMass = 4;
float minParticleRadius = 0.01;
float maxParticleRadius = 0.01;
float particleAlpha = 255;

// well values
int numWells = 4;
float minWellMass = 0.001;
float maxWellMass = 0.001;
float minWellDist = 0.25;

void setupGlobalVariables() {
  hwidth = width*0.5;
  hheight = height*0.5;
  cVector = new PVector( hwidth , hheight );
  U = min( hwidth , hheight );
  epsilonSquared = epsilon*epsilon*U*U;
}