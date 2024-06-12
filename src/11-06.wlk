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
class SalidaTrekking inherits Viaje {
	var property cantKmsSenderos
	const property diasDeSolAlAnio
	override method diasDeActividad() = 
	override method implicaEsEsfuerzo() = 
	override method sirveParaBroncearse() = 
}
