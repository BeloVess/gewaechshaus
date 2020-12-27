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

// Enter a MAC address for your controller below.
// Newer Ethernet shields have a MAC address printed on a sticker on the shield
byte mac[] = { 0xDE, 0xAC, 0xBE, 0xEF, 0xFE, 0xED };
// if you don't want to use DNS (and reduce your sketch size)
// use the numeric IP instead of the name for the server:
//IPAddress server(74,125,232,128);  // numeric IP for Google (no DNS)
char belowess[] = "belowess.ru";    // name address for Google (using DNS)
char server[] = "www.google.com";

// Set the static IP address to use if the DHCP fails to assign
//IPAddress ip(192, 80, 3, 177);
//IPAddress ipdns(8, 8, 8, 8);
//IPAddress gw(192, 80, 3, 1);
//IPAddress mask(255, 255, 255, 0);
//IPAddress belowess(46, 29, 163, 93);

// Initialize the Ethernet client library
// with the IP address and port of the server
// that you want to connect to (port 80 is default for HTTP):
EthernetClient client;
bool isConfigured = false;

void setup() {
  delay(2000);

  Serial.begin(9600);
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

void loop()
{
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
      //client.stop();
    }
    else {
      // kf you didn't get a connection to the server:
      Serial.println("connection failed");
      while (true);
    }

    delay(100);
    
    // if there are incoming bytes available
    // from the server, read them and print them:
    while(true) {
      if (client.available()) {
        char c = client.read();
        Serial.print(c);
      }
    }
  
    // if the server's disconnected, stop the client:
    if (!client.connected()) {
      Serial.println();
      Serial.println("Client isn't connected");
      client.stop();
  
      // do nothing forevermore:
      while (true);
    }

    Serial.println("Finish");
    while(true);
  }
}
