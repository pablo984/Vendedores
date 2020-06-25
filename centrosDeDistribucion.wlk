import vendedores.*
import geografia.*

class Centro {
	var property ciudad
	var property vendedores = []
	
	method agregarVendedor(unVendedor) {
		if (not vendedores.contains(unVendedor)) {
			vendedores.add(unVendedor)
		}
		else {
			console.println("Ya existe el vendedor en la lista")
		}		
	}
	method elVendedorEstrella() {
		return vendedores.max({ vend => vend.puntajeTotal() })
	}
	method puedeCubrir(unaCiudad) {
		return vendedores.any({ vend => vend.puedeTrabajarEn(unaCiudad) })
	}
	method vendedoresGenericos() {
		return vendedores.filter({ vend => vend.tiene1CertificacionNoDeProductos() })
	}
	method esRobusto() {
		return vendedores.filter({ vend => vend.esVendedorFirme() }).size() >= 3
	}
	method repartirCertificacion(unaCertificacion) {
		vendedores.forEach({ vend => vend.agregarCertificacion(unaCertificacion) })
	}
	/*Método adicional*/
	method certificacionesDeLosVendedores() {
		return vendedores.map({ vend => vend.certificaciones() }).asSet()
	}
		
	
}
