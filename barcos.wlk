import objetos.*
import piratas.*
import misiones.*
/*
6) Se sabe que algunos tripulantes son espías de la corona. 
Estos piratas se comportan igual que los piratas comunes a excepción de que nunca están pasados de grogXD
 y que para animarse a saquear una víctima se tienen que dar las condiciones explicadas anteriormente y además tener el ítem permiso de la corona.
7)
b) Saber cuántos tipos distintos de items se juntan entre los tripulantes de un barco que están pasados de grogXD (es decir, los ítems sin repetidos)
8)   Cada tripulante conoce qué tripulante del barco lo invito.
 Se quiere conocer quién es el tripulante de un barco pirata que invito (satisfactoriamente) a más gente.
*/
class BarcoPirata {
  const property capacidad
  const tripulacion = #{}
  var mision
  method mision(nuevaMision) {
    tripulacion.forEach({tripulante => 
      if (not nuevaMision.puedeHacerMision(tripulante)) {
        tripulacion.remove(tripulante)
      }
    })
    mision = nuevaMision
  }
  method aceptarPirata(unPirata) {
    if (mision.puedeHacerMision(unPirata)) {
      tripulacion.add(unPirata)
    }
  }
  method algunoTieneLlave() = tripulacion.any({tripulante => tripulante.tieneLLave()})
  method tripulantePasadoDeGrogXDConMasDinero() = self.tripulantePasadosDeGrogXD().max({tripulante => tripulante.monedas()})
  method tripulantePasadosDeGrogXD() = tripulacion.filter({tripulante => tripulante.estaPasadoDeGrogXD()})
  method tripulanteConMasDinero() = tripulacion.max({tripulante => tripulante.monedas()})
  method tieneAlgunTripulantePasadoDeGrogXD() = tripulacion.any({tripulante => tripulante.estaPasadoDeGrogXD()})
  method nroDeTripulantes() = tripulacion.size()
  method nroDeTripulantesPasadosDeGrogXD() = self.tripulantePasadosDeGrogXD().size()
  method tieneSuficienteTripulacion() = self.nroDeTripulantes() > capacidad * 0.9
  method tieneTripulanteConLlave() = tripulacion.any({tripulante => tripulante.tieneLlave()})
  method puedeSaquear(unBarco) = unBarco.tieneAlgunTripulantePasadoDeGrogXD() or self.tieneMasTripulantesQueLaMitadDe(unBarco)// tira error si pongo ciudad?
  method tieneMasTripulantesQueLaMitadDe(unBarco) = capacidad > unBarco.nroDeTripulantes() / 2// que de entero y no decimal
  method todosEstanPasadosDeGrogXD() = tripulacion.all({tripulante => tripulante.estaPasadoDeGrogXD()})
  method elMasEbrio() = tripulacion.max({tripulante => tripulante.nivelDeEbriedad()})
  method perderAlMasEbrio(unaCiudad) {
    tripulacion.remove(self.elMasEbrio())
    unaCiudad.habitantes(unaCiudad.habitantes() + 1)
  }
  method anclarEn(unaCiudad) {
    self.hacerQueTodosTomenGrogXD()
    self.perderAlMasEbrio(unaCiudad)
  }
  method hacerQueTodosTomenGrogXD() {
    tripulacion.forEach({tripulante => 
    tripulante.tomarTragoDeGrogXD()
    tripulante.gastar(1)
    })
  }
  method esTemible() = mision.puedeSerCompletada(self)
}


