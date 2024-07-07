/*Esta clase tiene por objetivo mantener un conjunto de estados 
con valores constantes.
(1:inicio del juego, muestra la pantalla de inicio; 2: muestra el escenario, donde vamos a jugar; 3: indica que hemos ganado; 4: indica que hemos perdido) 
*/
class MaquinaDeEstados{
  //public: Los atributos son públicos para que cualquier clase pueda usarlos 
  //static: Los atributos son estaticos porque de esta manera puedo acceder/llamar a estos sin crear una instancia de la clase, es decir solo usaremos el nombre de la clase 
  //final: el valor de los atributos no puede ser modificado, el atributo será una constante
  
  //Muestra la pantalla de inicio del juego
  public static final int INICIANDO=1;
  
  //Muestra el escenario del juego
  public static final int JUGANDO=2;
  
  //Muestra un mensaje que hemos ganado
  public static final int GANANDO_PARTIDA=3;
  
  //Muestra un mensaje que hemos perdido  
  public static final int PERDIENDO_PARTIDA=4;

}
