//Suraj Joshi and Harvey Duong
//Date Modified: 3/10/2020
//A synthesizer

import processing.sound.*;
Delay delay;

SinOsc sine;
SawOsc saw;
SqrOsc square;
TriOsc triangle;
Pulse pulse;
float octave = 1.0;
LowPass lowPass;
HighPass highPass;
BandPass bandPass;
int lowFreq = 0;
int highFreq = 0;
int firstBPass = 0;
int secondBPass = 0;
boolean onLow = false;
boolean onHigh = false;
boolean onBandPass = false;
Env env;
float attackTime = 0.000;
float sustainTime = 0.000;
float sustainLevel = 0.0;
float releaseTime = 0.0;
float LFO;
float LFORange = 0;
float phaser = 0;
float time=0.0;
float feedback=0.0;
PFont f;

//boolean delay2;

boolean vibrato = false, Phaser = false, enve = false, tremolo = false;

boolean Sine = false, Saw = false, Square = false, Triangle = false, Pulse = false;

boolean a = false, b = false, c = false, d = false, e = false, g = false, h = false, 
i = false, j = false , k = false , l = false , m = false ,n = false;



void setup(){

  size(490, 490);
  sine = new SinOsc(this);
  pulse = new Pulse(this);
  triangle = new TriOsc(this);
  saw = new SawOsc(this);
  square = new SqrOsc(this);
  lowPass = new LowPass(this);
  highPass = new HighPass(this);
  bandPass = new BandPass(this);
  env = new Env(this);

 
  delay = new Delay(this);
  f = createFont("Arial",16,true);
  textFont(f,12);
 
} // setup
 
 void draw(){
   sine();  // done
   saw(); // done
   pulse(); // done
   triangle2(); // done 
   Square(); // done
   Delay(); // delay
   phaser();
   Highpass();
   Lowpass();
   Bandpass();
   vibrato();
   Envelope();
   if(onLow)
   {
     if(Sine)
     {
       lowPass.process(sine);
     }
     else if(Saw)
     {
       lowPass.process(saw);
     }
     else if(Triangle)
     {
       lowPass.process(triangle);
     }
     else if(Square)
     {
       lowPass.process(square);
     }
     else if(Pulse)
     {
       lowPass.process(pulse);
     }
   }
   else if(onHigh)
   {
     if(Sine)
     {
       highPass.process(sine);
     }
     else if(Saw)
     {
       highPass.process(saw);
     }
     else if(Triangle)
     {
       highPass.process(triangle);
     }
     else if(Square)
     {
       highPass.process(square);
     }
     else if(Pulse)
     {
       highPass.process(pulse);
     }
   }
   else if(onBandPass)
   {
     if(Sine)
     {
       bandPass.process(sine, firstBPass, secondBPass);
     }
     else if(Saw)
     {
       bandPass.process(saw, firstBPass, secondBPass);
     }
     else if(Triangle)
     {
       bandPass.process(triangle, firstBPass, secondBPass);
     }
     else if(Square)
     {
       bandPass.process(square, firstBPass, secondBPass);
     }
     else if(Pulse)
     {
       bandPass.process(pulse, firstBPass, secondBPass);
     }
   }
   if(tremolo)
   {
        pulse.amp(.9);
        sine.amp(.9);
        saw.amp(.9);
        square.amp(.9);
        triangle.amp(.9);
        delay(10);
        pulse.amp(-.1);
        sine.amp(-.1);
        saw.amp(-.1);
        square.amp(-.1);
        triangle.amp(-.1); 
   }
   if(vibrato)
   {
        pulse.freq(octave*LFO + LFORange);
        sine.freq(octave*LFO + LFORange);
        saw.freq(octave*LFO + LFORange);
        square.freq(octave*LFO + LFORange);
        triangle.freq(octave*LFO + LFORange);
        delay(10);
        pulse.freq(octave*LFO - LFORange);
        sine.freq(octave*LFO - LFORange);
        saw.freq(octave*LFO - LFORange);
        square.freq(octave*LFO - LFORange);
        triangle.freq(octave*LFO - LFORange); 
   }
   if(Phaser)
   {
        pulse.freq(octave*LFO + phaser);
        sine.freq(octave*LFO + phaser);
        saw.freq(octave*LFO + phaser);
        square.freq(octave*LFO + phaser);
        triangle.freq(octave*LFO + phaser);
        delay(100);
        pulse.freq((octave*LFO) + (2*phaser));
        sine.freq((octave*LFO) + (2*phaser));
        saw.freq((octave*LFO) + (2*phaser));
        square.freq((octave*LFO) + (2*phaser));
        triangle.freq((octave*LFO) + (2*phaser));
        delay(100);
        pulse.freq((octave*LFO) + (3*phaser));
        sine.freq((octave*LFO) + (3*phaser));
        saw.freq((octave*LFO) + (3*phaser));
        square.freq((octave*LFO) + (3*phaser));
        triangle.freq((octave*LFO) + (3*phaser));
        delay(100);
        pulse.freq((octave*LFO) + (4*phaser));
        sine.freq((octave*LFO) + (4*phaser));
        saw.freq((octave*LFO) + (4*phaser));
        square.freq((octave*LFO) + (4*phaser));
        triangle.freq((octave*LFO) + (4*phaser));
        delay(100);
        pulse.freq((octave*LFO) + (5*phaser));
        sine.freq((octave*LFO) + (5*phaser));
        saw.freq((octave*LFO) + (5*phaser));
        square.freq((octave*LFO) + (5*phaser));
        triangle.freq((octave*LFO) + (5*phaser));
        delay(100);
        pulse.freq((octave*LFO) + (5*phaser));
        sine.freq((octave*LFO) + (5*phaser));
        saw.freq((octave*LFO) + (5*phaser));
        square.freq((octave*LFO) + (5*phaser));
        triangle.freq((octave*LFO) + (5*phaser));
        delay(100);
        pulse.freq((octave*LFO) + (4*phaser));
        sine.freq((octave*LFO) + (4*phaser));
        saw.freq((octave*LFO) + (4*phaser));
        square.freq((octave*LFO) + (4*phaser));
        triangle.freq((octave*LFO) + (4*phaser));
        delay(100);
        pulse.freq((octave*LFO) + (3*phaser));
        sine.freq((octave*LFO) + (3*phaser));
        saw.freq((octave*LFO) + (3*phaser));
        square.freq((octave*LFO) + (3*phaser));
        triangle.freq((octave*LFO) + (3*phaser));
        delay(100);
        pulse.freq((octave*LFO) + (2*phaser));
        sine.freq((octave*LFO) + (2*phaser));
        saw.freq((octave*LFO) + (2*phaser));
        square.freq((octave*LFO) + (2*phaser));
        triangle.freq((octave*LFO) + (2*phaser));
        delay(100);
        pulse.freq(octave*LFO + phaser);
        sine.freq(octave*LFO + phaser);
        saw.freq(octave*LFO + phaser);
        square.freq(octave*LFO + phaser);
        triangle.freq(octave*LFO + phaser);
   }
   if(enve)
   {
     if(Sine)
     {
        env.play(sine, attackTime, sustainTime, sustainLevel, releaseTime);
     }
     else if(Saw)
     {
        env.play(saw, attackTime, sustainTime, sustainLevel, releaseTime);
     }
     else if(Triangle)
     {
        env.play(triangle, attackTime, sustainTime, sustainLevel, releaseTime);
     }
     else if(Square)
     {
        env.play(square, attackTime, sustainTime, sustainLevel, releaseTime);
     }
     else if(Pulse)
     {
        env.play(pulse, attackTime, sustainTime, sustainLevel, releaseTime);
     }
   }
 }
 
 
 
 void sine(){ 
   
   if(a){
      fill(243);
      a = false;
   }
    else
      fill(0);
   square(30, 20, 55);
   fill(230);
   text("sine", 40, 50); 
  }
  
  void saw(){
    if(b){
       fill(243);
       b = false;   
    }
   else    
        fill(0); 
        
   square(100, 20, 55);
   fill(230);
   text("saw", 110, 50);
  }
  
  void pulse(){
    if(c){
        fill(243);
        c = false;   
    }
   else    
        fill(0);   
     
   square(170, 20, 55);
   fill(230);
   text("pulse", 180, 50);  
  }
  
  void triangle2(){ 
    if(d){
        fill(243);
         d = false;   
    }
   else    
        fill(0);  
    
    
   square(240, 20, 55);
   fill(230);
   text("triangle", 245, 50);    
  }
  
  void Square(){
    if(e == true){
          fill(243);
          e = false;
    }
   else    
        fill(0);
    
    
   square(310, 20, 55);
   fill(230);
   text("square", 315, 50);    
  }
  
  void Delay(){ 
    
    if(g){
        fill(243);
        g = false;   
    }
   else    
        fill(0);
    
  
   square(380, 20, 55);
   fill(230);
   text("delay", 385, 50); 
  }
  
 void phaser(){ 
   if(h){
        fill(243);
     h = false;    
   }
   else    
        fill(0);
   
   
   square(30, 100, 50);
   fill(230);
    text("Tremolo", 30, 123); 
   text(phaser, 30, 140); 
 }
 
 void Highpass(){
   if(i){
        fill(243);
    i = false;    
   }
   else    
        fill(0);
   
 
   square(100, 100, 50);
   fill(230);
   text("Highpass", 100, 123); 
   text(highFreq, 100, 140);
 }
 
 void Lowpass(){
   if(j){
         fill(243);
         j = false;
   }
   else    
        fill(0);
   
   square(170, 100, 55);
   fill(230);
   text("lowpass", 170,123); 
    text(lowFreq, 170,140);
 }
 
 void Bandpass(){
   if(n){
        fill(243);
    n = false;    
   }
   else    
        fill(0);
   
   rect(240, 100, 55, 90);
   fill(230);
      text("bandpass", 240, 123); 
text(firstBPass, 240, 140);
text(secondBPass, 240, 160); 
 }
 
 void vibrato(){
   if(k){
        fill(243);
        k = false;
   }
   else    
        fill(0);
    
   square(310, 100, 55);
   fill(230);
   text("Vibrato", 310, 123); 
   text(LFORange, 310, 140); 
 }
 
 void Envelope(){
   if(l){
        fill(243);
    l = false;    
   }
   else    
        fill(0);
    
   rect(380, 100, 100, 200);
   fill(230);
   text("Envelope", 380, 115); 
   text("attackTime", 380, 140); 
   text(attackTime, 380, 160);
   text("sustainTime", 380, 175); 
   text(sustainTime, 380, 190);
   text("releaseTime", 380, 210); 
   text(releaseTime, 380, 230);
    text("sustainLevel", 380, 245); 
   text(sustainLevel, 380, 260); 
   
   
 }

 

 
 
void keyPressed(){
   switch(key){
      case 'a':
           sine.stop();
           pulse.stop();
           saw.stop();
           square.stop();
           octave = 1.0;
           lowPass.stop();
           highPass.stop();
           bandPass.stop();
           attackTime = 0.000;
           sustainTime = 0.000;
           sustainLevel = 0.0;
           releaseTime = 0.0;
        //   time = 0.0;
        //   feedback = 0.0;
       //delay.process(sine, 0);
       //delay.time(0);
           LFORange = 0.0;
           phaser = 0.0;
           //delay.set(time, feedback);
           onLow = false;
           onHigh = false;
           onBandPass = false;
           vibrato = false;
           Phaser = false;

      break;
      case 'q':
           LFO = 261;
           pulse.freq(octave*261);
           sine.freq(octave*261);
           saw.freq(octave*261);
           square.freq(octave*261);
           triangle.freq(octave*261);
      break;
      case 'w':
           LFO = 277;
           square.freq(octave*277);
           saw.freq(octave*277);
           sine.freq(octave*277);
           pulse.freq(octave*277);
           triangle.freq(octave*277);
      break;
      case 'e':
           LFO = 293;
           pulse.freq(octave*293);
           sine.freq(octave*293);
           saw.freq(octave*293);
           square.freq(octave*293);
           triangle.freq(octave*293);

      break;
      case 'r':
           LFO = 311;
           square.freq(octave*311);
           pulse.freq(octave*311);
           sine.freq(octave*311);
           saw.freq(octave*311);
           triangle.freq(octave*311);
      break;
      case 't':
           LFO = 329;
           pulse.freq(octave*329);
           sine.freq(octave*329);
           saw.freq(octave*329);
           square.freq(octave*329); 
           triangle.freq(octave*329);
      break;
      case 'y':
           LFO = 349;
           square.freq(octave*349);
           saw.freq(octave*349);
           sine.freq(octave*349);
           pulse.freq(octave*349);
           triangle.freq(octave*349);
     break;
     case 'u':
           LFO = 369;
           pulse.freq(octave*369);
           sine.freq(octave*369);
           saw.freq(octave*369);
           square.freq(octave*369);
           triangle.freq(octave*369);
       break;
       case 'i':
           LFO = 391;
           pulse.freq(octave*391);
           sine.freq(octave*391);     
           saw.freq(octave*391); 
           square.freq(octave*391); 
           triangle.freq(octave*391);
       break;
       case 'o':
           LFO = 415;
           pulse.freq(octave*415);
           sine.freq(octave*415);
           saw.freq(octave*415);
           square.freq(octave*415);
           triangle.freq(octave*415);
       break;
       case 'p':
           LFO = 440;
           pulse.freq(octave*440);
           sine.freq(octave*440);
           saw.freq(octave*440);
           square.freq(octave*440);
           triangle.freq(octave*440);
       break;
       case '[':
           LFO = 446;
           saw.freq(octave*446);
           square.freq(octave*446);
           sine.freq(octave*466);
           pulse.freq(octave*466);
           triangle.freq(octave*466);
       break;
       case ']':
           LFO = 494;
           square.freq(octave*494);
           saw.freq(octave*494);
           sine.freq(octave*494);
           pulse.freq(octave*494);
           triangle.freq(octave*494);
       break;
       case 'z':
          a = true;
           sine.play();
           pulse.stop();
           saw.stop();
           square.stop();
           triangle.stop();
           Sine = true;
           Saw = false;
           Pulse = false; 
           Triangle = false;
           Square = false;
       break;
       case 'x':
       c = true;
           pulse.play();    
           sine.stop();
           saw.stop();
           square.stop();
           triangle.stop();
           Pulse = true;
           Sine = false;
           Triangle = false; 
           Square = false;
           Saw = false;
       break;
       case 'c':
      b = true;
           saw.play();
           sine.stop();
           pulse.stop();
           square.stop();
           triangle.stop();
           Saw = true;
           Sine = false;
           Triangle = false;
           Square = false;
           Pulse = false;
       break;
       case 'v':
         e = true;
        
           square.play();
           sine.stop();
           pulse.stop();
           saw.stop();
           triangle.stop();
           Square = true;
           Sine = false;
           Pulse = false;
           Saw = false;
           Triangle = false;
       break;
       case 'b':
       d = true;
           triangle.play();
           sine.stop();
           pulse.stop();
           saw.stop();
           square.stop();
           Triangle = true;
           Square = false;
           Saw = false;
           Pulse = false;
           Sine = false;
       break;
       case ',':    
           if(octave > 1)
           {
              octave = octave/2.0;
           }
       break;
       case '.':
           octave = octave * 2.0;
       break;
      
       case '/':
       l = true;
       enve = true;
       break;
       case 'k':
       j = true;
            onLow = true;
       break;
       
       case 'l':
       i = true;
            onHigh = true;
       break;
       
       case ';':
       n = true;
             onBandPass = true;
       break;
       
       case 's':
            lowFreq = lowFreq + 10;
            lowPass.freq(lowFreq);
            print(lowFreq);
       break;
       
       case 'd':
             if(lowFreq > 0)
             {
               lowFreq = lowFreq - 10;
               lowPass.freq(lowFreq);
               print(lowFreq);
             }
       break;
       
       case 'f':
       i = true;
             highFreq = highFreq + 10;
             highPass.freq(highFreq);
             print(highFreq);
       break;
      
       case 'g':
             if(highFreq > 0)
             {
               highFreq = highFreq - 10;
               highPass.freq(highFreq);
               print(highFreq);
             }
       break;
       
       case 'n':
       n = true;
             firstBPass = firstBPass + 10;
             bandPass.bw(firstBPass);
             print(firstBPass);
       break;
       
       case 'm':
             if(firstBPass > 0)
             {
               firstBPass =  firstBPass - 10;
               bandPass.bw(firstBPass);
               print(firstBPass);
             }
       break;
       
       case 'h':
             secondBPass = secondBPass + 10;
             bandPass.freq(secondBPass);
             print(secondBPass);
       break;
       
       case 'j':
             if(secondBPass > 0)
             {
               secondBPass = secondBPass - 10;
               bandPass.freq(secondBPass);
               print(secondBPass);
             }
       break;

       case '1':
       k = true;
       vibrato = true;
       break;
       
       case '2':
       h = true;
       Phaser = true;
       break;
       
       case '3':
       tremolo = true;
       break;
       case 'S':
             LFORange = LFORange + 1;
             print(LFORange);
       break;
       
       case 'D':
             if(LFORange > 0)
             {
                LFORange = LFORange - 1;
                print(LFORange);
             }
       break;
       
       case 'F':
             phaser = phaser + 1;
             print(phaser);
       break;
       
       case 'G':
             if(phaser > 0)
             {
                phaser = phaser - 1;
                print(phaser);
             }
       break;  
       
   } // switch
 
   if(key == CODED)
   {
      if(keyCode == UP)
      {
         attackTime = attackTime + .001;
         print(attackTime);
      }
      if(keyCode == DOWN)
      {
         sustainTime = sustainTime + .001;
         print(sustainTime);
      }
      if(keyCode == LEFT)
      { 
         sustainLevel = sustainLevel + .01;
         print(sustainLevel);
      }
      if(keyCode == RIGHT)
      {
          releaseTime = releaseTime + .01;
          print(releaseTime);
      }
   }
} //keyPressed


void mousePressed() {
  g = true;
   //time = 0.2;
  // feedback = 0.3;
 //  delay.set(time, feedback);
   delay.process(sine, 5);
   
   
  // delay.process(saw,5);
  // delay.process(triangle, 5);
 // delay.process(pulse, 5);
  // delay.process(square, 5);
  delay.time(0.5);
}
