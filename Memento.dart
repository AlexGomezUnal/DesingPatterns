//Primero, definimos una clase originadora que tiene un estado que queremos guardar y restaurar. Por ejemplo, supongamos que tenemos una clase Texto que representa un objeto de texto con un contenido mutable:
class Texto {
  String _contenido;

  Texto(this._contenido);

  String get contenido => _contenido;

  set contenido(String nuevoContenido) {
    _contenido = nuevoContenido;
  }

  Memento crearMemento() {
    return Memento(this);
  }

  void restaurarMemento(Memento memento) {
    _contenido = memento.contenido;
  }
}
//A continuación, definimos una clase Memento que contiene una copia del estado actual del objeto Texto. La clase Memento debe tener un constructor que toma el estado actual como parámetro y un método que devuelve ese estado:

class Memento {
  final String _contenido;

  Memento(Texto texto) : _contenido = texto.contenido;

  String get contenido => _contenido;
}
//A continuación, actualizamos la clase Texto para que pueda crear un objeto Memento que contenga una copia de su estado actual y para que pueda restaurar su estado a partir de un objeto Memento dado:

//Finalmente, podemos utilizar la clase Texto y la clase Memento para guardar y restaurar el estado del objeto. Por ejemplo:

void main() {
  final Texto texto = Texto('Hola, mundo!');
  print(texto.contenido); // Output: Hola, mundo!

  final Memento memento = texto.crearMemento();
  texto.contenido = 'Adiós, mundo!';
  print(texto.contenido); // Output: Adiós, mundo!

  texto.restaurarMemento(memento);
  print(texto.contenido); // Output: Hola, mundo!
}
//En este ejemplo, creamos un objeto Texto con un contenido inicial de "Hola, mundo!". Luego, creamos un objeto Memento que contiene una copia del estado actual del objeto Texto. A continuación, cambiamos el contenido del objeto Texto a "Adiós, mundo!". Finalmente, restauramos el estado del objeto Texto utilizando el objeto Memento, lo que devuelve el contenido del objeto Texto a su valor original de "Hola, mundo!".