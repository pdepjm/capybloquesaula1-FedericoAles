import wollok.game.*

object capy {
  var property position = game.origin()
  var impactoEnLaHuellaDeCarbonoTotal = 0 
  
  method recolectarBasura(basura){
    game.removeVisual(basura) //elimina un objeto de la pantalla
    game.say(self, "Recolecté: barril de " + basura.nombre())
    impactoEnLaHuellaDeCarbonoTotal += basura.impactoEnLaHuellaDeCarbono()
  }
  
  method tratar(){
    impactoEnLaHuellaDeCarbonoTotal = (impactoEnLaHuellaDeCarbonoTotal - 20).max(0) 
    //el max(0) se asegura que sea un resultado positivo basicamente, dice que el numero maximo tiene que ser 0, y si es menor lo trunca a 0
  }
  
  method impactoEnLaHuellaDeCarbono() = impactoEnLaHuellaDeCarbonoTotal //metodo de consulta
  
  method image() = "capy_tranqui.png"
}