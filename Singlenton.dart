class Singleton {
  static Singleton? _instance;

  Singleton._(); // constructor privado para evitar instanciación directa

  static Singleton? get instance {
    if (_instance == null) {
      _instance = Singleton._();
    }
    return _instance;
  }

  void ejemplo() {
    print('Método de ejemplo en Singleton');
  }
}

void main() {
  // Creamos la instancia única de nuestra clase Singleton
  final instanciaUnica = Singleton.instance;

  // Llamamos a un método de nuestra instancia única
  instanciaUnica?.ejemplo(); // salida: 'Método de ejemplo en Singleton'

  // Intentamos crear otra instancia, pero obtendremos la misma instancia única
  final otraInstancia = Singleton.instance;
  print(identical(instanciaUnica, otraInstancia)); // salida: true
}
