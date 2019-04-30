int potPin_1 = 0;
int potPin_2 = 1;
int potPin_3 = 2;

int potVal_1 = 0;
int potVal_2 = 0;
int potVal_3 = 0;

int LED1pin = 9;
int LED2pin = 5;
int LED3pin = 3;

byte LedB1 = 0;
byte LedB2 = 0;
byte LedB3 = 0;

char str1[] = "Value 1: ";
char str2[] = ", Value 2: ";
char str3[] = ", Value 3: ";

void setup() {
  Serial.begin(9600);
  pinMode(LED1pin, OUTPUT);
  pinMode(LED2pin, OUTPUT);
  pinMode(LED3pin, OUTPUT);
}

void loop() {
  potVal_1 = analogRead(potPin_1);
  potVal_2 = analogRead(potPin_2);
  potVal_3 = analogRead(potPin_3);
  LedB1 = potVal_1/4;
  LedB2 = potVal_2/4;
  LedB3 = potVal_3/4;

  String input1 = String(str1 + potVal_1);
  String input2 = String(str2 + potVal_2);
  String input3 = String(str3 + potVal_3);

  String output = input1 + input2 + input3;
  char outputData[output.length()];
  output.toCharArray(outputData, output.length());
  
  Serial.write(outputData);
  Serial.println(String("Value 1: ") + potVal_1 + ", Value 2: " + potVal_2 + ", Value 3: " + potVal_3);
  analogWrite(LED1pin, LedB1);
  analogWrite(LED2pin, LedB2);
  analogWrite(LED3pin, LedB3);
}
