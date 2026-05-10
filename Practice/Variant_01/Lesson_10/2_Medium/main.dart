abstract class ClientInterface {
  String name = "";
  int ticketNumber = 0;

  void displayInfo();
}

abstract class Client implements ClientInterface {
  @override
  void displayInfo();
}

class RegularClient extends Client {
  @override
  String name;

  @override
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

class VipClient extends Client {
  @override
  String name;

  @override
  int ticketNumber;

  int priorityLevel;

  VipClient(this.name, this.ticketNumber, this.priorityLevel);

  @override
  void displayInfo() {
    print("=== VIP Клієнт ===");
    print("Ім'я: $name");
    print("Талон №: $ticketNumber");
    print("Пріоритет: $priorityLevel\n");
  }
}

void main() {
  List<ClientInterface> queue = [
    RegularClient("Іван", 101),
    VipClient("Олена", 201, 1),
    RegularClient("Петро", 102),
    VipClient("Марія", 202, 2),
  ];

  for (var client in queue) {
    client.displayInfo();
  }
}
