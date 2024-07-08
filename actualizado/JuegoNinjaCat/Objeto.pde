abstract class Objeto implements IVisualizable{
  protected ImageComponent imageComponent;
  protected Transform transform;
  protected PVector velocidad;
  
  //Constructores 
  public Objeto(){
  }
  public Objeto(Transform transform, ImageComponent imageComponent){
    this.transform=transform;
    this.imageComponent=imageComponent;
  }
  public Objeto(Transform transform, ImageComponent imageComponent, PVector velocidad){
    this.transform=transform;
    this.imageComponent=imageComponent;
    this.velocidad=velocidad;
  }
  //Métodos
  public abstract void mover();
  
  //por la interfaz
  public void display(){
  }
}
