import Actividades.*

class Socio {
  const actividades = []
  var property maximoActividades

  method esAdoradorDelSol() = actividades.all( {a=>a.sirveParaBroncearse()} )
  method actividadesEsForzadas() = actividades.filter( {a=>a.implicaEsfuerzo()} )
  method realizarActividad(unaActividad) {
    if(actividades.size() == maximoActividades) {
      self.error("Llego al maximo de Actividades")
    }
  }
}
