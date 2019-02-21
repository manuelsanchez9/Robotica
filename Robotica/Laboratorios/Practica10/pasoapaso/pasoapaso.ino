double valor=0;
String instring="";
int ent1=12;
int ent2=11;
int ent3=10;
int ent4=9;
//motor 2
int ent21=8;
int ent22=7;
int ent23=6;
int ent24=5;

int tiempo=20;
int Steps = 0; 
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
void setup() {
  Serial.begin(9600);// put your setup code here, to run once:
 pinMode(ent1,OUTPUT);
 pinMode(ent2,OUTPUT);
 pinMode(ent3,OUTPUT);
 pinMode(ent4,OUTPUT);

 //motor 2
 pinMode(ent21,OUTPUT);
 pinMode(ent22,OUTPUT);
 pinMode(ent23,OUTPUT);
 pinMode(ent24,OUTPUT);
}

void loop() {
  if(Serial.available()>0){
    instring=Serial.readString();
    valor=instring.toInt();
    Serial.println(valor);
    giro();
  }

}
void giro(){
  int sw = 1;
  if(valor<0){
    sw = -1;
   }
  double pasos = ((valor*sw)/360)*98;
   
  Serial.println( pasos);
  for (int i=0;i<pasos;i++){
        stepper();
         //Serial.println(i);
         delay(10);
    }
    for (int i=0;i<200;i++){
      if (i % 4) {
        valor = valor* -1;
      }
      stepper();
         //Serial.println(i);
         delay(10);
         
    }
  }
  void stepper()            //Avanza un paso
   { 
      SetDirection();
      //Serial.print("Step ");
      //Serial.println(Steps);
      
      digitalWrite( ent1, Paso[Steps][ 0] );
      digitalWrite( ent2, Paso[Steps][ 1] );
      digitalWrite( ent3, Paso[Steps][ 2] );
      digitalWrite( ent4, Paso[Steps][ 3] );

      digitalWrite( ent21, Paso[Steps][ 0] );
      digitalWrite( ent22, Paso[Steps][ 1] );
      digitalWrite( ent23, Paso[Steps][ 2] );
      digitalWrite( ent24, Paso[Steps][ 3] );
   }

void SetDirection()
   {  
      if(valor>0)
         Steps++;
      else
         Steps--;

      Steps = ( Steps + 8 ) % 8 ;
   }
