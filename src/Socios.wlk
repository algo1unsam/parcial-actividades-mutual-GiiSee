import Viajes.*

object sobrepasoElLimiteDeActividades inherits Socio{}

class Socio {

	var property edad = 20
	var property idiomas = []
	var property actividades = []
	var property maxActividades = 5
	

	method adoradorDelSol() = actividades.all{ actividad => actividad.sirveParaBroncearse() }

	method actvidadesEsforzadas() = actividades.any{ actividad => actividad.implicaEsfuerzo() }

	method registrarActividad(unaActividad) {
		if (self.maxActividades() > 5) {
			throw sobrepasoElLimiteDeActividades
		} else {
			return actividades.add(unaActividad)
		}
	}
	
	method leAtraeActividad(tipoDeSocio) = tipoDeSocio.socio()
		
	
  }
  
class Tranquilo inherits Socio{
	
    method condicion()= actividades.dia() >= 4 
	
}

class Coherente inherits Socio{
	
	method condicion() {
		if (self.adoradorDelSol()){
			return actividades.sirveParaBroncearse()
		}else{
			return actividades.implicaEsfuerzo()
		}
	}
}

class Relajado inherits Socio{
	
	method condicion(){
		return actividades.idioma()
	}
}

