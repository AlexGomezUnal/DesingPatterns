abstract class Mediator {
  void send(String message, Colleague colleague);
}

abstract class Colleague {
  Mediator? mediator;

  Colleague(this.mediator);

  void send(String message) {
    mediator?.send(message, this);
  }

  void receive(String message);
}

class ConcreteColleague1 extends Colleague {
  ConcreteColleague1(Mediator mediator) : super(mediator);

  @override
  void receive(String message) {
    print('ConcreteColleague1 received message: $message');
  }
}

class ConcreteColleague2 extends Colleague {
  ConcreteColleague2(Mediator mediator) : super(mediator);

  @override
  void receive(String message) {
    print('ConcreteColleague2 received message: $message');
  }
}

class ConcreteMediator implements Mediator {
  ConcreteColleague1? colleague1;
  ConcreteColleague2? colleague2;

  void setColleague1(ConcreteColleague1 colleague1) {
    this.colleague1 = colleague1;
  }

  void setColleague2(ConcreteColleague2 colleague2) {
    this.colleague2 = colleague2;
  }

  @override
  void send(String message, Colleague colleague) {
    if (colleague == colleague1) {
      colleague2?.receive(message);
    } else {
      colleague1?.receive(message);
    }
  }
}

void main() {
  final mediator = ConcreteMediator();
  final colleague1 = ConcreteColleague1(mediator);
  final colleague2 = ConcreteColleague2(mediator);

  mediator.setColleague1(colleague1);
  mediator.setColleague2(colleague2);

  colleague1.send('Hello, colleague2!');
  colleague2.send('Hi, colleague1!');
}
/*En este ejemplo, la clase Mediator define una interfaz para la comunicación entre objetos. La clase Colleague es una clase abstracta que define la interfaz para los objetos que se comunican entre sí a través del mediador.

La clase ConcreteColleague1 y ConcreteColleague2 son dos objetos que se comunican entre sí a través del mediador. La clase ConcreteMediator es el mediador que coordina la comunicación entre ellos.

En el método send de la clase ConcreteMediator, se comprueba qué objeto envía el mensaje y se llama al método receive correspondiente en el otro objeto. De esta manera, la comunicación entre objetos se realiza a través del mediador, en lugar de ser directa.
*/
