abstract class ClientInterface {
  String name = "";
  int ticketNumber = 0;

  void display();
}

class Client implements ClientInterface {
  @override
  String name;

  @override
  int ticketNumber;

  Client(this.name, this.ticketNumber);

  @override
  void display() {
    print("========== Client Info ==========");
    print("Name: $name");
    print("Ticket Number: $ticketNumber\n");
  }
}

void main() {
  Client client1 = Client("Alice", 101);
  Client client2 = Client("Bob", 102);

  client1.display();
  client2.display();
}
