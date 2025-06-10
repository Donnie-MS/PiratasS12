import objetos.*
import piratas.*

/*
 y por eso sólo aceptará en su tripulación a los piratas que le sirvan para esa misión. 
 Un barco puede cambiar de misión en cualquier momento.
Nos va a interesar saber si un pirata es útil para una misión, y además si una misión puede ser realizada por un barco.
*/

class BarcoPirata {
  const property capacidad
  const tripulacion = #{}
  var property mision
  method aceptarPirata(unPirata) {
    if (mision.puedeHacerMision(unPirata)) {
      tripulacion.add(unPirata)
    }
  }
  method nroDeTripulantes() = tripulacion.size()
  method tieneSuficienteTripulacion() = self.nroDeTripulantes() > capacidad * 0.9
  method tieneTripulanteConLlave() = tripulacion.any({tripulante => tripulante.tieneLlave()})
}
class Mision {
  method puedeSerCompletada(unBarco) {
    var resultado = false
    if (unBarco.tieneSuficienteTripulacion()) {
      resultado = true
    }
    return resultado
  }
}
class BusquedaDelTesoro inherits Mision {
  const elementosRequeridos = [brujula, mapa, botellaDeGrogXD]
  method puedeHacerMision(unPirata) {
    var resultado = false
    if (unPirata.tieneAlgun(elementosRequeridos) and unPirata.monedas() <= 5) {
      resultado = true
    }
    return resultado
  }
  override method puedeSerCompletada(unBarco) {
    super()//arreglar
  }
}

class ConvertirseEnLeyenda inherits Mision {
  const property elementoRequerido 
  method puedeHacerMision(unPirata) {
    var resultado = false
    if(unPirata.cantDeItems() >= 10 and unPirata.tiene(elementoRequerido)) {
      resultado = true
    }
    return resultado
  }
}

class Saqueo inherits Mision {
  const property objetivo
  var property capMonedas
  method puedeHacerMision(unPirata) {
    var resultado = false
    if (unPirata.monedas() < capMonedas and unPirata.puedeSaquear(objetivo)) {
      resultado = true
    }
    return resultado
  }
}
/*


Saqueo: los saqueos tienen un objetivo o víctima, que puede ser un barco o una ciudad costera.
·         Para estas misiones son útiles los piratas que cuenten con menos dinero que una cantidad de monedas determinada 
(para todas las misiones de saqueo es la misma cantidad, pero se debe poder cambiar)
  y además se animen a saquear a la víctima de la misión de la que se trate (ver mas abajo).
·         Para que un saqueo pueda ser realizado por un barco, la víctima debe ser vulnerable al barco (ver más abajo).


*/
class Pirata {
  const items = []// un mapa, una brújula, un loro, un cuchillo, una botella de grogXD, etc. 
  var property nivelDeEbriedad = 0
  var property monedas
  method tieneAlgun(listaDeElementos) = items.difference(listaDeElementos).size() > 0
  method tieneLLave() = items.contains(llave)
  method cantDeItems() = items.size()
  method tiene(unItem) = items.contains(unItem)
}
