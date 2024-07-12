class Escenario{
  //Atributos privados de la clase
  private PVector posicion;  //Indica la posicion del escenario
  private PImage imagen;  // Indica la imagen que tiene el escenario
  private ArrayList<Objeto> objetos; //Lista de Objeto por la relación de asociación. La clase escenario se encargará de la creacion de estos objetos
  private Personaje personaje;  //El escenario tendrá un personaje
  private Hud hud; //Interfaz de usuario para mostrar información del personaje
  
   // Atributos para sonido
  AudioPlayer[] sonidos; // Declaración de un array para los sonidos
  String[] nombresSonidos = {"sushiHit.mp3", "baldeAguaHit.mp3", "shurikenHit.mp3", "perroMaderaHit.mp3"};
   //Constructores//
   //Constructor por defecto del escenario
  public Escenario(){
  } 
  //Constructor parametrizado
  public Escenario(Minim minim){
    // Cargar los sonidos
    sonidos = new AudioPlayer[nombresSonidos.length];// Inicializa el array de sonidos con el tamaño del array de nombres
    for (int i = 0; i < nombresSonidos.length; i++) {
      sonidos[i] = minim.loadFile("data/" + nombresSonidos[i]);// Carga cada sonido
    }
    //Cargar la imagen del escenario
    imagen=loadImage("Escenario.jpg");
    
    //PERSONAJE//
    //*Se crea al Personaje en una posicion especifica y con su imagen
    Transform transformPersonaje = new Transform(new PVector(width/2,height-90));
    ImageComponent imagePersonaje = new ImageComponent("NinjaCat4.png");
    personaje = new Personaje(transformPersonaje,imagePersonaje, new PVector(320,0), 0,7);
    
    //OBJETOS//
    objetos=new ArrayList<Objeto>();
    agregarObjetos();
    
    //Inicializar el Hud//
    hud = new Hud();
  }
  
  public Escenario(PVector posicion){
    this.posicion = posicion;
  }
  
  //Metodos
  public void dibujarEscenario(){
    image(imagen,this.posicion.x,this.posicion.y, width,height+25);
    
    // Mostrar el personaje y la interfaz Hud
    personaje.display();
    hud.mostrarVida(personaje);
    hud.mostrarExperiencia(personaje);
    hud.mostrarNivelActual();
  }
  
  public void agregarObjetos(){
    //Inicializar el BonusSushi
    Transform transformBonusSushi = new Transform(new PVector(width, height/2));
    ImageComponent imageBonusSushi= new ImageComponent("BonusSushi.png");
    objetos.add(new BonusSushi(transformBonusSushi, imageBonusSushi, new PVector(150,4)));
    
    //Inicializar el BaldeAgua
    Transform transformBaldeAgua = new Transform(new PVector(-45, height-45));
    ImageComponent imageBaldeAgua= new ImageComponent("BaldeAgua.png");
    objetos.add(new BaldeAgua(transformBaldeAgua, imageBaldeAgua, new PVector(150,0)));
    
    //Inicializar el Shuriken
    Transform transformShuriken = new Transform(new PVector(width/2, -50));
    ImageComponent imageShuriken= new ImageComponent("Shuriken0.png");
    objetos.add(new Shuriken(transformShuriken, imageShuriken, new PVector(0,170)));
    
    //Inicializar el PerroMadera
    Transform transformPerroMadera = new Transform(new PVector(width/2+100, -50));
    ImageComponent imagePerroMadera= new ImageComponent("PerroMadera.png");
    objetos.add(new PerroMadera(transformPerroMadera, imagePerroMadera, new PVector(0,150)));
  } 
  public void verificarColisiones(){
    if (!objetos.isEmpty()){
      for (int i=objetos.size()-1; i>=0; i--){
        Objeto o= objetos.get(i);
        if(o instanceof BonusSushi) {
          Colisionador colisionadorSushi = o.getColisionador();
          if(personaje.getColisionador().verificarColision(colisionadorSushi)){
            objetos.remove(i);
            println("Colisión detectada con Sushi");
            personaje.aumentarExperiencia(5);
            sonidos[0].rewind(); // Reinicia el audio 
            sonidos[0].play();
            sonidos[0].setGain(-10);// Ajusta el volumen
            //personaje.setExperiencia(personaje.getExperiencia()+5);
            crearNuevoBonusSushi();         
          }
        }
        //Verificar si el personaje colisiona con el baldeAgua
        if (o instanceof BaldeAgua) {
          Colisionador colisionadorBalde = o.getColisionador(); //Se obtiene el colisionador del BaldeAgua
          if (personaje.getColisionador().verificarColision(colisionadorBalde)){ 
            objetos.remove(i);
            // Acción a realizar en caso de colisión
            println("Colisión detectada con BaldeAgua");
            personaje.reducirVida(1);
            sonidos[1].rewind(); // Reinicia el audio 
            sonidos[1].play();
            sonidos[1].setGain(1);// Ajusta el volumen
            crearNuevoBaldeAgua();
          }
        }
        if(o instanceof Shuriken) {
          Colisionador colisionadorShuriken = o.getColisionador();
          if(personaje.getColisionador().verificarColision(colisionadorShuriken)){
            objetos.remove(i);
            println("Colisión detectada con Shuriken");
            personaje.reducirVida(2);
            sonidos[2].rewind();// Reinicia el audio 
            sonidos[2].play();
            sonidos[2].setGain(-8);// Ajusta el volumen
            //personaje.setExperiencia(personaje.getExperiencia()+5);
            crearNuevoShuriken();         
          }
        }
        if(o instanceof PerroMadera) {
          Colisionador colisionadorPerroMadera = o.getColisionador();
          if(personaje.getColisionador().verificarColision(colisionadorPerroMadera)){
            objetos.remove(i);
            println("Colisión detectada con PerroMadera");
            personaje.reducirExperiencia(10);
            sonidos[3].rewind();// Reinicia el audio 
            sonidos[3].play();
            sonidos[3].setGain(-9);// Ajusta el volumen
            //personaje.setExperiencia(personaje.getExperiencia()+5);
            crearNuevoPerroMadera();         
          }
        }
        
       }
      }
    }
  
  
  public void dibujarObjetos(){
    //println(objetos.isEmpty());
    if (!objetos.isEmpty()){
      for (int i=objetos.size()-1; i>=0; i--){
        Objeto o= objetos.get(i);
        o.mover();
        o.display();
        if (o instanceof BonusSushi && o.transform.getPosicion().x < -200) {
            objetos.remove(i);
            crearNuevoBonusSushi();
        
        }else if (o instanceof BaldeAgua && o.transform.getPosicion().x > width+width) {
            objetos.remove(i);
            crearNuevoBaldeAgua();
          
        }
        else if (o instanceof Shuriken && o.transform.getPosicion().y > height) {
          objetos.remove(i);
          crearNuevoShuriken();
         
        }
        else if(o instanceof PerroMadera && o.transform.getPosicion().y > height){
          objetos.remove(i);
          crearNuevoPerroMadera();
        }
      }
    }
  }
  
  
  public void crearNuevoBonusSushi(){
    Transform transformBonusSushi = new Transform(new PVector(width, random(this.posicion.y+200,height-80)));
    ImageComponent imageBonusSushi= new ImageComponent("BonusSushi.png");
    BonusSushi nuevoSushi= new BonusSushi(transformBonusSushi, imageBonusSushi, new PVector(150,0));
    objetos.add(nuevoSushi);
  }
  public void crearNuevoBaldeAgua(){
    Transform transformBaldeAgua = new Transform(new PVector(-45, height-45));
    ImageComponent imageBaldeAgua= new ImageComponent("BaldeAgua.png");
    BaldeAgua nuevoBaldeAgua= new BaldeAgua(transformBaldeAgua, imageBaldeAgua, new PVector(150,0));
    objetos.add(nuevoBaldeAgua);
  }
  
  public void crearNuevoShuriken(){
    Transform transformShuriken = new Transform(new PVector(random(width), random(-200,-50)));
    ImageComponent imageShuriken= new ImageComponent("Shuriken0.png");
    Shuriken nuevoShuriken= new Shuriken(transformShuriken, imageShuriken, new PVector(0,170));
    objetos.add(nuevoShuriken);
  }
  public void crearNuevoPerroMadera(){
    Transform transformPerroMadera = new Transform(new PVector(random(width), random(-500,-50)));
    ImageComponent imagePerroMadera= new ImageComponent("PerroMadera.png");
    PerroMadera nuevoPerroMadera=new PerroMadera(transformPerroMadera, imagePerroMadera, new PVector(0,100));
    objetos.add(nuevoPerroMadera);
  }
  
  
  //Metodos accesores
   public void setPosicion(PVector posicion){
    this.posicion=posicion; 
  }
  
  public PVector getPosicion(){
    return this.posicion;
  }
}
