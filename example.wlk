import objetos.*
import piratas.*


class BarcoPirata {
  const property capacidad
  const tripulacion = #{}
  var property mision
  method aceptarPirata(unPirata) {
    if (mision.puedeHacerMision(unPirata)) {
      tripulacion.add(unPirata)
    }
  }
  method tieneAlgunTripulantePasadoDeGrogXD() = tripulacion.any({tripulante => tripulante.estaPasadoDeGrogXD()})
  method nroDeTripulantes() = tripulacion.size()
  method tieneSuficienteTripulacion() = self.nroDeTripulantes() > capacidad * 0.9
  method tieneTripulanteConLlave() = tripulacion.any({tripulante => tripulante.tieneLlave()})
  method puedeSaquear(unBarco) = unBarco.tieneAlgunTripulantePasadoDeGrogXD() or self.tieneMasTripulantesQueLaMitadDe(unBarco)// tira error si pongo ciudad?
  method tieneMasTripulantesQueLaMitadDe(unBarco) = capacidad > unBarco.nroDeTripulantes() / 2// que de entero y no decimal
  method todosEstanPasadosDeGrogXD() = tripulacion.all({tripulante => tripulante.estaPasadoDeGrogXD()})
}
class Ciudad {
  const property esCostera
  var property habitantes
  method esVulnerabePor(unBarco) = esCostera and (unBarco.nroDeTripulantes() >= habitantes * 0.40 or unBarco.todosEstanPasadosDeGrogXD())
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
  override method puedeSerCompletada(unBarco) {

  }
}


class Pirata {
  const items = []// un mapa, una brújula, un loro, un cuchillo, una botella de grogXD, etc. 
  var property nivelDeEbriedad = 0
  var property monedas = 10
  method tieneAlgun(listaDeElementos) = items.difference(listaDeElementos).size() > 0
  method tieneLLave() = items.contains(llave)
  method cantDeItems() = items.size()
  method tiene(unItem) = items.contains(unItem)
  method estaPasadoDeGrogXD() = nivelDeEbriedad >= 90
  method seAnimaASaquear(unaCiudad) = nivelDeEbriedad >= 50
}
