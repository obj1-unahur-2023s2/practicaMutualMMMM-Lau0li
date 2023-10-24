import viajes.*
class Socio {
	var idiomasQueHabla = []
	var actividadesRealizadas = []
	const maximoDeActividades
	var edad
	
	method seRecomiendaElViaje(viaje) = self.leAtraeLaActividad(viaje) and viaje.esInteresante() and !actividadesRealizadas.contains(viaje)
	method seRecomiendaLaClaseDeGym() = edad.between(20,30)
	method seRecomiendaClubLiteratura() = idiomasQueHabla.size() > 1
	method aprenderIdiomas(idiomas){
		idiomasQueHabla.addAll(idiomas)
	}
	method hacerActividad(actividad){
		if (actividadesRealizadas.size() < maximoDeActividades){
			actividadesRealizadas.add(actividad)	
		}
		else{
			self.error("el socio ya no puede realizar actividades")
		}
	}
	
	method esAdoradorDelSol() = actividadesRealizadas.all({n => n.sirveParaBroncearse()})
	method leAtraeLaActividad(actividad) = true
	method actividadesEsforzadas() = actividadesRealizadas.filter({n => n.implicaEsfuerzo()})
}

class SocioTranquilo inherits Socio{
	
	override method leAtraeLaActividad(actividad) = actividad.duracion() > 3
}
class SocioCoherente inherits Socio{
	
	override method leAtraeLaActividad(actividad) = self.esAdoradorDelSol() or actividad.implicaEsfuerzo()
}
class SocioRelajado inherits Socio{
	
	override method leAtraeLaActividad(actividad) = actividad.idioma().any({i => idiomasQueHabla.any({n => n == i})})
}
