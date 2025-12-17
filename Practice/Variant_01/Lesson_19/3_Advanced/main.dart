class Client {
  final String name;
  final int ticketNumber;

  Client(this.name, this.ticketNumber);

  bool operator >(Client other) => false; // Базовий клієнт завжди нижче VIP
  bool operator <(Client other) => false;

  @override
  String toString() => "[$ticketNumber] $name";
}

class RegularClient extends Client {
  RegularClient(String name, int ticketNumber) : super(name, ticketNumber);

  @override
  bool operator >(Client other) {
    if (other is VIPClient) return false;
    return ticketNumber < other.ticketNumber;
  }

  @override
  bool operator <(Client other) {
    if (other is VIPClient) return true;
    return ticketNumber > other.ticketNumber;
  }
}

class VIPClient extends Client {
  final int priorityLevel;

  VIPClient(String name, int ticketNumber, this.priorityLevel)
    : super(name, ticketNumber);

  @override
  bool operator >(Client other) {
    if (other is VIPClient) return priorityLevel > other.priorityLevel;
    return true; // VIP завжди вище звичайних
  }

  @override
  bool operator <(Client other) {
    if (other is VIPClient) return priorityLevel < other.priorityLevel;
    return false;
  }

  @override
  String toString() => "[$ticketNumber] $name (VIP, Priority: $priorityLevel)";
}

class ClientQueue<T extends Client> {
  static int _ticketCounter = 1;
  final List<T> _queue = [];

  static int generateTicket() => _ticketCounter++;

  void addClient(T client) {
    _queue.add(client);
    _queue.sort((a, b) => b > a ? 1 : -1); // сортування по пріоритету
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

  void removeClient(T client) {
    if (_queue.remove(client)) {
      print("Клієнт видалений: $client");
    } else {
      print("Клієнт не знайдений: $client");
    }
  }

  void promoteClientToVIP(RegularClient client, int priorityLevel) {
    if (_queue.remove(client)) {
      final vipClient =
          VIPClient(client.name, client.ticketNumber, priorityLevel) as T;
      addClient(vipClient);
      print(
        "Клієнт ${client.name} підвищений до VIP з пріоритетом $priorityLevel",
      );
    } else {
      print("Клієнт не знайдений для підвищення: ${client.name}");
    }
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
  final queue = ClientQueue<Client>();

  final r1 = RegularClient("Іван", ClientQueue.generateTicket());
  final r2 = RegularClient("Петро", ClientQueue.generateTicket());
  final v1 = VIPClient("Олена", ClientQueue.generateTicket(), 2);
  final v2 = VIPClient("Марія", ClientQueue.generateTicket(), 1);

  queue.addClient(r1);
  queue.addClient(v1);
  queue.addClient(r2);
  queue.addClient(v2);

  queue.showQueue();

  queue.serveNext();
  queue.serveNext();

  queue.promoteClientToVIP(r2, 3);

  queue.showQueue();

  queue.removeClient(v1);

  queue.showQueue();
}
