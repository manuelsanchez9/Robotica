//int comando=0;
String comando = "";
String keyReceived = "";
String key = "123abc";
int ok = 1, fail = 0;
const int pin = LED_BUILTIN;
int timeWaitLed = 200;

void setup() {
  Serial.begin(9600);// put your setup code here, to run once:
  pinMode(pin, OUTPUT);
}

void loop() {
  if (Serial.available() > 0) { //si hay datos disponibles en el serial
    delay(50);  //esperemos a que se terminen de recibir
    comando = Serial.readString(); //leemos el primer datos –byte-
    delay(500);
    
    int tam = comando.length();

    for (int i = 0; i < tam; i++){
      String let = comando.substring(i,i+1);
      if (let != "" && let != " " && let != "\n" && let != "\r"){
            keyReceived += (String)let;
          }
      }
      
    if (keyReceived == key) {
      Serial.println(ok);
      keyReceived = "";
      digitalWrite(pin, HIGH);
    } else {
      Serial.println(fail);
      keyReceived = "";
      digitalWrite(pin, LOW);
      delay(timeWaitLed);
      digitalWrite(pin, HIGH);
      delay(timeWaitLed);
      digitalWrite(pin, LOW);
      delay(timeWaitLed);
      digitalWrite(pin, HIGH);
      delay(timeWaitLed);
      digitalWrite(pin, LOW);
      delay(timeWaitLed);
      digitalWrite(pin, HIGH);
      delay(timeWaitLed);
      digitalWrite(pin, LOW);
    }

    Serial.flush();//limpiamos el serial.
  }// put your main code here, to run repeatedly:

}
