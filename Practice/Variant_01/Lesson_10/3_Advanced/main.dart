mixin QueueActions {
  String get name;

  void joinQueue() {
    print("$name приєднався до черги");
  }

  void leaveQueue() {
    print("$name залишив чергу\n");
  }
}

abstract class ClientInterface {
  String get name;
  int get ticketNumber;

  void displayInfo();
}

abstract class Client with QueueActions implements ClientInterface {
  @override
  void displayInfo();
}

class RegularClient extends Client {
  @override
  final String name;

  @override
  final int ticketNumber;

  final int minAge = 18;

  RegularClient(this.name, this.ticketNumber);

  @override
  void displayInfo() {
    print("=== Клієнт ===");
    print("Ім'я: $name");
    print("Талон №: $ticketNumber");
    print("Мінімальний вік: $minAge");
  }
}

class VipClient extends Client {
  @override
  final String name;

  @override
  final int ticketNumber;

  final int priorityLevel;

  VipClient(this.name, this.ticketNumber, this.priorityLevel);

  @override
  void displayInfo() {
    print("=== VIP Клієнт ===");
    print("Ім'я: $name");
    print("Талон №: $ticketNumber");
    print("Пріоритет: $priorityLevel");
  }
}

void main() {
  List<Client> queue = [
    RegularClient("Іван", 101),
    VipClient("Олена", 201, 2),
    RegularClient("Петро", 102),
    VipClient("Марія", 202, 1),
    VipClient("Андрій", 203, 3),
  ];

  queue.sort((a, b) {
    if (a is VipClient && b is VipClient) {
      return a.priorityLevel.compareTo(b.priorityLevel);
    } else if (a is VipClient) {
      return -1;
    } else if (b is VipClient) {
      return 1;
    } else {
      return a.ticketNumber.compareTo(b.ticketNumber);
    }
  });

  print("===== Черга обслуговування =====\n");
  for (var client in queue) {
    client.joinQueue();
    client.displayInfo();
    client.leaveQueue();
  }
}
