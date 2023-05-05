/*El patrón de diseño Decorator es un patrón estructural que permite añadir funcionalidades a un objeto de forma dinámica. El patrón de diseño Decorator utiliza la composición en lugar de la herencia para extender la funcionalidad de un objeto. Esto significa que se pueden añadir nuevas funcionalidades a un objeto existente sin modificar su estructura original.
Un ejemplo de uso del patrón Decorator en Dart podría ser el siguiente:
Supongamos que tenemos una interfaz llamada Pizza que representa una pizza básica y que tiene un método precio() que devuelve el precio de la pizza.
*/
abstract class Pizza {
  //interface
  late String descripcion;

  String getDescripcion() {
    return descripcion;
  }

  double precio();
}
//Luego, tenemos una clase llamada PizzaMargherita que implementa la interfaz Pizza y representa una pizza margarita básica:

class PizzaMargherita implements Pizza {
  String descripcion = "Pizza Margherita";

  @override
  double precio() {
    return 8.0;
  }

  @override
  String getDescripcion() {
    return this.descripcion;
    throw UnimplementedError();
  }
}
//Ahora, queremos añadir nuevas funcionalidades a la pizza margarita, como por ejemplo añadirle queso extra. En lugar de crear una nueva clase PizzaMargheritaConQuesoExtra que herede de PizzaMargherita, utilizamos el patrón Decorator.

//Creamos una clase IngredienteExtra que implementa la interfaz Pizza y que tiene un atributo Pizza que representa la pizza básica:

abstract class IngredienteExtra implements Pizza {
  //interface
  Pizza _pizza;

  IngredienteExtra(this._pizza);

  @override
  String getDescripcion() {
    return _pizza.getDescripcion();
  }

  @override
  double precio() {
    return _pizza.precio();
  }
}
//Luego, creamos una clase QuesoExtra que extiende de IngredienteExtra y que añade queso extra a la pizza:

class QuesoExtra extends IngredienteExtra {
  @override //Interface
  late String descripcion;

  QuesoExtra(Pizza pizza) : super(pizza);

  @override
  String getDescripcion() {
    return "${_pizza.getDescripcion()}, Queso Extra";
  }

  @override
  double precio() {
    return _pizza.precio() + 1.0;
  }
}

//Finalmente, podemos crear una pizza margarita con queso extra de la siguiente manera:
void main() {
  Pizza pizza = new PizzaMargherita();
  pizza = new QuesoExtra(pizza);

  print("Descripción: ${pizza.getDescripcion()}");
  print("Precio: ${pizza.precio()}");
}

/*El resultado de la ejecución del código anterior sería el siguiente:

Descripción: Pizza Margherita, Queso Extra
Precio: 9.0
Como se puede ver, hemos añadido la funcionalidad de queso extra a la pizza margarita sin modificar su estructura original.
*/ 