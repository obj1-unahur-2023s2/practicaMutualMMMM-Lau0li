class Viaje {
	const idioma = []
	
	method idioma() = idioma
	method agregarIdiomas(listaIdiomas){
		idioma.addAll(listaIdiomas)
	}
	method esInteresante() = idioma.size() > 1
}

class ViajeDePlaya inherits Viaje{
	const largo
	
	method duracion() = largo / 500
	method implicaEsfuerzo() = largo > 1200
	method sirveParaBroncearse() = true
}

class ExcursionACiudad inherits Viaje{
	const atraccionesAVisitar
	
	override method esInteresante() = super() and atraccionesAVisitar == 5
	method duracion() = atraccionesAVisitar / 2
	method implicaEsfuerzo() = atraccionesAVisitar.between(2,8)
	method sirveParaBroncearse() = false
}

class ExcursionACiudadTropical inherits ExcursionACiudad{
	override method duracion() = super() + 1
	override method sirveParaBroncearse() = true
}

class SalidaTrekking inherits Viaje{
	const kilometrosARecorrer
	const diasDeSol
	
	override method esInteresante() = super() and diasDeSol > 140
	method duracion() = kilometrosARecorrer / 50
	method implicaEsfuerzo() = kilometrosARecorrer > 80
	method sirveParaBroncearse() = diasDeSol.between(100, 200) and kilometrosARecorrer > 120
}

class ClaseGimnasia{
	method idioma() = ["espaniol"]
	
	method duracion() = 1
	method sirveParaBroncearse() = false
	method implicaEsfuerzo() = true
}

class TallerLiterario{
	var libros = []
	
	method agregarLibros(listaDeLibros){
		libros.addAll(listaDeLibros)
	}
	method idiomas() = libros.map({n => n.idioma()}).asSet().asList()
	method duracion() = libros.size() + 1
	method implicaEsfuerzo() = libros.any({n => n.paginas() > 500}) or (libros.all({n => libros.all({i => n.autor() == i.autor()})})) and libros.size() > 1
	method sirveParaBroncearse() = false
}

class Libro {
	const idioma
	const autor
	const paginas
	
	method idioma() = idioma
	method autor() = autor
	method paginas() = paginas
}