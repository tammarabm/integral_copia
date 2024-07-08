private Escenario escenario;
//private ManejadorDeObjetos manejadorObjetos;
private JoyPad joyPad;
private int estado; //Indica en que estado se encuentra el juego
private PImage fondo;

public void setup() {
  size(640, 480);
  estado= MaquinaDeEstados.INICIANDO;
  //manejadorObjetos=new ManejadorDeObjetos();
  joyPad= new JoyPad();
  fondo=loadImage("PantallaInicio.png");
}

public void draw() {
  background(255);
  switch(estado) {
  case MaquinaDeEstados.INICIANDO:
    verPantallaInicio();
    break;
  case MaquinaDeEstados.JUGANDO:
    iniciarJuego();
    break;
  case MaquinaDeEstados.GANANDO_PARTIDA:
    break;
  case MaquinaDeEstados.PERDIENDO_PARTIDA:
    finalizarJuego();
    break;
  }
}
public void finalizarJuego() {
  PImage gameOver;
  gameOver=loadImage("gmov.png");
  imageMode(CENTER);
  image(gameOver, width/2, height/2);
  text("HOLA", width/2, height/2+200);
}

public void verPantallaInicio() {
  image(fondo, 0, 0, width, height);
}
public void iniciarJuego() {
  escenario.dibujar();
  escenario.dibujarObjetos();


  if (joyPad.isRightPressed()) {
    escenario.personaje.mover(1);
  }
  if (joyPad.isLeftPressed()) {
    escenario.personaje.mover(0);
  }
  escenario.personaje.aplicarGravedad();
}
public void keyPressed() {
  if (keyCode==ENTER && (estado == MaquinaDeEstados.INICIANDO || estado == MaquinaDeEstados.PERDIENDO_PARTIDA || estado == MaquinaDeEstados.GANANDO_PARTIDA)) {
    estado = MaquinaDeEstados.JUGANDO;
    escenario = new Escenario();
    escenario.setPosicion(new PVector (0, 0));
  }
  if (key=='a' || keyCode==LEFT && estado==MaquinaDeEstados.JUGANDO) {
    joyPad.setLeftPressed(true);
  }
  if (key=='d' || keyCode==RIGHT && estado==MaquinaDeEstados.JUGANDO) {
    joyPad.setRightPressed(true);
  }
  if (key==' ' && estado==MaquinaDeEstados.JUGANDO) {
    escenario.personaje.saltar();
  }
  if (key=='f' && (estado == MaquinaDeEstados.JUGANDO)) {
    estado = MaquinaDeEstados.PERDIENDO_PARTIDA;
  }
}
public void keyReleased() {
  if (key== 'd' || keyCode==RIGHT && estado==MaquinaDeEstados.JUGANDO) {
    joyPad.setRightPressed(false);
  }
  if (key== 'a' || keyCode==LEFT && estado==MaquinaDeEstados.JUGANDO) {
    joyPad.setLeftPressed(false);
  }
}
