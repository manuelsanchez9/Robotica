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
#define IN1  12
#define IN2  11
#define IN3  10
#define IN4  9

int steps_left=98;
boolean Direction = true;
int Steps = 0;                       // Define el paso actual de la secuencia

void setup()
   { pinMode(IN1, OUTPUT);
     pinMode(IN2, OUTPUT);
     pinMode(IN3, OUTPUT);
     pinMode(IN4, OUTPUT);
     Serial.begin(9600);
   }

void loop()
   { while(steps_left>0)
        { 
          steps_left-- ;  // Un paso menos
           stepper() ;     // Avanza un paso
           
           Serial.println(steps_left);
           delay (100) ;
           
        }
     delay(300);
     Serial.println("Cambio de direccion ");
     
     Direction =! Direction;  // Invertimos la direceccion de giro
     steps_left = 98;
   }

void stepper()            //Avanza un paso
   { 
      SetDirection();
      Serial.print("Step ");
      Serial.println(Steps);
      
      digitalWrite( IN1, Paso[Steps][ 0] );
      digitalWrite( IN2, Paso[Steps][ 1] );
      digitalWrite( IN3, Paso[Steps][ 2] );
      digitalWrite( IN4, Paso[Steps][ 3] );

      
   }

void SetDirection()
   {  
      if(Direction)
         Steps++;
      else
         Steps--;

      Steps = ( Steps + 8 ) % 8 ;
   }
