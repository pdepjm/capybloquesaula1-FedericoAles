import wollok.game.*

object posicionAleatoria {
  method calcular() = game.at(
    0.randomUpTo(game.width()).truncate(0),
    0.randomUpTo(game.height()).truncate(0)
  )
  /*
  0.randomUpTo(n) devuelve un numero random entre 0 y n - 1
  .truncate(0) quita los decimales
  game.at(x, y), basicamente este metodo es un return coordenadas, las cuales son expresadas con game.at()
  */
}