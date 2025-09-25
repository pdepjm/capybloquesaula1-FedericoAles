object petroleo {
  method consumo() = 1200
  
  method sufijo() = "petroleo"
}

object biogas {
  /* el biogas es el resultado de la degradación
  de materia degradable, así que en si es una forma de reciclar */
  method consumo() = 0
  
  method sufijo() = "biogas"
}

object gasoil {
  var pureza = 0.4
  
  method pureza(porentaje) {
    pureza = porentaje
  } //metodo de cambio de estado
  
  method consumo() = 500 * pureza
  
  method sufijo() = "gasoil"
}

//sufijo() simplemente es un metodo de consulta para saber el nombre del combustible