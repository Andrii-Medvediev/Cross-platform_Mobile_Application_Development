class Client {
  final String name;
  final int ticketNumber;

  Client(this.name, this.ticketNumber);

  @override
  String toString() => "[$ticketNumber] $name";
}

class RegularClient extends Client {
  RegularClient(String name, int ticketNumber) : super(name, ticketNumber);
}

class VIPClient extends Client {
  final int priorityLevel;
  VIPClient(String name, int ticketNumber, this.priorityLevel)
    : super(name, ticketNumber);

  @override
  String toString() => "[$ticketNumber] $name (VIP, Priority: $priorityLevel)";
}

class ClientQueue<T extends Client> {
  final List<T> _queue = [];
  final String department;

  ClientQueue._internal(this.department);

  factory ClientQueue(String department) => ClientQueue._internal(department);

  static int _ticketCounter = 1;
  static int generateTicket() => _ticketCounter++;

  void addClient(T client) {
    _queue.add(client);
    print("Додано клієнта у відділ '$department': $client");
  }

  void serveNext() {
    if (_queue.isEmpty) {
      print("Черга у відділі '$department' порожня");
      return;
    }
    final client = _queue.removeAt(0);
    print("Обслуговується клієнт у відділі '$department': $client");
  }

  void showQueue() {
    print("\nЧерга у відділі '$department':");
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
  // Створюємо черги окремо для кожного типу клієнтів
  final regularQueue = ClientQueue<RegularClient>("Каса");
  final vipQueue = ClientQueue<VIPClient>("VIP-зала");

  // Додаємо клієнтів
  regularQueue.addClient(RegularClient("Іван", ClientQueue.generateTicket()));
  regularQueue.addClient(RegularClient("Петро", ClientQueue.generateTicket()));
  vipQueue.addClient(VIPClient("Олена", ClientQueue.generateTicket(), 1));
  vipQueue.addClient(VIPClient("Марія", ClientQueue.generateTicket(), 2));

  // Показуємо черги
  regularQueue.showQueue();
  vipQueue.showQueue();

  print("\n--- Обслуговування ---");

  // Обслуговуємо клієнтів
  regularQueue.serveNext();
  vipQueue.serveNext();

  // Стан черг після обслуговування
  regularQueue.showQueue();
  vipQueue.showQueue();
}
