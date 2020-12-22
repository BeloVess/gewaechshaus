void setup() {
  pinMode(12, OUTPUT);   
}
 
void loop() {
  digitalWrite(12, HIGH);   // зажигаем светодиод
  delay(200);              // ждем секунду
  digitalWrite(12, LOW);    // выключаем светодиод
  delay(200);              // ждем секунду
}
