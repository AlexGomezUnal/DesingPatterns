abstract class Animal {
  late String nombre;
  late int edad;
  Animal clone();
}

class Perro extends Animal {
  Perro({required String nombre, required int edad}) : super() {
    this.nombre = nombre;
    this.edad = edad;
  }

  @override
  Perro clone() {
    return Perro(nombre: this.nombre, edad: this.edad);
  }

  void ladrar() {
    print('Guau!');
  }
}

void main() {
  // Creamos un objeto original de Perro
  final perroOriginal = Perro(nombre: 'Fido', edad: 3);

  // Creamos una copia de perroOriginal
  final perroCopia = perroOriginal.clone();

  // Comprobamos que se han duplicado los valores
  print(perroCopia.nombre); // salida: 'Fido'
  print(perroCopia.edad); // salida: 3

  // Comprobamos que la copia tiene su propia identidad
  print(identical(perroOriginal, perroCopia)); // salida: false

  // Llamamos a un método del objeto copia
  perroCopia.ladrar(); // salida: 'Guau!'
}
