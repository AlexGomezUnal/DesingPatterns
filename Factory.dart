class Objeto {
  void metodoComun() {}
}

class ObjetoA extends Objeto {}

class ObjetoB extends Objeto {}

class FabricaObjetos {
  crearObjeto(String tipo) {
    if (tipo == "A") {
      return new ObjetoA();
    } else if (tipo == "B") {
      return new ObjetoB();
    } else {
      throw new Error();
    }
  }
}

void main() {
  final fabrica = new FabricaObjetos();
  final objeto1 = fabrica.crearObjeto("A");
  final ObjetoB = fabrica.crearObjeto("B");
}
