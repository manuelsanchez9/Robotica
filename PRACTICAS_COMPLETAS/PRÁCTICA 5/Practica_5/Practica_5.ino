const int pin = LED_BUILTIN;
int state = LOW;
unsigned long previousMillis = 0;
long interval = 0;
String strResponse = "";
String strNum = "";
String input = "";
String action = "";

void GetIntervalAndAction(){
  int tam = input.length();
  
  for (int i = 0; i < tam; i++){
    String let = input.substring(i,i+1);

    if (isDigit(let.charAt(0))){
      strNum += let;
      } else{
          if (let != "" && let != " " && let != "\n" && let != "\r"){
            strResponse += let;
          }
        }
    }

    interval = strNum.toInt();
    action = strResponse;
    input = "";
    strNum = "";
    strResponse = "";
    
    if (action == "encender" || action == "ENCENDER"){
      Serial.println(interval);
    }

    Serial.println(action);
  }

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(pin, OUTPUT);
  input = Serial.readString();

  if (input != ""){
    GetIntervalAndAction();
  }
}

void loop() {
  if (Serial.available() > 0){
    input = Serial.readString();

    if (input != ""){
      GetIntervalAndAction();
    }
  }
  
  unsigned long currentMillis = millis();   

  if (currentMillis - previousMillis >= interval){
    previousMillis = currentMillis;

    if (action == "encender" || action == "ENCENDER"){
      if (state == LOW){
        state = HIGH;
      } else {
          state = LOW;
        }
    } else if (action == "apagar"){
        state = LOW;
      }
    
    digitalWrite(pin, state);
  }
}


