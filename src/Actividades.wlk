import Socios.*

class Viaje {
//	Conjunto Vacio => #{}
	const property idiomas = #{}

	method implicaEsEsfuerzo()
	method sirveParaBroncearse()
	method diasDeActividad()
	method esInteresante() = idiomas.size > 1
// Se cumple el Mensaje esInteresante si la cantidad de Idiomas es Mayor a 1
	method esRecomdadaPara(unSocio) {
		return self.esInteresante()  and unSocio.leAtrae(self) and not unSocio.realizoActividad(self)
	}
}
class ViajeDePlaya inherits Viaje {
// inherits es para Heredar los method de la Clase Viaje
// sirve como una reutilizacion de sus nombres
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
		diasDeSolAlAnio >= 200 or (diasDeSolAlAnio.between(100,200) and cantKmsSenderos > 120)
	override method esInteresante() = super() and diasDeSolAlAnio > 140
}
class ClaseDeGimanasia inherits Actividad {
// initialize se usa para Validacion
// en este caso valida si dentro del Conjunto "idiomas" tiene "español", sino lo tiene da ERRROR
	method initialize() {
		if(idiomas!=#{"español"}) {
			self.error("solo se permite clase de gimnasia en español")
		}
	}
	override method diasDeActividad() = 1
	override method implicaEsEsfuerzo() = true
	override method sirveParaBroncearse() = false 
}

//						BONUS FINAL
class TallerLiterario{
    const librosEnQueTrabaja = #{}
	
	method idiomas() = librosEnQueTrabaja.map({l => l.idioma()}).asSet()
    method diasDeActividad() = librosEnQueTrabaja.size() + 1
    method tieneLibroConMasDe500Pag() = librosEnQueTrabaja.any({l => l.cantPaginas() > 500})
    method autoresDeLibros() = librosEnQueTrabaja.map({l => l.nombreDelAutor()}).asSet()
    method todosLosLibrosSonDelMismoAutor() = self.autoresDeLibros().size() == 1
    method hayMasDeUnLibro() = librosEnQueTrabaja.size() > 1
    method implicaEsfuerzo() = self.tieneLibroConMasDe500Pag() or (self.todosLosLibrosSonDelMismoAutor() and self.hayMasDeUnLibro())
    method sirveParaBroncearse() = false
    method esRecomdadaPara(unSocio) = unSocio.idiomas().size() > 1
}

class Libro{
    const property idioma
    const property cantPaginas
    const property nombreDelAutor
}
