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
  static const int maxQueueSize = 5;

  void addClient(T client) {
    if (_queue.length >= maxQueueSize) {
      print("Черга переповнена. Клієнт ${client.name} не може приєднатися.");
      return;
    }
    _queue.add(client);
    totalClients++;
  }

  void serveClient() {
    if (_queue.isEmpty) {
      print("Черга порожня.");
      return;
    }

    T clientToServe;

    if (_queue.first is VipClient) {
      _queue.sort((a, b) {
        return (a as VipClient).priorityLevel.compareTo(
          (b as VipClient).priorityLevel,
        );
      });
      clientToServe = _queue.removeAt(0);
      print(
        "Обслуговується VIP клієнт: ${clientToServe.name} (пріоритет: ${(clientToServe as VipClient).priorityLevel})",
      );
    } else {
      clientToServe = _queue.removeAt(0);
      print("Обслуговується клієнт: ${clientToServe.name}");
    }

    totalClients--;
  }

  void showQueue() {
    if (_queue.isEmpty) {
      print("Черга порожня.");
      return;
    }
    for (var client in _queue) {
      client.displayInfo();
    }
  }

  static void showTotalClients() {
    print("Всього клієнтів у чергах: $totalClients");
  }
}

void main() {
  ClientQueue<VipClient> vipQueue = ClientQueue<VipClient>();
  ClientQueue<RegularClient> regularQueue = ClientQueue<RegularClient>();

  vipQueue.addClient(VipClient("Олена", 201, 2));
  vipQueue.addClient(VipClient("Марія", 202, 1));
  regularQueue.addClient(RegularClient("Іван", 101));
  regularQueue.addClient(RegularClient("Петро", 102));

  print("=== Початковий стан черг ===\n");
  print("VIP черга:");
  vipQueue.showQueue();
  print("\nЗвичайна черга:");
  regularQueue.showQueue();

  print("\n=== Обслуговування ===");
  vipQueue.serveClient();
  regularQueue.serveClient();

  print("\n=== Підсумковий стан ===");
  ClientQueue.showTotalClients();
}
