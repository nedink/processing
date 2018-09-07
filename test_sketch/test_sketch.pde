import processing.sound.*;
import java.util.Arrays;

float scale = 10;

SoundFile sf;
FFT fft;
int bands = 256;
float[] spectrum = new float[bands];

void setup() {
  //size(600, 400);
  fullScreen();
  
  fft = new FFT(this, bands);
  
  sf = new SoundFile(this, "audio.aiff");
  try {
    sf.frames();
  }
  catch(NullPointerException e) {
    System.exit(1);
  }
  
  fft.input(sf);
  
  sf.play();
  
  //frameRate(30);
}

void draw() {
  if (!sf.isPlaying())
    return;
  
  fft.analyze(spectrum);
  
  float avg = 0;
  float max = 0;
  for (float f : spectrum) {
    avg += f;
    if (max < f) max = f;
  }
  avg /= spectrum.length;
  
  //noStroke();
  //fill(120 + 255 * avg * 50);
  //ellipse(width/2, height/2, 300 + avg * height * 20, 300 + avg * height * 20);
  
  //background(avg > 0.007 ? avg * 255 * 10 : 0);
  background(max > 0.5 ? max * 0.1 * 255 : 0);
  
  //println(max);
  //println(avg);
  
  float last = spectrum[4];
  boolean flip = false;
  for(int i = 5; i < bands; i++) {
    
    scale = avg * 3000;
    
    
    stroke(255);
    strokeWeight(scale * 0.1 * (10 * max * last + (8 * (pow((0.9) , (i == 0 ? 1 : i))))));
    stroke(max * 255 * 10 * (pow((0.95) , (i == 0 ? 1 : i))));
    
    line(
      -4*scale + width/2 + (i - 1)*scale, 
      height/2 - last*height/2, 
      -4*scale + width/2 + i*scale, 
      height/2 - spectrum[i]*height/2
    ); 
    line(
      4*scale + width/2 - (i - 1)*scale, 
      height/2 - last*height/2, 
      4*scale + width/2 - i*scale, 
      height/2 - spectrum[i]*height/2
    );
    
    last = spectrum[i];
  }
}

void mousePressed() {
  
  if (sf.isPlaying()) sf.pause();
  else sf.play();
}
