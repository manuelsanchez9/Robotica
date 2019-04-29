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

#define IN1  12
#define IN2  11
#define IN3  10
#define IN4  9

double angle = 0;
String instring = "";
int steps_left = 200;
boolean Direction = true;
int Steps = 0;                       // Define el paso actual de la secuencia
int currentAngle = 0;
double currentSteps = 0;
double aux = 0;
int nextStep = 0, backStep = 0, actualStep = 0;

void setup()
{
  Serial.begin(9600);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);
}

void stepperLess()            //Avanza un paso
{ digitalWrite( IN1, Paso[Steps][ 0] );
  digitalWrite( IN2, Paso[Steps][ 1] );
  digitalWrite( IN3, Paso[Steps][ 2] );
  digitalWrite( IN4, Paso[Steps][ 3] );
  Steps++;

  if (Steps == 8) {
    Steps = 0;
  }
}

void stepperMore()            //Avanza un paso
{ digitalWrite( IN1, Paso[Steps][ 0] );
  digitalWrite( IN2, Paso[Steps][ 1] );
  digitalWrite( IN3, Paso[Steps][ 2] );
  digitalWrite( IN4, Paso[Steps][ 3] );
  Steps--;

  if (Steps == -1) {
    Steps = 7;
  }
}

void giro() {
  if (currentAngle != angle) {
    if (angle != 0) {
      int pasos = ((angle * 200) / 360);
      Serial.println(pasos);

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

    while (aux > 0) {
      if (angle > currentAngle) {
        stepperMore();
        aux--;
        delay(10);
      } else {
        stepperLess();
        aux--;
        delay(10);
      }
    }

    backStep = Steps - 1;

    if (backStep == 8) {
      backStep = 1;
    } else if (backStep == -1) {
      backStep = 6;
    }

    nextStep = Steps++;

    if (nextStep == 8) {
      nextStep = 1;
    } else if (nextStep == -1) {
      nextStep = 6;
    }

    Serial.println("-----");
    Serial.println(backStep);
    Serial.println(nextStep);

    currentAngle = angle;
  }
}

void relax() {
  do {
    digitalWrite( IN1, Paso[Steps][ 0] );
    digitalWrite( IN2, Paso[Steps][ 1] );
    digitalWrite( IN3, Paso[Steps][ 2] );
    digitalWrite( IN4, Paso[Steps][ 3] );
    actualStep = Steps;
    Steps = backStep;
    delay(5);
    digitalWrite( IN1, Paso[Steps][ 0] );
    digitalWrite( IN2, Paso[Steps][ 1] );
    digitalWrite( IN3, Paso[Steps][ 2] );
    digitalWrite( IN4, Paso[Steps][ 3] );
    Steps = actualStep;
    delay(5);
  } while (Serial.available() <= 0);
}

void loop()
{
  if (Serial.available() > 0) {
    instring = Serial.readString();
    angle = instring.toInt();
    Serial.println(angle);
    giro();
  } else {
    relax();
  }
}
