class PerroMadera extends Objeto{
  
  public PerroMadera(){
  }
  public PerroMadera(Transform transform, ImageComponent imageComponent){
    super(transform, imageComponent);
  }
  public PerroMadera(Transform transform, ImageComponent imageComponent, PVector velocidad){
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
