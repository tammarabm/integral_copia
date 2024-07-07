class BonusSushi extends Objeto{
 
  
  //Constructores 
  public BonusSushi(){
  }
  public BonusSushi(Transform transform, ImageComponent imageComponent){
    super(transform, imageComponent);
  }
  public BonusSushi(Transform transform, ImageComponent imageComponent, PVector velocidad){
    super(transform, imageComponent, velocidad);
  }
  //Metodos
  
  public void display(){
    //println("Se dibuja");
    this.imageComponent.displayImage(transform.getPosicion(), 50, 50);
    
  }
  
  public void mover(){
  
  }

}
