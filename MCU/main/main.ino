/*
  Web client
 This sketch connects to a website (http://www.google.com)
 using an Arduino Wiznet Ethernet shield.
 Circuit:
 * Ethernet shield attached to pins 10, 11, 12, 13
 created 18 Dec 2009
 by David A. Mellis
 modified 9 Apr 2012
 by Tom Igoe, based on work by Adrian McEwen
 */

#include <SPI.h>
#include <Ethernet3.h>

EthernetClient client;

byte mac[] = { 0xDE, 0xAC, 0xBE, 0xEF, 0xFE, 0xED };
char belowess[] = "belowess.ru";

bool isConfigured = false;
int relayPin = 8;
bool sendData = false;

void setup() {
  delay(2000);
   
  Serial.begin(9600);
  Serial.println("Setup");
  pinMode(relayPin, OUTPUT);

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
  Serial.println("Loop");
  if (sendData) {
    if (!isConfigured) {
      Serial.println("Not configured");
      while (true);
    }
    
    while(true) {
      long timestamp = 1609104050;
      int value = 1;
      
      String data = "{";
      data.concat("\"measured_at\": ");
      data.concat(String(timestamp));
      data.concat(",");
      data.concat("\"sensor_id\": 1,");
      data.concat("\"isActive\": true,");
      data.concat("\"value\": ");
      data.concat(String(value));
      data.concat("}");
      Serial.println(data);
      
      if (client.connect(belowess, 8080)) {
        Serial.println("connected");
        
        client.println("POST /api/records HTTP/1.1");
        client.println("Host: belowess.ru:8080");
        client.println("Content-Type: application/json");
        client.println("Connection: keep-alive");
        client.println("User-Agent: Arduino/1.0");
        client.println("Accept: text/html,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9");
        client.print("Content-Length:");
        client.println(data.length());
        client.println();
        client.print(data);
  
        client.flush();
      }
      else {
        // kf you didn't get a connection to the server:
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
  }

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
