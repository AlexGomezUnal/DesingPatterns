//Supongamos que tenemos un juego de aventuras y queremos implementar diferentes estados del jugador según su salud. Para ello, creamos una clase abstracta llamada EstadoJugador que define los métodos necesarios que deben implementarse en cada estado. Luego, creamos diferentes subclases que representan los estados del jugador: Saludable, Herido y EnPeligro.

abstract class EstadoJugador {
  //interface
  void mover();
  void atacar();
}

class Saludable implements EstadoJugador {
  @override
  void mover() {
    print("El jugador se mueve rápido");
  }

  @override
  void atacar() {
    print("El jugador ataca con fuerza");
  }
}

class Herido implements EstadoJugador {
  @override
  void mover() {
    print("El jugador se mueve lentamente");
  }

  @override
  void atacar() {
    print("El jugador ataca débilmente");
  }
}

class EnPeligro implements EstadoJugador {
  @override
  void mover() {
    print("El jugador apenas puede moverse");
  }

  @override
  void atacar() {
    print("El jugador no puede atacar");
  }
}

//Luego, creamos una clase Jugador que tiene una instancia de EstadoJugador y que puede cambiar su estado según su salud:
class Jugador {
  late EstadoJugador _estado;

  void setEstado(EstadoJugador estado) {
    _estado = estado;
  }

  void mover() {
    _estado.mover();
  }

  void atacar() {
    _estado.atacar();
  }
}
//Finalmente, podemos usar la clase Jugador en nuestro juego y cambiar su estado según su salud:

void main() {
  Jugador jugador = Jugador();

  jugador.setEstado(Saludable());
  jugador.mover(); // El jugador se mueve rápido
  jugador.atacar(); // El jugador ataca con fuerza

  jugador.setEstado(Herido());
  jugador.mover(); // El jugador se mueve lentamente
  jugador.atacar(); // El jugador ataca débilmente

  jugador.setEstado(EnPeligro());
  jugador.mover(); // El jugador apenas puede moverse
  jugador.atacar(); // El jugador no puede atacar
}
//En este ejemplo, el patrón State nos permite definir diferentes comportamientos del jugador según su estado, sin tener que crear diferentes clases de jugador para cada estado.