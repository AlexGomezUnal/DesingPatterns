/*El patrón Observer en Dart permite que un objeto mantenga una lista de sus dependencias, llamadas observadores, y les notifique automáticamente cuando ocurre algún cambio en su estado interno.

El patrón Observer se puede implementar en Dart utilizando la clase Stream, que proporciona una forma eficiente de enviar eventos asincrónicos a múltiples suscriptores. El objeto que emite los eventos se convierte en un "stream controller", mientras que los objetos que escuchan los eventos se convierten en "streams".

A continuación, se muestra un ejemplo simple de cómo se puede implementar el patrón Observer en Dart utilizando la clase Stream:
*/
import 'dart:async';

class Notificador {
  StreamController _streamController = StreamController();

  Stream get cambios => _streamController.stream;

  void notificar() {
    _streamController.add('Se ha producido un cambio');
  }
}

class Observador {
  String nombre;

  Observador(this.nombre);

  void actualizar(String mensaje) {
    print('$nombre ha recibido el mensaje: $mensaje');
  }
}

void main() {
  var notificador = Notificador();
  var observador1 = Observador('Observador 1');
  var observador2 = Observador('Observador 2');

  notificador.cambios.listen((mensaje) {
    observador1.actualizar(mensaje);
    observador2.actualizar(mensaje);
  });

  notificador.notificar();
}
/*En este ejemplo, Notificador es el objeto que emite los eventos y mantiene una referencia al StreamController que se utiliza para enviar los eventos. La clase Observador es una clase dependiente que se suscribe al stream y recibe las notificaciones cuando se producen cambios.

En el método main, se crea un objeto Notificador y dos objetos Observador. Luego, se suscriben los observadores al stream utilizando el método listen, que recibe una función que se ejecutará cada vez que se envíe un evento al stream. Finalmente, se llama al método notificar en el objeto Notificador para enviar un mensaje a los observadores.
*/