abstract class Objeto implements IVisualizable{
  protected ImageComponent imageComponent;
  protected Transform transform;
  protected PVector velocidad;
  protected Colisionador colisionador;
  
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
    this.colisionador = new Colisionador(transform.getPosicion(), 25); 
  }
  //Métodos
  public abstract void mover();
  
  //por la interfaz
  public void display(){
  }
  
  public Colisionador getColisionador() {
    return colisionador;
  }
}
