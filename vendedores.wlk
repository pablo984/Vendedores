class Vendedor {
	var property certificaciones = []
	
	method agregarCertificaciones(variasCertificaciones) {
		certificaciones.addAll(variasCertificaciones)
	}
	method agregarCertificacion(unaCertificacion) {
		certificaciones.add(unaCertificacion)
	}	
	method puedeTrabajarEn(unaCiudad) //método abstracto (sin llaves, indicaciones ni return)
	
	/*Método adicional*/
	method tiene3CerficicacionesOMas() {
		return certificaciones.size() >= 3
	}
	/*Método adicional*/
	method tiene1CertificacionDeProductos() {
		return certificaciones.any({ cer => cer.esDeProductos() })
	}
	/*Método adicional*/
	method tiene1CertificacionNoDeProductos() {
		return certificaciones.any({ cer => not cer.esDeProductos() })
	}
	method esVendedorVersatil() {
		return self.tiene3CerficicacionesOMas() and self.tiene1CertificacionDeProductos() and self.tiene1CertificacionNoDeProductos()
	}
	method esVendedorFirme() {
		return certificaciones.sum({ cer => cer.puntos() }) >= 30
	}
	method esVendedorInfluyente() // método abstracto
	
	/*Método adicional*/
	method puntajeTotal() {
		return certificaciones.sum({ cer => cer.puntos() })
	}	
}

class Fijo inherits Vendedor {
	var property ciudad
	
	override method puedeTrabajarEn(unaCiudad) {
		return ciudad == unaCiudad
	}
	override method esVendedorInfluyente() {
		return false
	}
}

class Viajante inherits Vendedor {
	var property provinciasHabilitadas = [] // provincias
	
	override method puedeTrabajarEn(unaCiudad) {
		return provinciasHabilitadas.any({ pro => pro == unaCiudad.provincia() })
	}
	override method esVendedorInfluyente() {
		return provinciasHabilitadas.sum({ pro => pro.poblacion()} ) >= 10000000
	}
	
}

class ComercioCorresponsal inherits Vendedor {
	var property sucursales = [] //ciudades
	
	override method puedeTrabajarEn(unaCiudad) {
		return sucursales.any({ ciu => ciu == unaCiudad })
	}
	/*Método adicional*/
	method provinciasDeLasSucursales() {
		return sucursales.map({ ciu => ciu.provincia() }).asSet()
	}
	override method esVendedorInfluyente() {
		return sucursales.size() >= 5 or self.provinciasDeLasSucursales().size() >= 3
	}
}

class Certificacion {
	var property puntos = 0
	var property esDeProductos = true
}

class Provincia {
	var property poblacion
}

class Ciudad {
	var property provincia 
}

