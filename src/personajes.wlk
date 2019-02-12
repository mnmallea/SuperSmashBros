import DanioMaximo.*

class Personaje {

	var property danio = 0
	var property poderBase

	method danioMaximo() {
		return danioMaximo.valor()
	}

	method poderOfensivo() = poderBase * 3 + self.poderEspecial()

	method poderEspecial()

}

class CaptainFalcon inherits Personaje {

	override method poderEspecial() = 9999

}

class Jigglypuff inherits Personaje {

	override method poderEspecial() {
		if (danio > 200) return 250 else return 10
	}

}

class Link inherits Personaje{
	var arma
	
	override method poderEspecial(){
		return arma.poderEspecial(self)
	}
}

