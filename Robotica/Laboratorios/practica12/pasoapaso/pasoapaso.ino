double valor=0;
String instring="";
int ent1=12;
int ent2=11;
int ent3=10;
int ent4=9;
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
}

void loop() {
  if(Serial.available()>0){
    instring=Serial.readString();
    valor=instring.toInt();
    Serial.println(valor);
    //delay(10);
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

      
   }

void SetDirection()
   {  
      if(valor>0)
         Steps++;
      else
         Steps--;

      Steps = ( Steps + 8 ) % 8 ;
   }
