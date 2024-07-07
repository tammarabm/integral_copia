class Transform {
  //Atributos
  private PVector posicion;

  // Constructor que inicializa la posición
  public Transform(PVector posicion) {
    this.posicion = posicion;
  }
  
  //--Métodos Accesores--//
  
  // Getter 
  public PVector getPosicion() {
    return this.posicion;
  }

  // Setter 
  public void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }
}
