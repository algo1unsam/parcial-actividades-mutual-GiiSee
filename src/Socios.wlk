import Viajes.*

object sobrepasoElLimiteDeActividades inherits Socio{} // inherits Exception

//no guarde las ultimas modificaciones  que hice antes de comitear , no se me guardaron 
//llege a mi casa y me di cuenta y lo comiteee
object mutual { //No es necesario
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
			return actividadesRealizadas.add(unaActividad) //No hay nada para retornar
		}
	}
	
	method leAtraeActividad(tipoDeSocio) = tipoDeSocio.socio() // No existe el metodo socio
		
	
  }
  
object tranquilo {
	
    method condicion()= mutual.actividades().dia() >= 4 // actividades es una lista, no entiende el mensaje dia()
	
}

object coherente {
	
	method condicion() {
		if (self.adoradorDelSol()){ // el mensaje no existe en el objeto coherente
			return mutual.actividades().sirveParaBroncearse() // mal usada la lista
		}else{
			return mutual.actividades().implicaEsfuerzo() // idem
		}
	}
}

object celajado {
	
	method condicion(){
		return mutual.actividades().idioma() // ademas de mal usada la lista, idioma no es booleano
	}
}

