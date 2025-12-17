class Client {
  final String name;
  final int ticketNumber;

  Client(this.name, this.ticketNumber);

  @override
  bool operator ==(Object other) =>
      other is Client && other.ticketNumber == ticketNumber;

  bool operator >(Client other) => ticketNumber > other.ticketNumber;
  bool operator <(Client other) => ticketNumber < other.ticketNumber;

  @override
  String toString() => "[$ticketNumber] $name";
}

class ClientQueue {
  static int _ticketCounter = 1;
  final List<Client> _queue = [];

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

  final client1 = Client("Іван", ClientQueue.generateTicket());
  final client2 = Client("Олена", ClientQueue.generateTicket());
  final client3 = Client("Петро", ClientQueue.generateTicket());

  queue.addClient(client1);
  queue.addClient(client2);
  queue.addClient(client3);

  queue.showQueue();

  print("\nПорівняння клієнтів:");
  print("${client1.name} > ${client2.name}: ${client1 > client2}");
  print("${client1.name} < ${client3.name}: ${client1 < client3}");

  queue.serveNext();
  queue.showQueue();
}
