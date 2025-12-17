enum ServiceType { Regular, Priority, VIP }

class Client {
  final String name;
  final int ticketNumber;
  final ServiceType serviceType;

  Client(this.name, this.ticketNumber, this.serviceType);

  @override
  String toString() =>
      "[$ticketNumber] $name (${serviceType.toString().split('.').last})";
}

class ClientQueue {
  static int _ticketCounter = 1;
  final List<Client> _queue = [];
  final List<Client> _history = [];

  static int generateTicket() => _ticketCounter++;

  void addClient(Client client) {
    _queue.add(client);
    _queue.sort((a, b) => b.serviceType.index - a.serviceType.index);
    print("Додано клієнта: $client");
  }

  void serveNext() {
    if (_queue.isEmpty) {
      print("Черга порожня");
      return;
    }
    final client = _queue.removeAt(0);
    _history.add(client);
    print("Обслуговується клієнт: $client");
  }

  void showQueue() {
    print("\nПоточна черга:");
    if (_queue.isEmpty) {
      print("— немає клієнтів —");
      return;
    }
    for (var client in _queue) {
      print(client);
    }
  }

  void showHistory([int last = 5]) {
    print("\nІсторія обслуговування (останні $last):");
    if (_history.isEmpty) {
      print("— ще не обслуговано клієнтів —");
      return;
    }
    final start = _history.length - last;
    for (var i = start < 0 ? 0 : start; i < _history.length; i++) {
      print(_history[i]);
    }
  }
}

void main() {
  final queue = ClientQueue();

  queue.addClient(
    Client("Іван", ClientQueue.generateTicket(), ServiceType.Regular),
  );
  queue.addClient(
    Client("Олена", ClientQueue.generateTicket(), ServiceType.VIP),
  );
  queue.addClient(
    Client("Петро", ClientQueue.generateTicket(), ServiceType.Priority),
  );
  queue.addClient(
    Client("Марія", ClientQueue.generateTicket(), ServiceType.VIP),
  );
  queue.addClient(
    Client("Сергій", ClientQueue.generateTicket(), ServiceType.Regular),
  );

  queue.showQueue();

  queue.serveNext();
  queue.serveNext();
  queue.serveNext();

  queue.showQueue();
  queue.showHistory();
}
