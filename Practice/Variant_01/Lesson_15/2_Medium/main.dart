abstract class ClientInterface {
  String name = "";
  int ticketNumber = 0;

  void display();
}

mixin QueueActions {
  void joinQueue() {
    print("Client joined the queue.");
  }

  void leaveQueue() {
    print("Client left the queue.");
  }
}

class Client with QueueActions implements ClientInterface {
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
  Client client = Client("Charlie", 201);
  client.display();
  client.joinQueue();
  client.leaveQueue();
}
