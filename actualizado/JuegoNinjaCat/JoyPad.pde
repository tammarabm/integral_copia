class JoyPad{
  //Atributos
  
  //Tenemos que lograr que en algún momento sea verdadero y en otro falso para detectar en que momento estamos presionandolas
  private boolean rightPressed;
  private boolean leftPressed; 
  
  //Métodos Accesores
  public boolean isRightPressed(){  //Cuando lo que se retorna es un atributo tipo booleano en lugar de poner get ponemos is.
    return this.rightPressed;
  }
  public void setRightPressed(boolean rightPressed){
    this.rightPressed= rightPressed; 
  }
  public boolean isLeftPressed(){  //Cuando lo que se retorna es un atributo tipo booleano en lugar de poner get ponemos is.
    return this.leftPressed;
  }
  public void setLeftPressed(boolean leftPressed){
    this.leftPressed= leftPressed; 
  }


}
