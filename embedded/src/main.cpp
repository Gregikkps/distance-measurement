#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>

const int trigPin = D1;
const int echoPin = D2;

long durationValue;
int distance;

const char *ssid = "Distance Measurement";
const char *password = "Gregory123";

IPAddress local_IP(192, 168, 4, 22);
IPAddress gateway(192, 168, 4, 9);
IPAddress subnet(255, 255, 255, 0);

ESP8266WebServer server(80);

void handleRoot()
{
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  durationValue = pulseIn(echoPin, HIGH);
  distance = durationValue * 0.034 / 2;
  String response = String(distance);
  server.send(200, "text/plain", response);
  Serial.println("Received HTTP GET request");
  Serial.println(response);
}

void setup()
{
  Serial.begin(115200);
  server.begin();
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  WiFi.softAP(ssid, password);
  WiFi.softAPConfig(local_IP, gateway, subnet);

  server.on("/", handleRoot);
  server.begin();
  Serial.println("HTTP server started");
}

void loop()
{
  server.handleClient();
  if (Serial.available())
  {
    String command = Serial.readStringUntil('\n');
    if (command.startsWith("send_request"))
    {
      handleRoot();
    }
  }
}
