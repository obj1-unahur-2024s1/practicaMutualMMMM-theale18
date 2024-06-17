import Actividades.*

class Socio {
    const actividades = []
    var property maximoActividades		/**	
	method maximoActividades(){	
		return maximoActividades 
	}
	method maximoActividades(unValor){	
		maximoActividades = unValor	
	}									**/

var edad
    const idiomas =  #{}

    method esAdoradorDelSol() = actividades.all( {a=>a.sirveParaBroncearse()} )
    method actividadesEsForzadas() = actividades.filter( {a=>a.implicaEsfuerzo()} )
    method realizarActividad(unaActividad) {
        if(actividades.size() == maximoActividades) {
            self.error("Llego al maximo de Actividades")
        }
            actividades.add(unaActividad)
    }
    method leAtrae(unaActividad)
	method realizoActividad(unaActividad) = actividades.contains(unaActividad)
}

class SocioTranquilo inherits Socio {
    override method leAtrae(unaActividad) = unaActividad.diasDeActividad() >= 4
}

class SocioCoherente inherits Socio {
    override method leAtrae(unaActividad) {
        if(self.esAdoradorDelSol()) unaActividad.sirveParaBroncearse() else unaActividad.implicasEsfuerzo()
    }
}

class SocioRelajado inherits Socio {
    override method leAtrae(unaActividad) = not idiomas.intersection(unaActividad.idiomas()).isEmpty()
}
