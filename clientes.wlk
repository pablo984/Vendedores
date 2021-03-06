import vendedores.*
import centrosDeDistribucion.*
import geografia.*

class ClienteInseguro {
	method puedeSerAtendidoPor(unVendedor) {
		return unVendedor.esVendedorFirme() and unVendedor.esVendedorVersatil()
	}
}

class ClienteDetallista {
	method puedeSerAtendidoPor(unVendedor) {
		return unVendedor.tieneAlMenos3CertificacionesSobreProductos()
	}
}

class ClienteHumanista {
	method  puedeSerAtendidoPor(unVendedor) {
		return unVendedor.esPersonaFisica()
	}
}
