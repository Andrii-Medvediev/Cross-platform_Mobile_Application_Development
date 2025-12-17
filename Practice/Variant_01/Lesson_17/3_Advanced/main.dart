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
    print("Regular Client: $name | Ticket: $ticketNumber");
  }
}

class VIPClient extends AbstractClient {
  int priorityLevel;

  VIPClient(String name, int ticketNumber, this.priorityLevel)
    : super(name, ticketNumber);

  @override
  void displayInfo() {
    print(
      "VIP Client: $name | Ticket: $ticketNumber | Priority: $priorityLevel",
    );
  }
}

class ClientQueue<T extends AbstractClient> {
  static int totalClients = 0;
  final List<T> _queue = [];

  void addClient(T client) {
    _queue.add(client);
    totalClients++;
  }

  void serveClient() {
    if (_queue.isEmpty) {
      print("Queue is empty!");
      return;
    }

    T clientToServe;

    // Для VIPClient обслуговуємо за пріоритетом
    if (_queue.first is VIPClient) {
      _queue.sort((a, b) {
        if (a is VIPClient && b is VIPClient) {
          return a.priorityLevel.compareTo(b.priorityLevel);
        }
        return 0;
      });
    }

    clientToServe = _queue.removeAt(0);
    print("Serving client:");
    clientToServe.displayInfo();
    totalClients--;
  }

  void showQueue() {
    if (_queue.isEmpty) {
      print("Queue is empty!");
      return;
    }
    print("Current Queue:");
    for (var client in _queue) {
      client.displayInfo();
    }
  }

  static void showTotalClients() {
    print("Total clients in all queues: $totalClients");
  }
}

void main() {
  var regularQueue = ClientQueue<RegularClient>();
  var vipQueue = ClientQueue<VIPClient>();

  regularQueue.addClient(RegularClient("Alice", 101));
  regularQueue.addClient(RegularClient("Bob", 102));
  vipQueue.addClient(VIPClient("Charlie", 201, 2));
  vipQueue.addClient(VIPClient("Diana", 202, 1));

  print("=== Initial Queues ===");
  print("Regular Queue:");
  regularQueue.showQueue();
  print("\nVIP Queue:");
  vipQueue.showQueue();
  ClientQueue.showTotalClients();

  print("\n=== Serving Clients ===");
  vipQueue.serveClient();
  regularQueue.serveClient();
  vipQueue.serveClient();
  regularQueue.serveClient();

  print("\n=== Final Queues ===");
  print("Regular Queue:");
  regularQueue.showQueue();
  print("\nVIP Queue:");
  vipQueue.showQueue();
  ClientQueue.showTotalClients();
}
