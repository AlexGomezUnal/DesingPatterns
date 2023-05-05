import "dart:collection";

/*El patrón de diseño Interpreter se utiliza para definir una gramática para un lenguaje y proporcionar un intérprete que pueda evaluar sentencias escritas en ese lenguaje. El intérprete utiliza la gramática para comprender el significado de las sentencias y ejecutar la acción apropiada.

Aquí hay un ejemplo en Dart del patrón Interpreter:

Supongamos que queremos implementar un intérprete que pueda sumar o restar números enteros. Primero, definimos una interfaz de Expresión que tiene un método para evaluar la expresión:

*/
class Stack<T> {
  final _stack = Queue<T>();

  int get length => _stack.length;

  bool canPop() => _stack.isNotEmpty;

  void clearStack() {
    while (_stack.isNotEmpty) {
      _stack.removeLast();
    }
  }

  void push(T element) {
    _stack.addLast(element);
  }

  T pop() {
    T lastElement = _stack.last;
    _stack.removeLast();
    return lastElement;
  }

  T peak() => _stack.last;
}

abstract class Expresion {
  int evaluar();
}

//A continuación, implementamos dos clases de expresión que representan una suma y una resta:
class Suma implements Expresion {
  final Expresion _expresion1;
  final Expresion _expresion2;

  Suma(this._expresion1, this._expresion2);

  @override
  int evaluar() => _expresion1.evaluar() + _expresion2.evaluar();
}

class Resta implements Expresion {
  final Expresion _expresion1;
  final Expresion _expresion2;

  Resta(this._expresion1, this._expresion2);

  @override
  int evaluar() => _expresion1.evaluar() - _expresion2.evaluar();
}
//Finalmente, creamos un intérprete que puede analizar una cadena que representa una expresión y crear una instancia de la clase de expresión apropiada:

class Interpretador {
  Expresion interpretar(String expresion) {
    final List<String> tokens = expresion.split(' ');
    final Stack<Expresion> stack = Stack<Expresion>();

    for (final token in tokens) {
      if (token == '+') {
        final Expresion exp2 = stack.pop();
        final Expresion exp1 = stack.pop();
        final Expresion expSuma = Suma(exp1, exp2);
        stack.push(expSuma);
      } else if (token == '-') {
        final Expresion exp2 = stack.pop();
        final Expresion exp1 = stack.pop();
        final Expresion expResta = Resta(exp1, exp2);
        stack.push(expResta);
      } else {
        final Expresion expNumero = Numero(int.parse(token)) as Expresion;
        stack.push(expNumero);
      }
    }

    return stack.pop();
  }
}

class Numero implements Expresion {
  int? _value;
  int? _length;

  Numero(int num) {
    this._value = num;
    this._length = getLength();
  }

  @override
  int evaluar() => _value!;

  int? getLength() {
    var numString = this._value.toString();
    if (this._length == numString.length) {
      return this._length;
    } else {
      this._length = numString.length;
      return this._length;
    }
  }
}

//En este intérprete, dividimos la cadena de expresión en tokens y creamos una pila de expresiones. Luego, para cada token, verificamos si es un signo más o menos o un número. Si es un signo más o menos, sacamos dos expresiones de la pila, creamos una nueva expresión que representa la suma o resta y la ponemos de nuevo en la pila. Si es un número, creamos una expresión que representa ese número y la ponemos en la pila. Al final, la pila debe contener una única expresión, que es la evaluación de la expresión original.
void main() {
  final Interpretador interpretador = Interpretador();

  // Ejemplo: 3 + 4 - 2
  final String expresion = '1 2 + 3 -';
  final Expresion resultado = interpretador.interpretar(expresion);

  print(resultado.evaluar()); // Output: 5
}
