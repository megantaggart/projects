int geiger_pin = 2;
int meter_pin = 9; 

unsigned long counts = 0;
void impulse()
{
  counts++;
}

#define LOG_PERIOD 1000
#define NUM_LOGS   30

unsigned long count_log[NUM_LOGS];
int count_index = 0;
int total_counts = 0;

void setup()
{
   Serial.begin(9600);
   pinMode( meter_pin, OUTPUT );
  analogWrite(meter_pin, 0 );
  pinMode(geiger_pin, INPUT);
  for (int i=0;i<NUM_LOGS;i++)
  {
    count_log[i]=0;
  }
  attachInterrupt(digitalPinToInterrupt(geiger_pin), impulse, FALLING);
}


unsigned long previousMillis = 0;
void loop() 
{
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis > LOG_PERIOD) 
  {
    previousMillis = currentMillis;
    count_log[count_index] = counts;
    count_index++;
    if ( count_index >= NUM_LOGS )
    {
      count_index = 0;
    }
    total_counts++;
    if ( total_counts > NUM_LOGS )
    {
      total_counts = NUM_LOGS;
    }
    counts=0;
    unsigned total = 0;
    for ( int i=0;i < total_counts; i++)
    {
      total += count_log[i];
    }

    double cpms = (double)total;
    cpms = cpms / ( (double)LOG_PERIOD * (double)total_counts);
    double cps = cpms * 1000;
    double cpm = 60 * cps;
  
    Serial.print("cps: " );
    Serial.println(cps );
    Serial.print("cpm: " );
    Serial.println(cpm );
      
    int meter_val = 0;
    if ( cpm < 1.427 )
    {
      meter_val = 22 * (cpm / 1.427);
    }
    else
    {
      meter_val = 29.773 * log ( cpm ) + 11.416;
    }
    analogWrite(meter_pin, meter_val );
  }     
}
