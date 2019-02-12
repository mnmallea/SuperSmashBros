object faseNormal{
	method danioMaximoExtra(danioMaximoBase) = 0
	
	method poderEspecial() = 100
	
	method evolucionar(unGoku){
		unGoku.fase(ssj1)
	}
	
	method realizarAtaque(unGoku){
		//no hace nada
	}
}

class SuperSayajin{
	var porcentajeExtra
	var faseAnterior
	
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

object ssj1 inherits SuperSayajin(porcentajeExtra = 10, faseAnterior = faseNormal){
	method evolucionar(unGoku){
		unGoku.fase(ssj2)
	}
	
}

object ssj2 inherits SuperSayajin(porcentajeExtra = 25, faseAnterior = ssj1){
	
	method evolucionar(unGoku){
		unGoku.fase(ssj3)
	}
}

object ssj3 inherits SuperSayajin(porcentajeExtra = 80, faseAnterior = ssj2){
	method evolucionar(unGoku){
		// no hace nada
	}
	
}