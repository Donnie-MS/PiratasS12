
import objetos.*
import barcos.*
import piratas.*
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
  method esUtil(unPirata) = unPirata.tieneAlgun(elementosRequeridos) and unPirata.monedas() <= 5
  method puedeHacerMision(unPirata) {
    var resultado = false
    if (self.esUtil(unPirata)) {
      resultado = true
    }
    return resultado
  }
  override method puedeSerCompletada(unBarco) {
    return super(unBarco) and unBarco.algunoTieneLlave()
  }
}

class ConvertirseEnLeyenda inherits Mision {
  const property elementoRequerido 
  method esUtil(unPirata) = unPirata.cantDeItems() >= 10 and unPirata.tiene(elementoRequerido)
  method puedeHacerMision(unPirata) {
    var resultado = false
    if(self.esUtil(unPirata)) {
      resultado = true
    }
    return resultado
  }
}

class Saqueo inherits Mision {
  const property objetivo
  var property capMonedas
  method esUtil(unPirata) = unPirata.monedas() < capMonedas and unPirata.puedeSaquear(objetivo)
  method puedeHacerMision(unPirata) {
    var resultado = false
    if (self.esUtil(unPirata)) {
      resultado = true
    }
    return resultado
  }
  override method puedeSerCompletada(unBarco) {

  }
}
