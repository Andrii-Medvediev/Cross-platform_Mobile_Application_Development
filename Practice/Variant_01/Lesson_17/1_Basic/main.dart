class RegularClient {
  String name;
  int ticketNumber;

  RegularClient(this.name, this.ticketNumber);

  String toString() => "Client: $name, Ticket: $ticketNumber";
}

class VIPClient {
  String name;
  int ticketNumber;
  int priorityLevel;

  VIPClient(this.name, this.ticketNumber, this.priorityLevel);

  String toString() =>
      "VIP Client: $name, Ticket: $ticketNumber, Priority: $priorityLevel";
}

class ClientQueue<T> {
  static int totalClients = 0;
  List<T> _queue = [];

  void addClient(T client) {
    _queue.add(client);
    totalClients++;
  }

  void showQueue() {
    for (var client in _queue) {
      print(client);
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

  print("\nTotal clients in all queues: ${ClientQueue.totalClients}");
}
