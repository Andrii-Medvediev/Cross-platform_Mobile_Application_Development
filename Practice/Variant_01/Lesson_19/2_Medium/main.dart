class Client {
  final String name;
  final int ticketNumber;

  Client(this.name, this.ticketNumber);

  @override
  String toString() => "[$ticketNumber] $name";
}

class RegularClient extends Client {
  RegularClient(String name, int ticketNumber) : super(name, ticketNumber);

  bool operator >(Client other) =>
      other is VIPClient ? false : ticketNumber > other.ticketNumber;

  bool operator <(Client other) =>
      other is VIPClient ? true : ticketNumber < other.ticketNumber;
}

class VIPClient extends Client {
  final int priorityLevel;

  VIPClient(String name, int ticketNumber, this.priorityLevel)
    : super(name, ticketNumber);

  @override
  String toString() => "[$ticketNumber] $name (VIP, Priority: $priorityLevel)";

  bool operator >(Client other) => true; // VIP завжди більше за звичайного
  bool operator <(Client other) =>
      other is VIPClient && ticketNumber < other.ticketNumber;
}

class ClientQueue {
  static int _ticketCounter = 1;
  final List<Client> _queue = [];

  static int generateTicket() => _ticketCounter++;

  void addClient(Client client) {
    _queue.add(client);
    print("Додано клієнта: $client");
    _queue.sort((a, b) {
      if (a is VIPClient && b is RegularClient) return -1;
      if (a is RegularClient && b is VIPClient) return 1;
      return a.ticketNumber.compareTo(b.ticketNumber);
    });
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

  queue.addClient(RegularClient("Іван", ClientQueue.generateTicket()));
  queue.addClient(VIPClient("Олена", ClientQueue.generateTicket(), 1));
  queue.addClient(RegularClient("Петро", ClientQueue.generateTicket()));
  queue.addClient(VIPClient("Марія", ClientQueue.generateTicket(), 2));

  queue.showQueue();

  print("\nОбслуговування клієнтів:");
  queue.serveNext();
  queue.serveNext();

  queue.showQueue();
}
