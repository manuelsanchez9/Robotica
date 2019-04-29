double angle = 0;
String instring = "";
int ent1 = 12;
int ent2 = 11;
int ent3 = 10;
int ent4 = 9;
int Steps = 0;
int currentAngle = 0;
double currentSteps = 0;
double aux = 0;

int Paso [ 8 ][ 4 ] =
{ {1, 0, 0, 0},
  {1, 1, 0, 0},
  {0, 1, 0, 0},
  {0, 1, 1, 0},
  {0, 0, 1, 0},
  {0, 0, 1, 1},
  {0, 0, 0, 1},
  {1, 0, 0, 1}
};
void setup() {
  Serial.begin(9600);// put your setup code here, to run once:
  pinMode(3, OUTPUT);
  pinMode(ent1, OUTPUT);
  pinMode(ent2, OUTPUT);
  pinMode(ent3, OUTPUT);
  pinMode(ent4, OUTPUT);
}

void SetDirection()
{
  if (angle > currentAngle)
    Steps--;
  else
    Steps++;

  Steps = ( Steps + 8 ) % 8 ;
}

void stepper()            //Avanza un paso
{
  digitalWrite( ent1, Paso[Steps][ 0] );
  digitalWrite( ent2, Paso[Steps][ 1] );
  digitalWrite( ent3, Paso[Steps][ 2] );
  digitalWrite( ent4, Paso[Steps][ 3] );
  SetDirection();
}

void giro() {
  if (currentAngle != angle) {
    if (angle != 0) {
      double pasos = ((angle * 200) / 360);

      if (pasos == 0) {
        aux = 0;
      } else {
        aux = pasos - currentSteps;
      }
      
      currentSteps = pasos;
    } else {
      aux = currentSteps;
      currentSteps = 0;
    }

    if (aux < 0) {
      aux = aux * (-1);
    }

    for (int i = 0; i < aux; i++) {
      stepper();
      delay(3);
    }

    currentAngle = angle;
  }
}

void loop() {
    int a = analogRead(A0);
    delay(3);
    int b = map(a,10,1023,0,360);
    Serial.println(b);
    angle = b;
    giro();
}
