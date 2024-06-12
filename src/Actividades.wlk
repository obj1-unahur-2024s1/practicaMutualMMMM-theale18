import Socios.*

class Viaje {
	const property idiomas = #{}

	method implicaEsEsfuerzo()
	method sirveParaBroncearse()
	method diasDeActividad()
	method esInteresante() = idiomas.size > 1
}
class ViajeDePlaya inherits Viaje {
	const property largoPlaya
	override method diasDeActividad() = largoPlaya / 500
	override method implicaEsEsfuerzo() = largoPlaya > 1200
	override method sirveParaBroncearse() = true	
}

class ExcursionACiudad inherits Viaje {
	var property cantAtracciones
	override method diasDeActividad() = cantAtracciones/ 2
	override method implicaEsEsfuerzo = cantAtraaciones.between(5,8)
	override method sirveParaBroncearse() = false
	override method esInteresante() = super() or cantAtracciones == 5
}

class ExcursionTropical inherits ExcursionACiudad {
	override method diasDeActividad() = super() + 1
	override method sirveParaBroncearse() = true
}
class SalidaTrekking inherits Actividad {
	var property cantKmsSenderos
	const property diasDeSolAlAnio
	override method diasDeActividad() = cantKmsSenderos / 50
	override method implicaEsEsfuerzo() = cantKmsSenderos > 80
	override method sirveParaBroncearse() = 
		diasDeSolAlAnio > 200 or (diasDeSolAlAnio.between(100,200) and cantKmsSenderos > 120)
	override method esInteresante() = super() and diasDeSolAlAnio > 140
}
class ClaseDeGimanasia inherits Actividad {
	method initialize() {
		if(idiomas!=#{"español"}) {
			self.error("solo se permite clase de gimnasia en español")
		}
	}
	override method diasDeActividad() = 1
	override method implicaEsEsfuerzo() = true
	override method sirveParaBroncearse() = false

	 
}
