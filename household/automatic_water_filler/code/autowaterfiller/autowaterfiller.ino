#include <LiquidCrystal.h>
#include <EEPROM.h>

LiquidCrystal lcd(2, 3, 4, 5, 6, 7); 

int voltage_monitor_pin = A7;
int water_level_pin = 8;
int num_supply_fails = 0;

void setup()
{ 
  pinMode(water_level_pin, INPUT); 
  lcd.begin(16,2);
  lcd.setCursor(1,1);
  lcd.print("MegansProjects"); // Prints "Arduino" on the LCD 
  num_supply_fails = EEPROM.read(0);
}

char message_top[17];

void check_power_supply()
{
  const int supply_limit = 400;
  int supply = analogRead(voltage_monitor_pin);
  if ( supply < supply_limit )
  {
    // Supply is about to disappear, write value to eeprom
    int val = EEPROM.read(0); 
    EEPROM.write(0, val+1); 
  }
}
void loop() 
{
  check_power_supply();
  
  lcd.clear(); // Clears the display 
  lcd.setCursor(0,0);
  sprintf(message_top, "fails %d", num_supply_fails);
  lcd.print(message_top);
  int water_level = digitalRead(water_level_pin);

  lcd.setCursor(0,1);
  if ( water_level == 0)
  {
    lcd.print("Water OK");
  }
  else
  {
    lcd.print("Need water");
  }
  delay(1000);
}
