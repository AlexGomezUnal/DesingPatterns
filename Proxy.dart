// Interfaz que define las operaciones que puede realizar el objeto real y su proxy
abstract class Objeto {
  void operacion();
}

// Implementación del objeto real
class ObjetoReal implements Objeto {
  @override
  void operacion() {
    print("Realizando la operación");
  }
}

// Implementación del objeto proxy
class ObjetoProxy implements Objeto {
  ObjetoReal? _objetoReal;

  @override
  void operacion() {
    if (_objetoReal == null) {
      _objetoReal = ObjetoReal();
    }
    print("Antes de la operación");
    _objetoReal!.operacion();
    print("Después de la operación");
  }
}

// Ejemplo de uso
void main() {
  Objeto objeto = ObjetoProxy();
  objeto.operacion();
}
