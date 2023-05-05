class TiendaEnLinea {
  ProcesadorDePagos _procesadorDePagos;
  GestorDeInventario _gestorDeInventario;
  GestorDePedidos _gestorDePedidos;

  TiendaEnLinea() {
    _procesadorDePagos = new ProcesadorDePagos();
    _gestorDeInventario = new GestorDeInventario();
    _gestorDePedidos = new GestorDePedidos();
  }

  void realizarPedido(List<Producto> productos) {
    _procesadorDePagos.procesarPago();
    _gestorDeInventario.actualizarInventario(productos);
    _gestorDePedidos.registrarPedido(productos);
  }

  String consultarEstadoDePedido(int idPedido) {
    return _gestorDePedidos.consultarEstadoDePedido(idPedido);
  }

  // Otros métodos que expongan la funcionalidad del sistema de manera sencilla.
}

class Producto {
  late String _color;
  late String _name;
  late int _serial;
  late int _stock;
  late int _idPedido;
  late double _precio;

  Producto(String s, double d) {
    this._name = s;
    this._precio = d;
  }
}

class GestorDePedidos {
  void registrarPedido(List productos) {}
  String consultarEstadoDePedido(int idPedido) {
    if (idPedido > 0) {
      return "En Stock";
    } else {
      return "Se Acabo el Producto";
    }
  }
}

class GestorDeInventario {
  List? iventario;
  void actualizarInventario(List productos) {
    this.iventario = productos;
  }
}

class ProcesadorDePagos {
  String procesarPago() {
    return ("Procesando Pago");
  }
}

void main() {
  TiendaEnLinea tienda = new TiendaEnLinea();

  List<Producto> productos = [
    new Producto("Producto 1", 10.0),
    new Producto("Producto 2", 20.0)
  ];
  tienda.realizarPedido(productos);

  String estadoPedido = tienda.consultarEstadoDePedido(1);
  print("Estado del pedido: $estadoPedido");
}
