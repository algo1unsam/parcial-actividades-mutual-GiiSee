class Viaje {

	var property tipoDeViaje 
	var property idiomas = []  
	var property implicaEsfuerzo
	var property sirveParaBroncearse
	var property dias

	method idiomas(idioma) = idiomas.add(idioma)

	method cantDeIdiomas() = idiomas.size() > 1

	method implicaEsfuerzo() = self.tipoDeViaje().implicaEsfuerzo()

	method sirveParaBroncearse() = self.tipoDeViaje().sirveParaBroncearse()

	method cantDiasDeActividad() = self.tipoDeViaje().dias()

}

class Playa inherits Viaje {

	var property largo 

	method largo() = largo

	override method dias() = self.largo() / 500

	override method implicaEsfuerzo() = self.largo() > 1200

	override method sirveParaBroncearse() = true

}

class ExcursionCiudad inherits Viaje {

	var property cantDeAtracciones

	override method dias() = self.cantDeAtracciones() / 2

	override method implicaEsfuerzo() = self.cantDeAtracciones() == 5

	override method sirveParaBroncearse() = false

	method interesante() = self.cantDeIdiomas() || cantDeAtracciones == 5

}

class ExcursionCiudadTropical inherits ExcursionCiudad {

	method cantDeDias() = self.cantDeAtracciones() / 2 + 1

	override method sirveParaBroncearse() = true

}

class SalidaTrekking inherits Viaje {

	var property kilometros
	var property diasDeSol

	override method dias() = self.kilometros() / 50

	override method implicaEsfuerzo() = self.kilometros() > 80

	override method sirveParaBroncearse() = self.diasDeSol() >= 100 || self.kilometros() > 120

	method interesante() = self.cantDeIdiomas() and diasDeSol > 140

}

class Idioma {

	var property idiomas

	method idioma() = idiomas

}

