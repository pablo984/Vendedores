import vendedores.*

class Centro {
	var property ciudad
	var property vendedores = []
	
	method agregarVendedor(unVendedor) {
		if (not vendedores.contains(unVendedor)) {
			vendedores.add(unVendedor)
		}
		else {
			self.error("error")
		}		
	}
	method elVendedorEstrella() {
		return vendedores.map({ vend => vend.puntajeTotal() })
	}
}
