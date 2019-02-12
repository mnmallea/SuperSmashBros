class Equipo {

	var integrantes

	method integrantesEnPie() = integrantes.filter{ integrante => !integrante.estaFueraDeCombate() }

	method objetivoMasDebil() = integrantes.maxBy{ integrante => integrante.debilidad() }

	method noTieneChancesContra(otroEquipo) {
		return self.integrantesEnPieSonMasDebilesQue(otroEquipo.objetivoMasDebil()) || self.poderOfensivoEnPie() < otroEquipo.poderOfensivoEnPie() / 2
	}

	method poderOfensivoEnPie() = self.integrantesEnPie().sum{ integrante => integrante.poderOfensivo() }

	method integrantesEnPieSonMasDebilesQue(integrante) {
		return self.integrantesEnPie().all{ unIntegrante => unIntegrante.esMasDebilQue(integrante) }
	}
	
	method atacarA(otroEquipo){
		self.integrantesEnPie().forEach{
			integrante => integrante.atacarA(otroEquipo.objetivoMasDebil())
		}
	}

}

