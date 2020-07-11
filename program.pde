#include <Servo.h>

const int EX = A4, EY = A5, BT = 2; // This line is for a joystick and the meaning is: EX = Axis X, EY = Axis Y & BT = Button
int LBT, LEX, LEY, a = 178; // This line is for some inputs and the meaning is: LBT = Reading Button, LEX = Reading Axis X, LEY = Reading Axis Y & a = variable angle of the claw
Servo servomotor;

void setup() {
  pinMode(EX, INPUT);
  pinMode(EY, INPUT);
  pinMode(BT, INPUT_PULLUP);
  servomotor.attach(8);
  servomotor.write(a);
}

void loop() {
  LEX = analogRead(EX);
  LEY = analogRead(EY);
  LBT = digitalRead(BT);
  
  if(LEX >= 1000){
    a = a - 1;
    servomotor.write(a);
    if(a <= 88){
      a = 88;
      servomotor.write(a);
    }
  }
  else if(LEX <= 100){
    a = a + 1;
    servomotor.write(a);
    if (a >= 178)
    a = 180;
    servomotor.write(a);
  }
  
  if(LBT == 0){
      a = 178;
      servomotor.write(a);
  }
  delay(10);
}
