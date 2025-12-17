abstract class Client {
  String name;
  int ticketNumber;

  Client(this.name, this.ticketNumber);

  void displayInfo();
}

class RegularClient extends Client {
  final int minAge = 18;

  RegularClient(String name, int ticketNumber) : super(name, ticketNumber);

  @override
  void displayInfo() {
    print("=== Regular Client ===");
    print("Name: $name");
    print("Ticket Number: $ticketNumber");
    print("Minimum Age: $minAge\n");
  }
}

class VIPClient extends Client {
  int priorityLevel;

  VIPClient(String name, int ticketNumber, this.priorityLevel)
    : super(name, ticketNumber);

  @override
  void displayInfo() {
    print("=== VIP Client ===");
    print("Name: $name");
    print("Ticket Number: $ticketNumber");
    print("Priority Level: $priorityLevel\n");
  }
}

void main() {
  List<Client> queue = [
    RegularClient("Alice", 101),
    VIPClient("Charlie", 201, 2),
    RegularClient("Bob", 102),
    VIPClient("Diana", 202, 1),
    VIPClient("Eve", 203, 3),
  ];

  queue.sort((a, b) {
    if (a is VIPClient && b is VIPClient) {
      return a.priorityLevel.compareTo(b.priorityLevel);
    } else if (a is VIPClient) {
      return -1;
    } else if (b is VIPClient) {
      return 1;
    } else {
      return a.ticketNumber.compareTo(b.ticketNumber);
    }
  });

  print("===== Sorted Queue =====\n");
  for (var client in queue) {
    client.displayInfo();
  }
}
