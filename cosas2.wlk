object knightRider {

    method peso() {
        return 500
    }

    method peligrosidad() {
        return 10
    }

    method bultos() {
        return 1
    }

    method reaccionarALaCarga() {
    }
}

object bumblebee {

    var transformadoEnAuto = true

    method transformarseEnRobot() {
        transformadoEnAuto = false
    }

    method peso() {
        return 800
    }

    method peligrosidad() {

        if(transformadoEnAuto) {
            return 15
        }

        return 30
    }

    method bultos() {
        return 2
    }

    method reaccionarALaCarga() {
        self.transformarseEnRobot()
    }
}

object paqueteLadrillos {

    var cantidad = 0

    method cantidad(cant) {
        cantidad = cant
    }

    method peso() {
        return cantidad * 2
    }

    method peligrosidad() {
        return 2
    }

    method bultos() {

        if(cantidad <= 100) {
            return 1
        }

        if(cantidad <= 300) {
            return 2
        }

        return 3
    }

    method reaccionarALaCarga() {
        cantidad += 12
    }
}

object arenaGranel {

    var kilos = 0

    method kilos(valor) {
        kilos = valor
    }

    method peso() {
        return kilos
    }

    method peligrosidad() {
        return 1
    }

    method bultos() {
        return 1
    }

    method reaccionarALaCarga() {
        kilos -= 10
    }
}


object bateriaAntiaerea {

    var tieneMisiles = false

    method cargarMisiles() {
        tieneMisiles = true
    }

    method peso() {

        if(tieneMisiles) {
            return 300
        }

        return 200
    }

    method peligrosidad() {

        if(tieneMisiles) {
            return 100
        }

        return 0
    }

    method bultos() {

        if(tieneMisiles) {
            return 2
        }

        return 1
    }

    method reaccionarALaCarga() {
        self.cargarMisiles()
    }
}

object contenedor {

    var cosas = []

    method agregar(unaCosa) {
        cosas.add(unaCosa)
    }

    method peso() {
        return 100 + cosas.sum { cosa => cosa.peso() }
    }

    method peligrosidad() {

        if(cosas.isEmpty()) {
            return 0
        }

        return cosas.max { cosa => cosa.peligrosidad() }.peligrosidad()
    }

    method bultos() {
        return 1 + cosas.sum { cosa => cosa.bultos() }
    }

    method reaccionarALaCarga() {
        cosas.forEach { cosa =>
            cosa.reaccionarALaCarga()
        }
    }
}

object residuosRadioactivos {

    var kilos = 0

    method kilos(valor) {
        kilos = valor
    }

    method peso() {
        return kilos
    }

    method peligrosidad() {
        return 200
    }

    method bultos() {
        return 1
    }

    method reaccionarALaCarga() {
        kilos += 15
    }
}

object embalajeSeguridad {

    var contenido = null

    method contenido(unaCosa) {
        contenido = unaCosa
    }

    method peso() {
        return contenido.peso()
    }

    method peligrosidad() {
        return contenido.peligrosidad() / 2
    }

    method bultos() {
        return 2
    }

    method reaccionarALaCarga() {
    }
}