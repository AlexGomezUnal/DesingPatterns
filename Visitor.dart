/*El patrón Visitor es un patrón de diseño de comportamiento que permite agregar nuevos comportamientos a un objeto existente sin modificar su estructura. El patrón se basa en la idea de tener una clase visitante que visita objetos de diferentes tipos y realiza una operación en ellos.

En Dart, podemos implementar el patrón Visitor de la siguiente manera:
*/
//Definir la interfaz de visitante:
abstract class Visitor {
  void visitCircle(Circle circle);
  void visitSquare(Square square);
}

//Definir la clase base de elementos:
abstract class Shape {
  void accept(Visitor visitor);
}

//Definir las clases concretas de elementos:
class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  void accept(Visitor visitor) {
    visitor.visitCircle(this);
  }
}

class Square implements Shape {
  double length;

  Square(this.length);

  @override
  void accept(Visitor visitor) {
    visitor.visitSquare(this);
  }
}

//Definir la clase concreta de visitante:
class AreaVisitor implements Visitor {
  double totalArea = 0;

  @override
  void visitCircle(Circle circle) {
    totalArea += 3.14 * circle.radius * circle.radius;
  }

  @override
  void visitSquare(Square square) {
    totalArea += square.length * square.length;
  }
}

//Usar el patrón Visitor:
void main() {
  List<Shape> shapes = [Circle(5), Square(4), Circle(3), Square(7)];

  AreaVisitor areaVisitor = AreaVisitor();

  for (var shape in shapes) {
    shape.accept(areaVisitor);
  }

  print('Total area: ${areaVisitor.totalArea}');
}
/*En este ejemplo, tenemos un conjunto de formas y queremos calcular el área total de todas las formas. En lugar de tener un método getTotalArea() en cada forma, implementamos el patrón Visitor para visitar cada forma y agregar su área al total de áreas.

El patrón Visitor es útil cuando se tiene una estructura de objetos complejos y se necesitan agregar nuevas operaciones sin cambiar la estructura de la clase existente.
*/



