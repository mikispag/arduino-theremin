// Arduino-Theremin
// A simple, minimalistic Arduino-based piano-theremin.
//
// Needs a SRF05 sensor with Echo connected to digital pin 2 and
// Trigger/Init connected to pin 3.
//
// Author: Michele Spagnuolo <michele [|at|] spagnuolo.me>
// Based on http://luckylarry.co.uk/arduino-projects/arduino-basic-theremin-meets-processing/

int echoPin = 2;              // the SRF05's echo pin
int initPin = 3;              // the SRF05's init pin
unsigned long pulseTime = 0;  // variable for reading the pulse
unsigned long distance = 0;   // variable for storing the distance

void setup() {
  pinMode(initPin, OUTPUT);
  pinMode(echoPin, INPUT);

  Serial.begin(115200);
}
void loop() {
  // Send the sensor a 10us pulse (trigger)
  digitalWrite(initPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(initPin, LOW);

  // wait for the pulse to return. The pulse
  // goes from low to HIGH to low, so we specify
  // that we want a HIGH-going pulse below:
  pulseTime = pulseIn(echoPin, HIGH);

  // convert the microsecond time to distance in CM
  distance = pulseTime/58;

  Serial.print('A');
  Serial.print(distance);
  Serial.print('B');

  // MANDATORY - ultrasounds need to fade out
  delay(50);
}

