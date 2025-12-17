class Client {
  final String name;
  final int ticketNumber;

  Client(this.name, this.ticketNumber);

  @override
  String toString() => "[$ticketNumber] $name";
}

class ClientQueue {
  static ClientQueue? _instance;
  static int _ticketCounter = 1;

  final List<Client> _queue = [];

  ClientQueue._internal();

  factory ClientQueue() {
    _instance ??= ClientQueue._internal();
    return _instance!;
  }

  static int generateTicket() => _ticketCounter++;

  void addClient(Client client) {
    _queue.add(client);
    print("Додано клієнта: $client");
  }

  void serveNext() {
    if (_queue.isEmpty) {
      print("Черга порожня");
      return;
    }
    final client = _queue.removeAt(0);
    print("Обслуговується клієнт: $client");
  }

  void showQueue() {
    print("\nПоточна черга:");
    if (_queue.isEmpty) {
      print("— немає клієнтів —");
    } else {
      for (var client in _queue) {
        print(client);
      }
    }
  }
}

void main() {
  final queue = ClientQueue();

  queue.addClient(Client("Іван", ClientQueue.generateTicket()));
  queue.addClient(Client("Олена", ClientQueue.generateTicket()));
  queue.addClient(Client("Петро", ClientQueue.generateTicket()));

  queue.showQueue();
  queue.serveNext();
  queue.showQueue();
}
