class ImageComponent {
  //Atributos
  private PImage imagen;

  // Constructor
  public ImageComponent(String ruta) {
    // Carga la imagen desde la ruta especificada
    imagen = requestImage(ruta);
  }

  // Método para mostrar la imagen en una posición específica
  public void displayImage(PVector posicion) {
    // Dibuja la imagen en la posición especificada
    image(imagen, posicion.x, posicion.y);
  }

  // Método sobrecargado para mostrar la imagen en una posición y con dimensiones específicas
  public void displayImage(PVector posicion, int ancho, int alto) {
    // Dibuja la imagen en la posición especificada
    // y la redimensiona a 'ancho' x 'alto'
    image(imagen, posicion.x, posicion.y, ancho, alto);
  }
}
  
  /*
  public void displayImage(PVector posicion, int ancho, int alto, int anchoS, int altoS) {
    // Dibuja la imagen en la posición especificada
    // y la redimensiona a 'ancho' x 'alto'
    image(imagen.get(0,0,anchoS,altoS), posicion.x, posicion.y, ancho, alto);
  }*/
