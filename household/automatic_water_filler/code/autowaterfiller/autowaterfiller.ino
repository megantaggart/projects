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

#define WATER_LEVEL_OK  1
#define WATER_LEVEL_LOW 0


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
const unsigned long reset_debounce_time = 100;
int reset_button_counts = 0;

int water_level_state = WATER_LEVEL_OK;
unsigned long water_level_debounce_start = 0;
// Reset debounce time in ms
const unsigned long water_level_debounce_time = 500;

unsigned long valve_open_time = 0;
unsigned long total_ml_filled = 0;
unsigned long valve_open_duration = 0;

unsigned long last_display_time = 0;
unsigned long lcd_update_time = 500;
const unsigned long lcd_lightup_time = 10000;
unsigned long lcd_light_on_time = 0;

int num_fills = 0;
char message_top[17];
char message_bot[17];

void read_total_from_eeprom()
{
  total_ml_filled =  (unsigned long )EEPROM.read(3);
  total_ml_filled <= 8;
  total_ml_filled += (unsigned long )EEPROM.read(2);
  total_ml_filled <= 8;
  total_ml_filled += (unsigned long )EEPROM.read(1);
  total_ml_filled <= 8;
  total_ml_filled += (unsigned long )EEPROM.read(0);
}

void write_total_to_eeprom()
{
  EEPROM.write(0, total_ml_filled & 0xff ); 
  EEPROM.write(1, ( total_ml_filled & 0xff00 ) >> 8 ); 
  EEPROM.write(2, ( total_ml_filled & 0xff0000 ) >> 16 ); 
  EEPROM.write(3, ( total_ml_filled & 0xff000000 ) >> 24 ); 
}
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

  read_total_from_eeprom();

  reset_debounce_start = millis();
  valve_open_time = millis();
}


void check_power_supply()
{
  const int supply_limit = 450;
  int supply = analogRead(voltage_monitor_pin);
  if ( supply < supply_limit )
  {
    // Supply is about to disappear, write value to eeprom
    write_total_to_eeprom();
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
        digitalWrite (lcd_backlight_pin, 1);
        lcd_light_on_time = millis();
        reset_button_counts ++;
        if ( reset_button_counts >= 5 )
        {
          total_ml_filled = 0;
        }
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
    if ( water_level_state == WATER_LEVEL_LOW )
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
      if ( water_level_state == WATER_LEVEL_OK)
      {
        digitalWrite (sonenoid_valve_pin, 0);
        unsigned long now = millis();
        valve_open_duration = now - valve_open_time;
        total_ml_filled = total_ml_filled + ( valve_open_duration / MS_TO_ML );
        if ( num_fills > 20 )
        {
          num_fills = 0;
          write_total_to_eeprom();
        }
      }
      else
      {
        digitalWrite (sonenoid_valve_pin, 1);
        valve_open_time = millis();
        unsigned long valve_open_duration = 0;
        num_fills++;
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
  
  if ( water_level_state == WATER_LEVEL_LOW )
  {
    // Filling water
    digitalWrite (lcd_backlight_pin, 1);
    lcd_light_on_time = millis();
    sprintf(message_top, "Filling water...");
    unsigned long water_ml = valve_open_duration / MS_TO_ML;
    sprintf(message_bot, "%13d ml", water_ml );
  }
  else
  {
    // Not filling
    unsigned long now = millis();
    unsigned long time_lcd_light_on = now - lcd_light_on_time ;
    if ( time_lcd_light_on >= lcd_lightup_time )
    {
      digitalWrite (lcd_backlight_pin, 0);
      reset_button_counts = 0;
      return;
    }
    if ( reset_button_counts > 1)
    {
      sprintf(message_top, "    Reset : %2d  ", reset_button_counts);
    }
    else
    {
      sprintf(message_top, "  Total filled  ");
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
  check_power_supply();
  handle_water_control();
  check_power_supply();
  update_display();
}
