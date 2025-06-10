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
