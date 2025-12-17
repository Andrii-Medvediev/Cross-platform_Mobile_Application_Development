abstract class Client {
  void displayInfo();
}

class RegularClient extends Client {
  String name;
  int ticketNumber;
  final int minAge = 18;

  RegularClient(this.name, this.ticketNumber);

  @override
  void displayInfo() {
    print("=== Regular Client ===");
    print("Name: $name");
    print("Ticket Number: $ticketNumber");
    print("Minimum Age: $minAge\n");
  }
}

class VIPClient extends Client {
  String name;
  int ticketNumber;
  int priorityLevel;

  VIPClient(this.name, this.ticketNumber, this.priorityLevel);

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
    VIPClient("Charlie", 201, 1),
    RegularClient("Bob", 102),
    VIPClient("Diana", 202, 2),
  ];

  for (var client in queue) {
    client.displayInfo();
  }
}
