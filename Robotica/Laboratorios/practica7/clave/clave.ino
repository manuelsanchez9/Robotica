int PinLED = 13;
int cont = 0;
int sw = 0;
String valor;
String Clave;
void setup()
{
   Serial.begin(9600);
   pinMode(PinLED, OUTPUT);
   Clave = "12345";
}

void loop() {

    if(cont == 3 && sw == 0)
    {
      Serial.println("Bloqueo clave, cambie clave");
      Serial.println("Ingrese clave anterior");
      sw = 1;
    }
    if(Serial.available()>0)
    {
      valor = Serial.readString();
      if( sw == 1 )
      {
        if(valor == Clave)
        {
          Serial.println("Ingrese clave nueva");
          delay(5000);
          if(Serial.available()>0)
          {
            valor = Serial.readString();
            Clave = valor;
            cont = 0;  
            valor = "";
            sw = 0;
            Serial.println("se actualizo clave");
          }
          else{
            Serial.println("ERROR==>se agotó el tiempo");
          }
        }
        else
        {
          Serial.println("ERROR==>Ingrese clave anterior");
        }
      }
      else
      {
        if(valor == Clave)
        {
          cont = 0;  
          Serial.println("Ingreso Correcto");
          digitalWrite(PinLED,HIGH);
          delay(3000);
          digitalWrite(PinLED,LOW);
        }
        else
        {
          cont = cont + 1;
          Serial.println("Clave Incorrecta");
        }
      }
    }
  }
  
