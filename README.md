# Distance Measurement App


**Description:**

This project is an example of integrating an HC-SR04 distance sensor with a Flutter mobile application. The HC-SR04 sensor measures the distance from an object and sends the result via an HTTP server provided by the NodeMCU ESP8266 to the Flutter application.

### Screens:

![distance_view](https://github.com/Gregikkps/distance-measurement/assets/76614984/96b54410-0036-421b-a63f-2a2c3cc62239)
![settings_view](https://github.com/Gregikkps/distance-measurement/assets/76614984/b6add090-7ef5-4a73-a5f6-dd1fea82f4b3)
![menu_view](https://github.com/Gregikkps/distance-measurement/assets/76614984/cac17e00-0ec4-4dc9-9eab-fd103082ed83)




## Running Instructions

### NodeMCU ESP8266

1. Set up the Arduino IDE environment for programming the NodeMCU ESP8266.
2. Upload the source code to the device, adjusting the WiFi network parameters (SSID and password) and the assigned GPIO pins (trigPin and echoPin) to your requirements.
3. Start the NodeMCU ESP8266.

### Flutter Application

1. Set up the Flutter environment on your computer.
2. Navigate to the Flutter project directory.
3. Run the application on a device or emulator using the `flutter run` command.

## Configuration

### NodeMCU ESP8266

- `trigPin` - The GPIO pin used to send the trigger signal to the HC-SR04 sensor.
- `echoPin` - The GPIO pin used to receive the echo signal from the HC-SR04 sensor.
- `ssid` - The name of the WiFi network that the NodeMCU ESP8266 should connect to.
- `password` - WiFi network password.
- `local_IP` - Static IP address for the NodeMCU ESP8266.
- `gateway` - Gateway IP address.
- `subnet` - Subnet mask.

### Flutter Application

- In the `lib\resources\app_config.dart` file, modify the IP address and wifi gateway IP of the HTTP server to match the NodeMCU ESP8266 configuration.

Example:

```dart
static String serverIp = "192.168.4.22"; // NodeMCU ESP8266 IP address
static const String serverGatewayIP = "192.168.4.9"; // NodeMCU ESP8266 HTTP serverGatewayIP address
```

### License
This project is licensed under the MIT License. For more information, see the LICENSE file.

### Acknowledgments
I would like to express our heartfelt gratitude to Gregory, Casper, and Paul for being the driving force behind the creation of this application. Your inspiration, support, and encouragement have been invaluable throughout the development process. This project wouldn't have been the same without your ideas and enthusiasm. Thank you for being a constant source of motivation and for helping us turn this vision into reality. Your contributions have made this journey all the more rewarding, and we are truly thankful for your partnership.
