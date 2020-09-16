//                    _
// |\/| _  _  _  _  _|_) __  o _  __| _
// |  |(/_(_|(_|| |_>|  | (_)|(/_(_ |_>
//         _|               _|
//       www.megansprojects.com
// 
// Automatuic water filler

#include <LiquidCrystal.h>
#include <EEPROM.h>

#define MS_TO_ML 42

// Setup lcd using D2-7
LiquidCrystal lcd(2, 3, 4, 5, 6, 7); 

// Supply voltage monitor pin A7
int voltage_monitor_pin = A7;
// Water level sensor pin D8
int water_level_pin = 8;
// Pin to control solenoid value D9
int sonenoid_valve_pin = 9;
// Pin to control LCD backlight D10
int lcd_backlight_pin = 10;
// Reset button pin D11
int reset_pin = 11;

int reset_button_state = 0;
unsigned long reset_debounce_start = 0;
// Reset debounce time in ms
const unsigned long reset_debounce_time = 500;
int reset_button_counts = 0;

int water_level_state = 0;
unsigned long water_level_debounce_start = 0;
// Reset debounce time in ms
const unsigned long water_level_debounce_time = 500;

unsigned long valve_open_time = 0;
unsigned long total_ml_filled = 0;
unsigned long valve_open_duration = 0;

unsigned long last_display_time = 0;
unsigned long lcd_update_time = 500;

int num_supply_fails = 0;
char message_top[17];
char message_bot[17];

void setup()
{ 
  // Set up digital pins
  pinMode(water_level_pin, INPUT); 
  pinMode(reset_pin, INPUT); 
  pinMode(sonenoid_valve_pin, OUTPUT); 
  pinMode(lcd_backlight_pin, OUTPUT); 
  digitalWrite (sonenoid_valve_pin, 0);
  digitalWrite (lcd_backlight_pin, 1);
  // Start the LCD
  lcd.begin(16,2);
  
  num_supply_fails = EEPROM.read(0);

  reset_debounce_start = millis();
  valve_open_time = millis();
}


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

void handle_reset_button()
{
  int reset_value = digitalRead ( reset_pin );
  if ( reset_value == reset_button_state )
  {
    reset_debounce_start = millis();
  }
  else
  {
    unsigned long now = millis();
    unsigned long new_state_time = now - reset_debounce_start;
    if ( new_state_time >= reset_debounce_time )
    {
      reset_button_state = reset_value;
      if ( reset_button_state == 1 )
      {
        reset_button_counts ++;
      }
    }
  }
}

void handle_water_control()
{
  int water_level_value = digitalRead ( water_level_pin );
  if ( water_level_value == water_level_state )
  {
    water_level_debounce_start = millis();
    if ( water_level_state == 1 )
    { 
      unsigned long now = millis();
      valve_open_duration = now - valve_open_time;
    }
  }
  else
  {
    unsigned long now = millis();
    unsigned long press_time = now - water_level_debounce_start;
    if ( press_time >= water_level_debounce_time )
    {
      water_level_state = water_level_value;
      if ( water_level_state == 0 )
      {
        digitalWrite (sonenoid_valve_pin, 0);
        unsigned long now = millis();
        valve_open_duration = now - valve_open_time;
        total_ml_filled = total_ml_filled + ( valve_open_duration / MS_TO_ML );
      }
      else
      {
        digitalWrite (sonenoid_valve_pin, 1);
        valve_open_time = millis();
        unsigned long valve_open_duration = 0;
      }
    }
  }
}

void update_display()
{
  unsigned long now = millis();
  unsigned long time_since_display = now - last_display_time;
  if ( time_since_display < lcd_update_time )
  {
    return;
  }
  last_display_time = now;
  
  if ( water_level_state == 1 )
  {
    // Filling water
    sprintf(message_top, "Filling water...");
    unsigned long water_ml = valve_open_duration / MS_TO_ML;
    sprintf(message_bot, "%13d ml", water_ml );
  }
  else
  {
    // Not filling
    if ( reset_button_counts > 0)
    {
      sprintf(message_top, "    Reset : %2d  ", reset_button_counts);
    }
    else
    {
      sprintf(message_top, " Total filled  ");
    }
    int litres = total_ml_filled / 1000;
    int mills = total_ml_filled - ( litres * 1000 );
    sprintf(message_bot, "%10d.%03d l", litres, mills);
  }
  
  lcd.setCursor(0,0);
  lcd.print(message_top);
  lcd.setCursor(0,1);
  lcd.print(message_bot);
}

void loop() 
{
  check_power_supply();
  handle_reset_button();
  handle_water_control();
  update_display();
}
