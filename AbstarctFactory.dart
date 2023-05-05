abstract class Animal {}

class Perro implements Animal {
  String nombre;

  Perro(this.nombre);

  @override
  String toString() {
    return 'Perro: $nombre';
  }
}

class Gato implements Animal {
  String nombre;

  Gato(this.nombre);

  @override
  String toString() {
    return 'Gato: $nombre';
  }
}

abstract class FabricaAnimales {
  Animal crearAnimal(String nombre);
}

class FabricaPerros implements FabricaAnimales {
  @override
  Perro crearAnimal(String nombre) {
    return Perro(nombre);
  }
}

class FabricaGatos implements FabricaAnimales {
  @override
  Gato crearAnimal(String nombre) {
    return Gato(nombre);
  }
}

void main() {
  // Creamos una fábrica de perros
  final fabricaPerros = FabricaPerros();

  // Creamos un perro usando la fábrica de perros
  final perro = fabricaPerros.crearAnimal('Fido');

  // Comprobamos que se ha creado un objeto de tipo Perro
  print(perro); // salida: 'Perro: Fido'

  // Creamos una fábrica de gatos
  final fabricaGatos = FabricaGatos();

  // Creamos un gato usando la fábrica de gatos
  final gato = fabricaGatos.crearAnimal('Mittens');

  // Comprobamos que se ha creado un objeto de tipo Gato
  print(gato); // salida: 'Gato: Mittens'
}
