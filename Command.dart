/* 
El patrón Command en Dart 
se utiliza para encapsular 
una solicitud como un objeto 
y así poder invocar diferentes 
solicitudes sin conocer los detalles de su 
implementación. 
Esto permite que el código sea más 
flexible y extensible, 
ya que las solicitudes pueden ser 
intercambiadas o extendidas sin afectar 
al resto del código.
*/
// Interfaz para todos los comandos
abstract class Command {
  void execute();
}

// Clase concreta de comando que realiza una acción específica
class PrintCommand implements Command {
  late String _message;

  PrintCommand(String message) {
    _message = message;
  }

  @override
  void execute() {
    print(_message);
  }
}

// Clase invocadora que ejecuta comandos
class Invoker {
  Command? _command;

  void setCommand(Command command) {
    _command = command;
  }

  void executeCommand() {
    _command?.execute();
  }
}

// Ejemplo de uso
void main() {
  // Crear algunos comandos
  Command printHello = PrintCommand('Hello');
  Command printWorld = PrintCommand('World');

  // Crear el invocador
  Invoker invoker = Invoker();

  // Asignar el comando y ejecutarlo
  invoker.setCommand(printHello);
  invoker.executeCommand();

  // Asignar otro comando y ejecutarlo
  invoker.setCommand(printWorld);
  invoker.executeCommand();
}
