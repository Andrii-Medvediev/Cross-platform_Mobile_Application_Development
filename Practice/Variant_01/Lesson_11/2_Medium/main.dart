abstract class AbstractClient {
  String name;
  int ticketNumber;

  AbstractClient(this.name, this.ticketNumber);

  void displayInfo();
}

class RegularClient extends AbstractClient {
  RegularClient(String name, int ticketNumber) : super(name, ticketNumber);

  @override
  void displayInfo() {
    print("Ім'я: $name | Талон №: $ticketNumber");
  }
}

class VipClient extends AbstractClient {
  int priorityLevel;

  VipClient(String name, int ticketNumber, this.priorityLevel)
    : super(name, ticketNumber);

  @override
  void displayInfo() {
    print("Ім'я: $name | Талон №: $ticketNumber | Пріоритет: $priorityLevel");
  }
}

class ClientQueue<T extends AbstractClient> {
  final List<T> _queue = [];
  static int totalClients = 0;

  void addClient(T client) {
    _queue.add(client);
    totalClients++;
  }

  void showQueue() {
    for (var client in _queue) {
      client.displayInfo();
    }
  }
}

void main() {
  ClientQueue<RegularClient> regularQueue = ClientQueue<RegularClient>();
  ClientQueue<VipClient> vipQueue = ClientQueue<VipClient>();

  regularQueue.addClient(RegularClient("Іван", 101));
  regularQueue.addClient(RegularClient("Петро", 102));
  vipQueue.addClient(VipClient("Олена", 201, 1));

  print("=== Черга звичайних клієнтів ===");
  regularQueue.showQueue();

  print("\n=== Черга VIP клієнтів ===");
  vipQueue.showQueue();

  print("\nВсього клієнтів у всіх чергах: ${ClientQueue.totalClients}");
}
