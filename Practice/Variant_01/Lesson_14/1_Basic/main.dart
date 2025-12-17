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

void main() {
  RegularClient client1 = RegularClient("Alice", 101);
  RegularClient client2 = RegularClient("Bob", 102);

  client1.displayInfo();
  client2.displayInfo();
}
