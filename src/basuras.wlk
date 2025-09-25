import wollok.game.*
import utilidades.*
import combustibles.*

object lataDeCerveza {
  var property position = posicionAleatoria.calcular()
  var property longitudCm = 10 //property te ahorra tener que escribir los getter y setters, es decir, en la linea 10 se pueda utilizar
  //esta variable sin problemas, cuando normalmente tendrias que hacer un metodo de consulta y utilizar eso
  
  method impactoEnLaHuellaDeCarbono() = 5 * longitudCm
  method nombre() = "lata_roja"
  method image() = self.nombre() + ".png"

  method esReciclable() = true
  
  method tratar() {
    longitudCm *= 0.9
  }
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self) //es el metodo que se usa dentro del onCollideDo, donde el elemento es la basura, y se envia a si misma para que
                                //capy la recolecte y la elimine de pantalla

  }
}

object botellaDeGaseosa {
  var impactoEnHuellaDeCarbono = 100
  var property position = posicionAleatoria.calcular()
  
  method impactoEnLaHuellaDeCarbono() = impactoEnHuellaDeCarbono

  method nombre() = "lata_naranja"

  method image() = self.nombre() + ".png"  

  method esReciclable() = true
  
  method tratar() { //estos metodos tratar de las basuras aparentan estar de mas
    impactoEnHuellaDeCarbono -= 5
  }
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)
  }
}

object barrilDeCombustible {
  var property position = posicionAleatoria.calcular()
  var combustibleActual = biogas
  var combustibleAnterior = gasoil
  
  method impactoEnLaHuellaDeCarbono() = combustibleActual.consumo()
  
  method esReciclable() = false
  method nombre() =  "barril"
  method image() = self.nombre() + "_" + combustibleActual.sufijo()+ "_" + ".png"

  method cambiarCombustible() {
    const aux = combustibleActual
    combustibleActual = combustibleAnterior
    combustibleAnterior = aux
  }
  
  method combustibleActual() = combustibleActual
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)
    game.removeTickEvent("cambiarCombustible") //elimina el evento de los ticks creados
  }
}

object pokemon {
  var property position = game.at(8, 0)
  method impactoEnLaHuellaDeCarbono() = 500
  var property direccion = "left"

  method nombre() = "pokemon"

  method image() = self.nombre() + ".png"  
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)
  }

  method moverA(nuevaPosicion) {
    position = nuevaPosicion
  }

  method actualizarPosicion() {
    if (position.x() <= 0) {
      direccion = "right"
    }
    else if (position.x() >= game.width() - 1) {
      direccion = "left"
    }

    if (direccion == "left") {
      self.moverA(self.position().left(1))
      }
    else {
      self.moverA(self.position().right(1))
      }
  }
}