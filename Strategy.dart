/*El patrón Strategy es un patrón de diseño de software que se utiliza para permitir que un objeto cambie su comportamiento en tiempo de ejecución, sin tener que cambiar su clase.

En este patrón, se define una familia de algoritmos, encapsulándolos en clases separadas, y haciendo que sean intercambiables. De esta manera, el objeto que utiliza la clase puede cambiar su comportamiento durante la ejecución, simplemente cambiando la instancia de la clase.

A continuación, se presenta un ejemplo de implementación del patrón Strategy en Dart:

Supongamos que tenemos una clase Ordenamiento que se encarga de ordenar una lista de elementos, y queremos permitir que el usuario pueda elegir el algoritmo de ordenamiento que prefiera en tiempo de ejecución. Para ello, definimos una clase EstrategiaOrdenamiento con un método ordenar() que toma como parámetro una lista de elementos y devuelve la lista ordenada:

*/
abstract class EstrategiaOrdenamiento {
  List ordenar(List elementos);
}
//A continuación, creamos dos clases que implementan esta interfaz, una para ordenamiento por burbuja y otra para ordenamiento por selección:

class OrdenamientoBurbuja implements EstrategiaOrdenamiento {
  List ordenar(List a) {
    // Algoritmo de ordenamiento por burbuja
    for (var i = 0, length = a.length; i < length - 1; ++i) {
      bool swapped = false;
      for (var j = 0; j < length - 1 - i; ++j) {
        if (a[j] > a[j + 1]) {
          /* swap */
          var temp = a[j];
          a[j] = a[j + 1];
          a[j + 1] = temp;
          swapped = true;
        }
      }
      if (!swapped) {
        break; /* array has been sorted */
      }
    }
    return a;
  }
}

class OrdenamientoSeleccion implements EstrategiaOrdenamiento {
  List ordenar(List a) {
    // Algoritmo de ordenamiento por selección
    for (var i = 0; i < a.length - 1; i++) {
      var mi = i;
      for (var j = i + 1; j < a.length; j++) {
        if (a[j] < a[mi]) mi = j;
      }
      if (i != mi) {
        var t = a[i];
        a[i] = a[mi];
        a[mi] = t;
      }
    }
    return a;
  }
}
//Por último, definimos la clase Ordenamiento que utiliza una instancia de EstrategiaOrdenamiento para realizar el ordenamiento:

class Ordenamiento {
  late EstrategiaOrdenamiento _estrategia;

  void setEstrategia(EstrategiaOrdenamiento estrategia) {
    _estrategia = estrategia;
  }

  List ordenar(List elementos) {
    return _estrategia.ordenar(elementos);
  }
}
//De esta manera, el usuario puede elegir el algoritmo de ordenamiento que prefiera en tiempo de ejecución, simplemente cambiando la instancia de la clase EstrategiaOrdenamiento que utiliza Ordenamiento:

void main() {
  var ordenamiento = Ordenamiento();
  var elementos = [5, 3, 1, 4, 2];

  // Ordenamiento por burbuja
  ordenamiento.setEstrategia(OrdenamientoBurbuja());
  var resultado = ordenamiento.ordenar(elementos);
  print(resultado); // [1, 2, 3, 4, 5]

  // Ordenamiento por selección
  ordenamiento.setEstrategia(OrdenamientoSeleccion());
  resultado = ordenamiento.ordenar(elementos);
  print(resultado); // [1, 2, 3, 4, 5]
}
//En resumen, el patrón Strategy permite definir una familia de algoritmos, encapsulándolos en clases separadas, y haciendo que sean intercambiables en tiempo de ejecución. Esto nos permite cambiar el comportamiento de un objeto sin tener que cambiar su clase, lo que resulta en un código más flexible y mantenible.
