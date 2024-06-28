import ddf.minim.*;

Minim minim;
AudioPlayer ambiente1; // para sonidos largos
AudioPlayer ambiente2;
AudioPlayer viento;
AudioSample agua;     // para sonidos cortos
AudioSample timbre1;
AudioSample timbre2;
AudioSample timbre3;

int tiempo = 0;
boolean aguaCorriendo = false;

void setup(){
size (960, 540);

minim = new Minim (this);
ambiente1 = minim.loadFile ("ambiente1 30 minutos.mp3"); 
ambiente2 = minim.loadFile ("ambiente2 30 minutos.mp3"); 
viento = minim.loadFile ("viento 30 minutos.mp3"); 
agua = minim.loadSample ("sonidoAgua.mp3");
timbre1 = minim.loadSample ("sonido1.mp3");
timbre2 = minim.loadSample ("sonido2.mp3");
timbre3 = minim.loadSample ("sonido3.mp3");

viento.loop();
ambiente1.loop();

  
}

void draw(){
  background(220);
  fill (80);
  textSize(20);
  textAlign(CENTER);
  textMode(CENTER);
  text ("Apretar cualquier tecla", width/2, height/2);
 
 if (aguaCorriendo == true){
   tiempo++;
   
   // detalles extra
   push(); 
   background(#A9EAFF);
   fill (50);
   textSize(50);
   text (tiempo/60, width/2, height/2);
   pop();
   
 }
 if(tiempo == 5*60 && aguaCorriendo == true){
    agua.stop();
    timbre1.trigger();
    aguaCorriendo = false;
    tiempo = 0;
  }

 println (tiempo);
 println (aguaCorriendo);
}

void keyPressed(){
 agua.trigger();
 aguaCorriendo = true;
 
}


/*
sonido.loop(); -- sonido en loop
sonido.trigger(); -- dispara el sonido
sonido.stop(); -- pausar el sonido
sonido.play(); -- el sonido se reproduce desde donde quedó

*/
