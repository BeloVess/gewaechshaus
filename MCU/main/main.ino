#include <SPI.h>
#include <Ethernet3.h>

EthernetClient client;

byte mac[] = { 0xDE, 0xAC, 0xBE, 0xEF, 0xFE, 0xED };
char belowess[] = "belowess.ru";

bool isConfigured = false;
bool sendData = true;
bool makeLight = false;

// Light
int relayPin = 8;
// Moisture Meter
int moisturePin = 4;

void setup() {
  delay(2000);
   
  Serial.begin(9600);
  Serial.println("Setup");
  
  if (makeLight) {
    pinMode(relayPin, OUTPUT);
  }

  if (sendData) {
    Serial.println(Ethernet.linkReport());
  
    Ethernet.setRstPin(9);
    Ethernet.setCsPin(10);
    Ethernet.init();
  
    // start the Ethernet connection:
    if (Ethernet.begin(mac) == 0) {
      Serial.println("Failed to configure Ethernet using DHCP");
    } else {
      isConfigured = true;
      Serial.println("Good!");
      Serial.println(Ethernet.localIP());
    }
  }
}

void loop()
{
  Serial.println("Main");
  
  int moisture = analogRead(moisturePin);
  //Serial.println(moisture);
  
  if (sendData) {
    if (!isConfigured) {
      Serial.println("Not configured");
      while (true);
    }
    

    long timestamp = 1609104050;
    
    String data = "{";
    data.concat("\"measured_at\": ");
    data.concat(String(timestamp));
    data.concat(",");
    data.concat("\"sensor_id\": 1,");
    data.concat("\"isActive\": true,");
    data.concat("\"value\": ");
    data.concat(String(moisture));
    data.concat("}");
    Serial.println(data);
    
    if (client.connect(belowess, 8080)) {
      Serial.println("connected");
      
      client.println("POST /api/records HTTP/1.1");
      client.println("Host: belowess.ru:8080");
      client.println("Content-Type: application/json");
      client.println("Connection: close");
      client.println("User-Agent: Arduino/1.0");
      client.println("Accept: text/html,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9");
      client.print("Content-Length:");
      client.println(data.length());
      client.println();
      client.print(data);

      client.flush();
    }
    else {
      Serial.println("connection failed");
      while (true);
    }

    bool needFetch = true;
    bool fetching = false;
    
    while(needFetch) {
      if (client.available()) {
        fetching = true;
        char c = client.read();
        Serial.print(c);
      } else if (fetching) {
        needFetch = false;
        client.stop();
        Serial.println("Fetched");
      }
    }
  }

  if (makeLight) {
    Serial.println("Light");
    while(true) {
      delay(2000);
      digitalWrite(relayPin,HIGH);
      Serial.println("Light on");
      delay(2000);
      digitalWrite(relayPin,LOW);
      Serial.println("Light off");
    }
  }

  delay(5000);
}
