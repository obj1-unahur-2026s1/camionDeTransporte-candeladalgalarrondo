object camion {

    const tara = 1000
    const pesoMaximo = 2500

    var cosas = []

    method cargar(unaCosa) {

        unaCosa.reaccionarALaCarga()

        cosas.add(unaCosa)
    }

    method descargar(unaCosa) {
        cosas.remove(unaCosa)
    }

    method pesoTotal() {
       return tara + cosas.sum { cosa => cosa.peso() }
    }

    method pesosSonPares() {
       return cosas.all { cosa => cosa.peso() % 2 == 0 }
    }

    method hayAlgoQuePesa(unPeso) {
        return cosas.any { cosa => cosa.peso() == unPeso }
    }

    method primeraCosaPeligrosa(nivel) {
        return cosas.find { cosa => cosa.peligrosidad() == nivel }
    }

    method cosasMasPeligrosasQue(nivel) {
        return cosas.filter { cosa => cosa.peligrosidad() > nivel }
    }

    method cosasMasPeligrosasQueCosa(unaCosa) {
        return self.cosasMasPeligrosasQue(unaCosa.peligrosidad())
    }

    method estaExcedido() {
       return self.pesoTotal() > pesoMaximo
    }

    method puedeCircular(nivelMaximo) {
        return !self.estaExcedido() &&
        cosas.all { cosa => cosa.peligrosidad() <= nivelMaximo }
    }

    method hayAlgoEntre(min,max) {
        return cosas.any { cosa =>
            cosa.peso() >= min &&
            cosa.peso() <= max
        }
    }

    method cosaMasPesada() {
        return cosas.max { cosa => cosa.peso() }
    }

    method totalBultos() {
        return cosas.sum { cosa => cosa.bultos() }
    }
}