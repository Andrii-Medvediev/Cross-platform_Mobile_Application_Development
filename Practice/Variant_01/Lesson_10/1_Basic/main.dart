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
    print("=== Клієнт ===");
    print("Ім'я: $name");
    print("Талон №: $ticketNumber");
    print("Мінімальний вік: $minAge\n");
  }
}

void main() {
  RegularClient client1 = RegularClient("Іван", 101);
  RegularClient client2 = RegularClient("Олена", 102);

  client1.displayInfo();
  client2.displayInfo();
}
