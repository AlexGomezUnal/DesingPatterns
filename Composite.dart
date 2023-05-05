import "dart:collection";

/*Creamos la clase Componente, que define 
la interfaz común que todos 
los objetos pueden utilizar:*/
abstract class Componente {
  void operacion();
}
/*Creamos la clase Hoja, 
que es un objeto simple 
que implementa la interfaz Componente:*/

class Hoja extends Componente {
  @override
  void operacion() {
    print('Operación en Hoja');
  }
}

/*Creamos la clase Compuesto, 
que es un objeto que contiene 
una lista de objetos Componente:*/
class Compuesto extends Componente {
  final List<Componente> _componentes = [];

  void agregar(Componente componente) {
    _componentes.add(componente);
  }

  @override
  void operacion() {
    print('Operación en Compuesto');
    for (final componente in _componentes) {
      componente.operacion();
    }
  }
}

//En esta implementación, la clase Compuesto implementa la interfaz Componente y contiene una lista de objetos Componente. La clase Compuesto también define un método agregar que permite agregar nuevos objetos a la lista.
//Podemos utilizar la clase Hoja y la clase Compuesto para crear una estructura de objetos jerárquica:
void main() {
  final hoja1 = Hoja();
  final hoja2 = Hoja();
  final compuesto = Compuesto();
  compuesto.agregar(hoja1);
  compuesto.agregar(hoja2);
  compuesto.agregar(Hoja());
  final raiz = Compuesto();
  raiz.agregar(hoja1);
  raiz.agregar(compuesto);
  raiz.operacion();
}
//En este ejemplo, 
//creamos dos objetos Hoja y 
//un objeto Compuesto. 
//Agregamos las Hojas y 
//el Compuesto al objeto raíz, 
//que es también un objeto Compuesto. 
//Luego, llamamos al método operacion en 
//el objeto raíz, que se encarga de 
//llamar al método operacion en 
//todos los objetos de la estructura.
//El patrón Composite nos 
//permite tratar objetos individuales y 
//estructuras de objetos de la misma manera. En este ejemplo, podemos agregar nuevas Hojas y Compuestos a la estructura sin tener que modificar el código existente.

