import DanioMaximo.*

class Personaje {

	var danio = 0
	var poderBase

	method danio() = danio

	method poderBase() = poderBase

	method danioMaximo() {
		return danioMaximo.valor()
	}

	method poderOfensivo() = poderBase * 3 + self.poderEspecial()

	method poderEspecial()

	method estaFueraDeCombate() = self.danio() == self.danioMaximo()

	method sufrirDanio(unaCantidad) {
		danio = self.danioMaximo().min(self.danio() + unaCantidad)
	}

	method atacarA(otroPersonaje) {
		if (self.estaFueraDeCombate()) {
			self.error("No puede atacar porque está fuera de combate")
		}
		otroPersonaje.sufrirDanio(self.poderOfensivo())
	}

	method debilidad() = self.danio() / self.poderBase()

	method esMasDebilQue(otroPersonaje) = self.debilidad() > otroPersonaje.debilidad()

}

class CaptainFalcon inherits Personaje {

	override method poderEspecial() = 9999

}

class Jigglypuff inherits Personaje {

	override method poderEspecial() {
		if (self.danio() > 200) return 250 else return 10
	}

}

class Link inherits Personaje {

	var arma

	override method poderEspecial() {
		return arma.poderEspecial(self)
	}

}

