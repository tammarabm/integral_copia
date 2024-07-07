class Escenario{
  //Atributos
  private PVector posicion;
  private PImage imagen;
  private ArrayList<Objeto> objetos;
  private Personaje personaje;
  private Hud hud; 
  
  
  //Constructores
  public Escenario(){
    imagen=loadImage("Background.jpg");
    
    //PERSONAJE//
    //*Se crea al Personaje en una posicion especifica y con su imagen
    Transform transformPersonaje = new Transform(new PVector(width/2,height-90));
    ImageComponent imagePersonaje = new ImageComponent("NinjaCat.png");
    personaje = new Personaje(transformPersonaje,imagePersonaje, new PVector(320,0), 0,7);
    
    //OBJETOS//
    objetos=new ArrayList<Objeto>();
    agregarObjetos();
    
    //HUD//
    hud = new Hud();
  }
  
  public Escenario(PVector posicion){
    this.posicion = posicion;
  }
  
  //Metodos
  public void dibujar(){
    image(imagen,this.posicion.x,this.posicion.y, width,height+25);
    personaje.display();
    hud.mostrarVida(personaje);
    hud.mostrarExperiencia(personaje);
    hud.mostrarNivelActual();
  }
  
  public void agregarObjetos(){
    Transform transformBonusSushi = new Transform(new PVector(width-100, height/2));
    ImageComponent imageBonusSushi= new ImageComponent("BonusSushi.png");
    objetos.add(new BonusSushi(transformBonusSushi, imageBonusSushi, new PVector(0,4)));
  } 
  
  public void dibujarObjetos(){
    //println(objetos.isEmpty());
    if (!objetos.isEmpty()){
      for (Objeto o: objetos){
        o.display();
      }
    }
  }
  
  //Metodos accesores
   public void setPosicion(PVector posicion){
    this.posicion=posicion; 
  }
  
}
