class Colisionador {
  private PVector posicion; // Posición del centro del colisionador
  private float radio; // Radio del colisionador

  // Constructor para inicializar posición y radio
  public Colisionador(PVector posicion, float radio) {
    this.posicion = posicion;
    this.radio = radio;
  }

  // Método para obtener la posición del colisionador
  public PVector getPosicion() {
    return this.posicion;
  }

  // Método para obtener el radio del colisionador
  public float getRadio() {
    return this.radio;
  }

  // Método para establecer la posición del colisionador
  public void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }

  // Método para verificar si hay una colisión con otro colisionador
  public boolean verificarColision(Colisionador otro){
    boolean isCollide=false;
    float distancia= this.posicion.dist(otro.getPosicion());
    if (distancia <(this.radio + otro.getRadio())){
      isCollide = true;
    }
    //println(isCollide);
    return isCollide;
  }
}
