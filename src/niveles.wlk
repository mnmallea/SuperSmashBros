class Fase{
	var faseAnterior
	var faseSiguiente
	
	method evolucionar(unGoku){
		unGoku.fase(faseSiguiente)
	}
}

object faseNormal inherits Fase(faseSiguiente = ssj1){
	method danioMaximoExtra(danioMaximoBase) = 0
	
	method poderEspecial() = 100
	
	method realizarAtaque(unGoku){
		//no hace nada
	}
}

class SuperSayajin inherits Fase{
	var porcentajeExtra
	
	method danioMaximoExtra(danioMaximoBase) = danioMaximoBase * (porcentajeExtra / 100)
	
	method poderEspecial() = 10 * faseAnterior.poderEspecial() + 50
	
	method realizarAtaque(unGoku){
		if(unGoku.poderOfensivo() > self.poderQueSeBanca(unGoku)){
			unGoku.involucionarA(faseAnterior)
		}
	}
	
	method poderQueSeBanca(unGoku){
		return self.poderEspecial() + 3 * unGoku.danioParaQuedarFueraDeCombate()
	}
}

object ssj1 inherits SuperSayajin(porcentajeExtra = 10, faseAnterior = faseNormal, faseSiguiente = ssj2){
}

object ssj2 inherits SuperSayajin(porcentajeExtra = 25, faseAnterior = ssj1, faseSiguiente = ssj3){
}

object ssj3 inherits SuperSayajin(porcentajeExtra = 80, faseAnterior = ssj2){
	override method evolucionar(unGoku){
		// no hace nada
	}
	
}