// Arduino Serial Tester
// rld, cycling'74, 3.2008


int serialvalue; // value for serial input
int started = 0; // flag for whether we've received serial yet
const int ledPin = 5; 
int baseBrightness=0; 

float timeline;
int ledBrightness; 
    

void setup()
{
  Serial.begin(9600); // open the arduino serial port
  pinMode(ledPin, OUTPUT); 
}

void loop(){
  
  if(Serial.available()) // check to see if there's serial data in the buffer
  {
    serialvalue = Serial.read(); // read a byte of serial data
    started = 1; // set the started flag to on
  }
  
  if(started) // loop once serial data has been received
  { baseBrightness=serialvalue;  
   timeline = millis()/4000.0;
   int  ledBrightness = baseBrightness + 50 * sin( timeline * 2.0 * PI  );
        Serial.println(ledBrightness); 
   if(ledBrightness>255){ 
       ledBrightness=255; 
    } 
    Serial.println(ledBrightness); 
    analogWrite(ledPin, ledBrightness);  
    delay(10); // pause
  }
}
