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
    print("Client: $name, Ticket: $ticketNumber");
  }
}

class VIPClient extends AbstractClient {
  int priorityLevel;

  VIPClient(String name, int ticketNumber, this.priorityLevel)
    : super(name, ticketNumber);

  @override
  void displayInfo() {
    print("VIP Client: $name, Ticket: $ticketNumber, Priority: $priorityLevel");
  }
}

class ClientQueue<T extends AbstractClient> {
  List<T> _queue = [];

  void addClient(T client) => _queue.add(client);

  void showQueue() {
    for (var client in _queue) {
      client.displayInfo();
    }
  }
}

void main() {
  var regularQueue = ClientQueue<RegularClient>();
  regularQueue.addClient(RegularClient("Alice", 101));
  regularQueue.addClient(RegularClient("Bob", 102));

  var vipQueue = ClientQueue<VIPClient>();
  vipQueue.addClient(VIPClient("Charlie", 201, 1));
  vipQueue.addClient(VIPClient("Diana", 202, 2));

  print("=== Regular Clients Queue ===");
  regularQueue.showQueue();
  print("\n===== VIP Clients Queue =====");
  vipQueue.showQueue();
}
