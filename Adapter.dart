// La interfaz actual de la clase que queremos adaptar
class Motor {
  void acelerar() {
    print('El motor está acelerando.');
  }
}

// La interfaz objetivo que esperan los clientes
abstract class Vehiculo {
  void mover();
}

// El adaptador que convierte la interfaz del motor a la interfaz del vehículo
class AdaptadorMotorAVehiculo implements Vehiculo {
  final Motor _motor;

  AdaptadorMotorAVehiculo(this._motor);

  @override
  void mover() {
    _motor.acelerar();
  }
}

// El cliente que espera una instancia de la interfaz del vehículo
class Conductor {
  void conducir(Vehiculo vehiculo) {
    vehiculo.mover();
  }
}

void main() {
  // Creamos una instancia de Motor
  final motor = Motor();

  // Creamos un adaptador que convierte la interfaz del motor a la interfaz del vehículo
  final adaptador = AdaptadorMotorAVehiculo(motor);

  // Creamos una instancia de Conductor
  final conductor = Conductor();

  // El conductor usa el vehículo sin saber que en realidad es un motor adaptado
  conductor.conducir(adaptador); // salida: 'El motor está acelerando.'
}
