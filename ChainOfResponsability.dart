// Definimos la clase abstracta para los manejadores de solicitudes
abstract class ManejadorDeSolicitudes {
  ManejadorDeSolicitudes? siguiente;

  ManejadorDeSolicitudes(ManejadorDeSolicitudes? s) {
    siguiente = s;
  }

  void manejarSolicitud(Solicitud solicitud);
}

// Definimos una solicitud
class Solicitud {
  int nivel;

  Solicitud(this.nivel);
}

// Definimos la primera clase de manejador de solicitudes
class PrimerManejador extends ManejadorDeSolicitudes {
  PrimerManejador(ManejadorDeSolicitudes? s) : super(s);

  @override
  void manejarSolicitud(Solicitud solicitud) {
    if (solicitud.nivel == 1) {
      print('Solicitud manejada por PrimerManejador');
    } else if (siguiente != null) {
      siguiente!.manejarSolicitud(solicitud);
    }
  }
}

// Definimos la segunda clase de manejador de solicitudes
class SegundoManejador extends ManejadorDeSolicitudes {
  SegundoManejador(ManejadorDeSolicitudes? s) : super(s);

  @override
  void manejarSolicitud(Solicitud solicitud) {
    if (solicitud.nivel == 2) {
      print('Solicitud manejada por SegundoManejador');
    } else if (siguiente != null) {
      siguiente!.manejarSolicitud(solicitud);
    }
  }
}

// Definimos la tercera clase de manejador de solicitudes
class TercerManejador extends ManejadorDeSolicitudes {
  TercerManejador(ManejadorDeSolicitudes? s) : super(s);

  @override
  void manejarSolicitud(Solicitud solicitud) {
    if (solicitud.nivel == 3) {
      print('Solicitud manejada por TercerManejador');
    } else {
      print('No se encontró ningún manejador para la solicitud');
    }
  }
}

// Ejemplo de uso
void main() {
  // Creamos la cadena de manejadores de solicitudes
  ManejadorDeSolicitudes manejador =
      TercerManejador(SegundoManejador(PrimerManejador(null)));

  // Creamos una solicitud
  Solicitud solicitud = Solicitud(2);

  // Enviamos la solicitud a través de la cadena de manejadores
  manejador.manejarSolicitud(solicitud);
}
