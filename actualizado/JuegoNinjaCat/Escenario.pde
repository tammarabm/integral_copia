class Escenario{
  //Atributos
  private PVector posicion;
  private PImage imagen;
  private ArrayList<Objeto> objetos;
  private Personaje personaje;
  private Hud hud; 
  
  
  //Constructores
  public Escenario(){
    imagen=loadImage("Escenario.jpg");
    
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
    Transform transformBonusSushi = new Transform(new PVector(width, height/2));
    ImageComponent imageBonusSushi= new ImageComponent("BonusSushi.png");
    objetos.add(new BonusSushi(transformBonusSushi, imageBonusSushi, new PVector(150,4)));
    
    Transform transformBaldeAgua = new Transform(new PVector(-45, height-45));
    ImageComponent imageBaldeAgua= new ImageComponent("BaldeAgua.png");
    objetos.add(new BaldeAgua(transformBaldeAgua, imageBaldeAgua, new PVector(150,0)));
    
    Transform transformShuriken = new Transform(new PVector(width/2, -50));
    ImageComponent imageShuriken= new ImageComponent("Shuriken0.png");
    objetos.add(new Shuriken(transformShuriken, imageShuriken, new PVector(0,170)));
    
    Transform transformPerroMadera = new Transform(new PVector(width/2+100, -50));
    ImageComponent imagePerroMadera= new ImageComponent("PerroMadera.png");
    objetos.add(new PerroMadera(transformPerroMadera, imagePerroMadera, new PVector(0,150)));
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
            Transform transformBonusSushi = new Transform(new PVector(width, random(this.posicion.y+200,height-80)));
            ImageComponent imageBonusSushi= new ImageComponent("BonusSushi.png");
            BonusSushi nuevoSushi= new BonusSushi(transformBonusSushi, imageBonusSushi, new PVector(150,0));
            objetos.add(nuevoSushi);
        
        } else if (o instanceof BaldeAgua && o.transform.getPosicion().x > width) {
          objetos.remove(i);
          Transform transformBaldeAgua = new Transform(new PVector(-45, height-45));
          ImageComponent imageBaldeAgua= new ImageComponent("BaldeAgua.png");
          BaldeAgua nuevoBaldeAgua= new BaldeAgua(transformBaldeAgua, imageBaldeAgua, new PVector(150,0));
          objetos.add(nuevoBaldeAgua);
        }
        else if (o instanceof Shuriken && o.transform.getPosicion().y > height) {
          objetos.remove(i);
          Transform transformShuriken = new Transform(new PVector(random(width), random(-200,-50)));
          ImageComponent imageShuriken= new ImageComponent("Shuriken0.png");
          Shuriken nuevoShuriken= new Shuriken(transformShuriken, imageShuriken, new PVector(0,170));
          objetos.add(nuevoShuriken);
          
        }
        else if(o instanceof PerroMadera && o.transform.getPosicion().y > height){
          objetos.remove(i);
          Transform transformPerroMadera = new Transform(new PVector(random(width), random(-200,-50)));
          ImageComponent imagePerroMadera= new ImageComponent("PerroMadera.png");
          PerroMadera nuevoPerroMadera=new PerroMadera(transformPerroMadera, imagePerroMadera, new PVector(0,150));
          objetos.add(nuevoPerroMadera);
        }
      }
    }
  }
        /*if(o.transform.getPosicion().x<-200){
          objetos.remove(i);
          Transform transformBonusSushi = new Transform(new PVector(width, random(this.posicion.y+200,height-80)));
          ImageComponent imageBonusSushi= new ImageComponent("BonusSushi.png");
          BonusSushi nuevoSushi= new BonusSushi(transformBonusSushi, imageBonusSushi, new PVector(11,4));
          objetos.add(nuevoSushi);
        }
          
         else if(o.transform.getPosicion().x>width){
          objetos.remove(i);
          Transform transformBaldeAgua = new Transform(new PVector(-45, height-45));
          ImageComponent imageBaldeAgua= new ImageComponent("BaldeAgua.png");
          BaldeAgua nuevoBaldeAgua= new BaldeAgua(transformBaldeAgua, imageBaldeAgua, new PVector(10,0));
          objetos.add(nuevoBaldeAgua);
        }*/
  
  //Metodos accesores
   public void setPosicion(PVector posicion){
    this.posicion=posicion; 
  }
  
  public PVector getPosicion(){
    return this.posicion;
  }
}
