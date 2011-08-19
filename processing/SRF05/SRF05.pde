// Arduino-Theremin
// A simple, minimalistic Arduino-based piano-theremin.
//
// Author: Michele Spagnuolo <michele [|at|] spagnuolo.me>
// Based on http://luckylarry.co.uk/arduino-projects/arduino-basic-theremin-meets-processing/

import processing.serial.*;
import ddf.minim.*;

Serial port;

Minim minim;
AudioSample GSharp;
AudioSample A;
AudioSample Bb;
AudioSample B;
AudioSample C;
AudioSample CSharp;
AudioSample D;
AudioSample Eb;
AudioSample E;
AudioSample F;
AudioSample FSharp;
AudioSample G;

void setup() {
  port = new Serial(this, Serial.list()[0], 115200);

  minim = new Minim(this);
  GSharp = minim.loadSample("GSharp.wav", 2048);
  A = minim.loadSample("A.wav", 2048);
  Bb = minim.loadSample("Bb.wav", 2048);
  B = minim.loadSample("B.wav", 2048);
  C = minim.loadSample("C.wav", 2048);
  CSharp = minim.loadSample("CSharp.wav", 2048);
  D = minim.loadSample("D.wav", 2048);
  Eb = minim.loadSample("Eb.wav", 2048);
  E = minim.loadSample("E.wav", 2048);
  F = minim.loadSample("F.wav", 2048);
  FSharp = minim.loadSample("FSharp.wav", 2048);
  G = minim.loadSample("G.wav", 2048);
}

void draw() {
  int bpos = -1;
  int pulse = 999;
  String serialBuffer = port.readString();

  if (serialBuffer != null) {
    bpos = serialBuffer.indexOf("B");

    if (serialBuffer.charAt(0) == 'A' && bpos > -1) {
      serialBuffer =  serialBuffer.substring(1, bpos);
      try {
        pulse = Integer.parseInt(serialBuffer);
        println(pulse);
      } 
      catch (Exception e) {
      }

      if ( pulse < 5 ) {
        GSharp.trigger();
        delay(25);
      }
      else if ( pulse < 8 ) {
        A.trigger();
        delay(25);
      }
      else if ( pulse < 11 ) {
        Bb.trigger();
        delay(25);
      }
      else if ( pulse < 14 ) {
        B.trigger();
        delay(25);
      }
      else if ( pulse < 17 ) {
        C.trigger();
        delay(25);
      }
      else if ( pulse < 20 ) {
        CSharp.trigger();
        delay(25);
      }
      else if ( pulse < 23 ) {
        D.trigger();
        delay(25);
      }
      else if ( pulse < 26 ) {
        Eb.trigger();
        delay(25);
      }
      else if ( pulse < 29 ) {
        E.trigger();
        delay(25);
      }
      else if ( pulse < 32 ) {
        F.trigger();
        delay(25);
      }
      else if ( pulse < 35 ) {
        FSharp.trigger();
        delay(25);
      }
      else if ( pulse < 38 ) {
        G.trigger();
        delay(25);
      }
    }
  }
}

