#include <ButtonDebounce.h>

const int output_pin  =  8; 
const int gate_button_pin = 10;
const int gate_status_pin = 11;


ButtonDebounce gate_button(gate_button_pin, 250);
ButtonDebounce gate_status(gate_status_pin, 1000);
 

void pulse_gate_control()
{
   digitalWrite(output_pin,LOW);
   delay(2000);
   digitalWrite(output_pin,HIGH);
   delay(1000);
}

void gate_button_changed(int state)
{
  Serial.println("Gate button changed to " + String(state));
  
  if(gate_status.state() == LOW)
  {
    if(state == HIGH)
    {
      Serial.println("Gate was open - now closing");
      pulse_gate_control();
    }
  }
  else
  {
    if(state == LOW)
    {
      Serial.println("Gate was closed - now opening");
      pulse_gate_control();
    }
  }

}

void gate_status_changed(int state)
{
  Serial.println("Gate status changed to " + String(state));
}

void setup() {
  Serial.begin(115200);
  pinMode(output_pin,OUTPUT); 
  digitalWrite(output_pin,HIGH);
  gate_button.setCallback(gate_button_changed);
  gate_status.setCallback(gate_status_changed);
}

void loop() {
  gate_button.update();
  gate_status.update();
}
