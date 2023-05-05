abstract class Forma {
  //abstraction
  void dibujar();
}

abstract class Dibujante {
  //interface
  void dibujarCirculo(double x, double y, double radio);
  void dibujarRectangulo(double x1, double y1, double x2, double y2);
}

class Circulo extends Forma {
  final Dibujante dibujante;
  double x;
  double y;
  double radio;

  Circulo(this.dibujante, this.x, this.y, this.radio);

  @override
  void dibujar() {
    dibujante.dibujarCirculo(x, y, radio);
  }
}

class Rectangulo extends Forma {
  final Dibujante dibujante;
  double x1;
  double y1;
  double x2;
  double y2;

  Rectangulo(this.dibujante, this.x1, this.y1, this.x2, this.y2);

  @override
  void dibujar() {
    dibujante.dibujarRectangulo(x1, y1, x2, y2);
  }
}

class DibujanteConcreto implements Dibujante {
  //implemntacion de la abstraccion
  @override
  void dibujarCirculo(double x, double y, double radio) {
    print('Dibujando un círculo en ($x, $y) con radio $radio');
  }

  @override
  void dibujarRectangulo(double x1, double y1, double x2, double y2) {
    print('Dibujando un rectángulo de ($x1, $y1) a ($x2, $y2)');
  }
}

void main() {
  final dibujante = DibujanteConcreto();
  final forma = Circulo(dibujante, 10, 10, 5);
  forma.dibujar();
}
