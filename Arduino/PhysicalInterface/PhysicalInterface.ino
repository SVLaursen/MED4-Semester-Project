int potPin_1 = 0;
int potPin_2 = 1;
int potPin_3 = 2;

int potVal_1;
int potVal_2;
int potVal_3;

int LED1pin = 9;
int LED2pin = 5;
int LED3pin = 3;

byte LedB1;
byte LedB2;
byte LedB3;

char str1[] = ",";

void setup() {
  Serial.begin(9600);
  pinMode(LED1pin, OUTPUT);
  pinMode(LED2pin, OUTPUT);
  pinMode(LED3pin, OUTPUT);
}

void loop() {
  potVal_1 = 1023 - analogRead(potPin_1);
  potVal_2 = 1023 - analogRead(potPin_2);
  potVal_3 = 1023 - analogRead(potPin_3);


  LedB1 = potVal_1 / 4;
  LedB2 = potVal_2 / 4;
  LedB3 = potVal_3 / 4;
  
  analogWrite(LED1pin, LedB1);
  analogWrite(LED2pin, LedB2);
  analogWrite(LED3pin, LedB3);
  
  String input1 = String(potVal_1)+String(str1);
  String input2 = String(potVal_2)+String(str1);
  String input3 = String(potVal_3)+String(str1);

  String output = input1 + input2 + input3;
  char outputData[output.length()];
  output.toCharArray(outputData, output.length());

  Serial.println(outputData);
}
