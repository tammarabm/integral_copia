class Shuriken extends Objeto{
  //Constructores
  public Shuriken(){
  }
  public Shuriken(Transform transform, ImageComponent imageComponent){
    super(transform, imageComponent);
  }
  public Shuriken(Transform transform, ImageComponent imageComponent, PVector velocidad){
    super(transform, imageComponent, velocidad);
  }
  
  //Metodos
  public void display(){
    this.imageComponent.displayImage(transform.getPosicion(), 50,50);
  }
  public void mover(){
    this.transform.getPosicion().y+=(this.velocidad.y * Time.getDeltaTime(frameRate));
    
  }
}
