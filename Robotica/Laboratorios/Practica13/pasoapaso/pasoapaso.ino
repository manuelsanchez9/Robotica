int Paso [ 8 ][ 4 ] =
   {  {1, 0, 0, 0},
      {1, 1, 0, 0},
      {0, 1, 0, 0},
      {0, 1, 1, 0},
      {0, 0, 1, 0},
      {0, 0, 1, 1},
      {0, 0, 0, 1},
      {1, 0, 0, 1}
   };
int IN1 =12;
int IN2 =11;
int IN3 =10;
int IN4 =9;

int IN21=8;
int IN22=7;
int IN23=6;
int IN24=5;
                    
void setup() {
     Serial.begin(9600);
     pinMode(IN1, OUTPUT);
     pinMode(IN2, OUTPUT);
     pinMode(IN3, OUTPUT);
     pinMode(IN4, OUTPUT);

    pinMode(IN21, OUTPUT);
     pinMode(IN22, OUTPUT);
     pinMode(IN23, OUTPUT);
     pinMode(IN24, OUTPUT);
}

float variable=0;
String cadena = "";
int myIntX[100];
int myIntY[100];
String parametro ;
boolean Direction = false;
int steps_left=0;
int Steps = 0; 
int Steps2 = 0; 
int cont =0;

void loop() {
      while(Serial.available())
      {
        
        cadena=Serial.readString();
        delayMicroseconds(10);
        Serial.println(cadena);
        if (cadena == "X" or cadena =="Y")
        {
          parametro = cadena;
          cont =0;
          //Serial.println("parametro "+parametro);
        }
        else if(cadena == "S")
        {
          start();
          //cont =0;
        }
        else{
          if (parametro == "X"){
            myIntX[cont] = cadena.toFloat();
            //Serial.println(myIntX[cont]);
          }
          if (parametro == "Y"){
            myIntY[cont] = cadena.toFloat();
            //Serial.println(myIntY[cont]);
          }
          cont += 1;
        }
      //Serial.println("paso_");
      }
}

void start(){

  for ( int i= 0; i<cont; i++)
  {
    variable = myIntX[i];
    mover(0);
    variable = myIntY[i];
    mover(1);
  }
}
void mover(int v)
{
  if(variable>0)
  {
    Direction = true;
    steps_left = variable;
  }
  else
  {
   Direction = false;
   steps_left = (-1)*variable; 
  }

   while(steps_left>0)
        { 
          if( v ==0)
          {
           stepper() ;     // Avanza un paso
          }
          if( v ==1)
          {
           stepper2() ;     // Avanza un paso
          }
           steps_left-- ;  // Un paso menos
           delay (10) ;
           //Serial.println(steps_left);
        }



}
void stepper()            //Avanza un paso
   {        
      SetDirection();
      digitalWrite( IN1, Paso[Steps][ 0] );
      digitalWrite( IN2, Paso[Steps][ 1] );
      digitalWrite( IN3, Paso[Steps][ 2] );
      digitalWrite( IN4, Paso[Steps][ 3] );
      
   }

   void stepper2()            //Avanza un paso
   {        
      SetDirection2();
      digitalWrite( IN21, Paso[Steps2][ 0] );
      digitalWrite( IN22, Paso[Steps2][ 1] );
      digitalWrite( IN23, Paso[Steps2][ 2] );
      digitalWrite( IN24, Paso[Steps2][ 3] );
      
   }
   void SetDirection()
   {  
      if(Direction)
         Steps++;
      else
         Steps--;

      Steps = ( Steps + 8 ) % 8 ;
   }
   void SetDirection2()
   {  
      if(Direction)
         Steps2++;
      else
         Steps2--;

      Steps2 = ( Steps2 + 8 ) % 8 ;
   }
