class Pizza {
  String? masa;
  String? salsa;
  String? cobertura;

  Pizza({this.masa, this.salsa, this.cobertura});

  void mostrar() {
    print('Pizza con $masa, salsa $salsa y $cobertura');
  }
}

abstract class PizzaBuilder {
  void agregarMasa();
  void agregarSalsa();
  void agregarCobertura();
  Pizza obtenerPizza();
}

class HawaianaBuilder extends PizzaBuilder {
  late Pizza _pizza;

  HawaianaBuilder() {
    _pizza = Pizza();
  }

  @override
  void agregarMasa() {
    _pizza.masa = 'masa gruesa';
  }

  @override
  void agregarSalsa() {
    _pizza.salsa = 'salsa de tomate';
  }

  @override
  void agregarCobertura() {
    _pizza.cobertura = 'piña y jamón';
  }

  @override
  Pizza obtenerPizza() {
    return _pizza;
  }
}

class Cocina {
  late PizzaBuilder _builder;

  void setBuilder(PizzaBuilder builder) {
    _builder = builder;
  }

  Pizza cocinarPizza() {
    _builder.agregarMasa();
    _builder.agregarSalsa();
    _builder.agregarCobertura();

    return _builder.obtenerPizza();
  }
}

void main() {
  final cocina = Cocina();
  cocina.setBuilder(HawaianaBuilder());

  final pizzaHawaiana = cocina.cocinarPizza();
  pizzaHawaiana
      .mostrar(); // salida: 'Pizza con masa gruesa, salsa de tomate y piña y jamón'
}
