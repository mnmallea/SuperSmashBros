class Fase{
	method faseAnterior()
	method faseSiguiente()
	
	method evolucionar(unGoku){
		unGoku.fase(self.faseSiguiente())
	}
}

object faseNormal inherits Fase{
	override method faseAnterior() = self
	override method faseSiguiente() = ssj1
	
	method danioMaximoExtra(danioMaximoBase) = 0
	
	method poderEspecial() = 100
	
	method realizarAtaque(unGoku){
		//no hace nada
	}
}

class SuperSayajin inherits Fase{
	var porcentajeExtra
	
	method danioMaximoExtra(danioMaximoBase) = danioMaximoBase * (porcentajeExtra / 100)
	
	method poderEspecial() = 10 * self.faseAnterior().poderEspecial() + 50
	
	method realizarAtaque(unGoku){
		if(unGoku.poderOfensivo() > self.poderQueSeBanca(unGoku)){
			unGoku.involucionarA(self.faseAnterior())
		}
	}
	
	method poderQueSeBanca(unGoku){
		return self.poderEspecial() + 3 * unGoku.danioParaQuedarFueraDeCombate()
	}
}

object ssj1 inherits SuperSayajin(porcentajeExtra = 10){
	override method faseAnterior() = faseNormal
	override method faseSiguiente() = ssj2
}

object ssj2 inherits SuperSayajin(porcentajeExtra = 25){
	override method faseAnterior() = ssj1
	override method faseSiguiente() = ssj3
}

object ssj3 inherits SuperSayajin(porcentajeExtra = 80){
	override method faseAnterior() = ssj2
	override method faseSiguiente() = self
}