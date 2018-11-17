import Viajes.*

object sobrepasoElLimiteDeActividades inherits Socio{}

//no guarde las ultimas modificaciones  que hice antes de comitear , no se me guardaron 
//llege a mi casa y me di cuenta y lo comiteee
object mutual {
	var actividades = []
	method agregarActividad(actividad){actividades.add(actividad)} 
	method actividades() = actividades
}


class Socio {

	var property edad = 20
	var property idiomas = []
	var property actividadesRealizadas = []
	var property maxActividades = 5
	

	method adoradorDelSol() = actividadesRealizadas.all{ actividad => actividad.sirveParaBroncearse() }

	method actvidadesEsforzadas() = actividadesRealizadas.filter{ actividad => actividad.implicaEsfuerzo() }

	method registrarActividad(unaActividad) {
		if (self.maxActividades() > 5) {
			throw sobrepasoElLimiteDeActividades
		} else {
			return actividadesRealizadas.add(unaActividad)
		}
	}
	
	method leAtraeActividad(tipoDeSocio) = tipoDeSocio.socio()
		
	
  }
  
object tranquilo inherits Socio{
	
    method condicion()= mutual.actividades().dia() >= 4 
	
}

object coherente inherits Socio{
	
	method condicion() {
		if (self.adoradorDelSol()){
			return mutual.actividades().sirveParaBroncearse()
		}else{
			return mutual.actividades().implicaEsfuerzo()
		}
	}
}

object celajado inherits Socio{
	
	method condicion(){
		return mutual.actividades().idioma()
	}
}

