
int ledPin = 13;
String option;
void setup()
{
   Serial.begin(9600);
   pinMode(ledPin, OUTPUT);
  }

void loop()
{
 if (Serial.available()>0){
    //leemos la opcion enviada
    option=Serial.read();
    if(option=='a') {
      digitalWrite(ledPin, LOW);
      Serial.println("OFF");
    }
    if(option=='b') {
      digitalWrite(ledPin, HIGH);
      Serial.println("ON");
    }
  }
}
