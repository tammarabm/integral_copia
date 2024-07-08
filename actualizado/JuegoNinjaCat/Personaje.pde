class Personaje implements IVisualizable{
  //Atributos
  private Transform transform;
  private ImageComponent imageComponent;
  private Colisionador colisionador;
  private int experiencia; 
  private int vida; 
  private PVector velocidad;
  private boolean isJumping;  //Indica si el personaje está saltando o no
  private float velocidadVertical; //Determina su movimiento hacia arriba o hacia abajo
  private float gravedad;  //Es la aceleración hacia abajo debida a la gravedad, que afecta la caída del personaje. Modificar este valor afectará la velocidad con la que el personaje cae:
  private float impulso;   //El impulso que se aplica al saltar para que el personje suba
  
  //Constructores
  public Personaje(){ 
  }
  //Constructores Parametrizados
  
  public Personaje(Transform transform, ImageComponent imageComponent){
    this.transform=transform;
    this.imageComponent=imageComponent;
  }
  public Personaje(Transform transform, ImageComponent imageComponent, PVector velocidad){
    this.transform=transform;
    this.imageComponent=imageComponent;
    this.velocidad=velocidad;
  }
   public Personaje(Transform transform, ImageComponent imageComponent, PVector velocidad, int experiencia, int vida){
    this.transform=transform;
    this.imageComponent=imageComponent;
    this.velocidad=velocidad;
    this.experiencia=experiencia;
    this.vida=vida;
    this.colisionador= new Colisionador(this.transform.getPosicion(), 50);
    isJumping=false;
    velocidadVertical=0; 
    gravedad=1.0;
    impulso=-20;
  }
  
  //Métodos
  
  public void display(){
    this.imageComponent.displayImage(transform.getPosicion(),100,100);
  }
  
  //Mueve la posicion, hacia la izquierda o derecha, segun lo que se indique en el atributo velocidad
  //direccion (0:izquierda;1:derecha)
  public void mover(int direccion){
    switch(direccion){
      case 0:{
        this.transform.getPosicion().x-=(this.velocidad.x*Time.getDeltaTime(frameRate));
        if(this.transform.getPosicion().x<-100){
          this.transform.getPosicion().x=width;
        }
        this.colisionador.setPosicion(this.transform.getPosicion());
        break;
        
      }
      case 1: {
        this.transform.getPosicion().x+=(this.velocidad.x *Time.getDeltaTime(frameRate));
        if (this.transform.getPosicion().x>width){
          this.transform.getPosicion().x=-100;
        }
        this.colisionador.setPosicion(this.transform.getPosicion());
        break;
      }
    }
  }
  
  public void saltar(){
    if (!isJumping) {
      isJumping= true;
      velocidadVertical = impulso;
    }
  }
  
  //Simula la gravedad cuando está en el aire.
  public void aplicarGravedad(){

    //Aplicar gravedad
    if (isJumping) { //Si está saltando
      velocidadVertical += gravedad;  // Incrementa la velocidad vertical con la gravedad
      this.transform.getPosicion().y += velocidadVertical;  //Actualiza la posicion y del personaje segun la velocidad vertical

  //Verifica si el personaje tocó el piso
      if (this.transform.getPosicion().y >= height - 90) {
        this.transform.getPosicion().y = height - 90;  //La posicion y del personaje será el piso, donde esyaba inicialmente
        velocidadVertical = 0;  //La velocidad vertical será cero, se detiene
        isJumping = false;   //El personje ya no está saltando, está en el piso
      }
    }
    this.colisionador.setPosicion(this.transform.getPosicion());
  }
  
  public void deslizar(){
  }
  public void reducirVida(int cantidad) {
    this.vida -= cantidad;
    if (this.vida < 0) {
      this.vida = 0;
    }
  }
  public void aumentarExperiencia(int cantidad){
    this.experiencia+=cantidad;
    if (this.experiencia>200){
      println("Partida Completada/Ganada");
    }
  }
   
  //Métodos Accesores
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;   
  }
  public PVector getVelocidad(){
    return this.velocidad;
  }
  public void setExperiencia(int experiencia){
    this.experiencia=experiencia;
  }
  public int getExperiencia(){
    return this.experiencia;
  }
  public void setVida(int vida){
    this.vida=vida;
  }
  public int getVida(){
    return this.vida;
  }
  public Colisionador getColisionador(){
    return colisionador;
  }
}
