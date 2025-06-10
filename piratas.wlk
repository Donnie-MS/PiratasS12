import objetos.*
import barcos.*
class Pirata {
  const items = []
  var property nivelDeEbriedad = 0
  var property monedas = 10
  method tieneAlgun(listaDeElementos) = items.difference(listaDeElementos).size() > 0
  method tieneLLave() = items.contains(llave)
  method cantDeItems() = items.size()
  method tiene(unItem) = items.contains(unItem)
  method estaPasadoDeGrogXD() = nivelDeEbriedad >= 90
  method seAnimaASaquear(unaCiudad) = nivelDeEbriedad >= 50
  method tomarTragoDeGrogXD() {self.nivelDeEbriedad(nivelDeEbriedad + 5)}
  method gastar(unMonto) {//HACER EXCEPCION DE SI TIENE MENOS DE UN MONTO
    self.monedas(monedas - unMonto)
  }
}
