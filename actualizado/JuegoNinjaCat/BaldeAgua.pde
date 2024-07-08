class BaldeAgua extends Objeto{
 
  //Constructores 
  public BaldeAgua(){
  }
  public BaldeAgua(Transform transform, ImageComponent imageComponent){
    super(transform, imageComponent);
  }
  public BaldeAgua(Transform transform, ImageComponent imageComponent, PVector velocidad){
    super(transform, imageComponent, velocidad);
  }
  //Metodos
  
  public void display(){   
    this.imageComponent.displayImage(transform.getPosicion(), 50,50);
  }

  public void mover(){  
    this.transform.getPosicion().x+=(this.velocidad.x*Time.getDeltaTime(frameRate));
  }
}
