class Hud{
  private PFont font;
  private int tamañoLetra;  //tamaño de la fuente. define la dimension que ocuparan las letras en unidades de pixeles
  
  //Constructor por defecto
  public Hud(){
    font=loadFont("TempusSansITC-48.vlw"); //Carga la fuente
    tamañoLetra= 25;
  }
  //Metodos
  public void mostrarNivelActual(){
    textAlign(CENTER);
    textSize(tamañoLetra);
    text("Nivel: ", width-100, 30); 
  }
  
  public void mostrarVida(Personaje personaje){  
    textFont(font);   //Selecciona la fuente actual
    textAlign(CENTER);
    textSize(tamañoLetra);
    text("Vida: "+ personaje.getVida(),90, 30);
  }
  
  public void mostrarExperiencia(Personaje personaje){
    textAlign(CENTER);
    textSize(tamañoLetra);
    text("Experiencia: %"+ personaje.getExperiencia(),  width/2, 30);
  }
  
}
