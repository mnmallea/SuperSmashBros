import personajes.Personaje
import niveles.*

class Goku inherits Personaje {

	var property fase = faseNormal

	method evolucionar() {
		fase.evolucionar(self)
	}

	override method sufrirDanio(unaCantidad) {
		super(unaCantidad)
		if (!self.estaFueraDeCombate()) {
			self.evolucionar()
		}
	}

	override method danioMaximo() {
		var danioBase = super()
		return danioBase + fase.danioMaximoExtra(danioBase)
	}

	override method poderEspecial() = fase.poderEspecial()

	override method atacarA(otroPersonaje) {
		super(otroPersonaje)
		fase.realizarAtaque(self)
	}

	method danioParaQuedarFueraDeCombate() = self.danioMaximo() - self.danio()

	method involucionarA(unaFase) {
		self.fase(unaFase)
		self.involucionarDanio()
	}

	method involucionarDanio() {
		danio = self.danioMaximo() - 25
	}

}

