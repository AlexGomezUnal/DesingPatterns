/*El patrón Flyweight es un patrón de diseño estructural que se utiliza para minimizar el uso de memoria y mejorar el rendimiento de aplicaciones que utilizan una gran cantidad de objetos. En este patrón, se comparte un objeto común entre múltiples contextos en lugar de crear un objeto separado para cada contexto.

En Dart, podemos implementar el patrón Flyweight de la siguiente manera:
*/
class Tree {
  String _name;
  String _imagePath;

  Tree(this._name, this._imagePath);

  void display(int x, int y) {
    print('$_name tree is displayed at ($x, $y) with image: $_imagePath');
  }
}

class TreeFactory {
  static final Map<String, Tree> _treeCache = {};

  static Tree getTree(String name, String imagePath) {
    var tree = _treeCache[name];
    if (tree == null) {
      tree = Tree(name, imagePath);
      _treeCache[name] = tree;
    }
    return tree;
  }
}

class Forest {
  final List<Tree> _trees = [];

  void plantTree(int x, int y, String name, String imagePath) {
    final tree = TreeFactory.getTree(name, imagePath);
    tree.display(x, y);
    _trees.add(tree);
  }
}

void main() {
  final forest = Forest();

  forest.plantTree(0, 0, 'Oak', 'assets/oak.png');
  forest.plantTree(10, 10, 'Pine', 'assets/pine.png');
  forest.plantTree(20, 20, 'Oak', 'assets/oak.png');
  forest.plantTree(30, 30, 'Pine', 'assets/pine.png');
}
/*En este ejemplo, la clase Tree representa un objeto árbol que tiene un nombre y una ruta de imagen. La clase TreeFactory es responsable de crear y almacenar árboles en una caché. La clase Forest es responsable de plantar los árboles en diferentes coordenadas.

Cuando se llama al método plantTree en la clase Forest, primero se comprueba si el árbol ya está en la caché. Si el árbol ya existe en la caché, se utiliza el árbol existente en lugar de crear uno nuevo. Esto minimiza el uso de memoria y mejora el rendimiento de la aplicación.

En resumen, el patrón Flyweight es útil para optimizar el uso de memoria y mejorar el rendimiento de aplicaciones que utilizan muchos objetos. En Dart, podemos implementar el patrón Flyweight utilizando una clase fábrica que almacena objetos en una caché y los reutiliza cuando sea necesario.
*/