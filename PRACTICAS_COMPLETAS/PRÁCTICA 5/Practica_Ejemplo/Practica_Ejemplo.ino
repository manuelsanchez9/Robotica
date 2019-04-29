const int pin = LED_BUILTIN;
int state = LOW;
unsigned long previousMillis = 0;
long interval = 1000;

void setup() {
  // put your setup code here, to run once:
  pinMode(pin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (Serial.available() > 0){
    String input = Serial.readString();
    interval = input.toInt();
  }
  
  unsigned long currentMillis = millis();
  
  if (currentMillis - previousMillis >= interval){
    previousMillis = currentMillis;

    if (interval == 5){
      state = LOW;
      } else{
        if (state == LOW){
      state = HIGH;
      } else {
        state = LOW;
      } 
        }

    

      digitalWrite(pin, state);
    }
}
