mixin QueueActions {
  void joinQueue() {
    print("Приєднався до черги");
  }

  void leaveQueue() {
    print("Покинув чергу");
  }
}

abstract class ClientInterface {
  String get name;
  int get ticketNumber;

  void display();
}

class Client with QueueActions implements ClientInterface {
  @override
  final String name;

  @override
  final int ticketNumber;

  Client(this.name, this.ticketNumber);

  @override
  void display() {
    print("=== Клієнт №$ticketNumber ===");
    print("Ім'я: $name");
  }
}

void main() {
  List<Client> clients = [
    Client("Bob", 1),
    Client("Alice", 2),
    Client("Tom", 3),
  ];

  for (var client in clients) {
    client.display();
    client.joinQueue();
    client.leaveQueue();
    print("");
  }
}
