object espadaMaestra {

	const poderNormal = 100

	method poderEspecial(unPersonaje) {
		return poderNormal + self.poderExtra(unPersonaje)
	}

	method poderExtra(unPersonaje) {
		if (unPersonaje.tieneDanioIgualA(0)) return 50 else return 0
	}

}

class Boomerang{
	var calidadMadera
	
	method poderEspecial(unPersonaje){
		return calidadMadera * 2
	}
}

object arcoYFlecha{
	method poderEspecial(unPersonaje){
		return 5 * unPersonaje.poderBase()
	}
}