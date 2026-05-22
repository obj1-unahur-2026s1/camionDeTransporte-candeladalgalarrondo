object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {

    var transformadoEnAuto = true

    method transformarseEnRobot() {
        transformadoEnAuto = false
    }

    method peso() = 800

    method peligrosidad() {
        if(transformadoEnAuto) {
            return 15
        } else {
            return 30
        }
    }
}

object paqueteLadrillos {

    var cantidad = 0

    method cantidad(cant) {
        cantidad = cant
    }

    method peso() = cantidad * 2

    method peligrosidad() = 2
}

object arenaGranel {

    var kilos = 0

    method kilos(valor) {
        kilos = valor
    }

    method peso() = kilos

    method peligrosidad() = 1
}

object bateriaAntiaerea {

    var tieneMisiles = false

    method cargarMisiles() {
        tieneMisiles = true
    }

    method peso() {
        if(tieneMisiles) {
            return 300
        } else {
            return 200
        }
    }

    method peligrosidad() {
        if(tieneMisiles) {
            return 100
        } else {
            return 0
        }
    }
}



object contenedor {

    var cosas = []

    method agregar(unaCosa) {
        cosas.add(unaCosa)
    }

    method peso() {
      return  100 + cosas.sum { cosa => cosa.peso() }
    }

    method peligrosidad() {
        if(cosas.isEmpty()) {
            return 0
        } else {
            return cosas.max { cosa => cosa.peligrosidad() }.peligrosidad()
        }
    }
}

object residuosRadioactivos {

    var kilos = 0

    method kilos(valor) {
        kilos = valor
    }

    method peso() = kilos

    method peligrosidad() = 200
}

object embalajeSeguridad {

    var contenido = null

    method contenido(unaCosa) {
        contenido = unaCosa
    }

    method peso(){
   return contenido.peso()
    }
    method peligrosidad() {
       return contenido.peligrosidad() / 2
    }
}