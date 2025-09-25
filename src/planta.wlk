import wollok.game.*

object plantaDeTratamiento {
  var property position = game.at(8, 8) //establecer coordenadas x e y
  
  method image() = "planta.png"
  
  method colisionarCon(capy) {
      capy.tratar()
      game.schedule(2000, { 
        game.say(capy, "Aprieta H para saber el impacto en la huella de carbono de la basura que recolectaste")
      })
      //schedule(n, "cosa a hacer") hace que el juego espere n milisegundos antes de hacer alguna accion, en este caso son 2 segs
      //game.say hace que el objeto indicado diga algo en un globo de texto en pantalla, un dialogo
  }
}