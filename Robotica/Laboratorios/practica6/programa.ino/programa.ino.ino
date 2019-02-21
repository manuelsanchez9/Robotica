
  // put your setup code here, to run once:
int Pin1 = 4;
int Pin2 = 3;
String option;
void setup()
{
   Serial.begin(9600);
   pinMode(Pin1, INPUT);
   pinMode(Pin2, INPUT);
   pinMode(13, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(Pin1)== HIGH)
  {
    Serial.println(1);
    digitalWrite(13, HIGH);
  }
  if(digitalRead(Pin2)== HIGH)
  {
    Serial.println(2);
    digitalWrite(13, LOW);
  }

}
