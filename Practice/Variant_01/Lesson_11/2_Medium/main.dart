class Client {
  String name = "";
  int age = 0;
  int ticketNumber = 0;

  static int _ticketCounter = 100;

  Client.withTicket(this.name, this.age, this.ticketNumber);

  Client.withDefaultTicket(this.name, this.age) {
    ticketNumber = _ticketCounter++;
  }

  void displayInfo() {
    print("Name: $name, Age: $age, Ticket Number: $ticketNumber");
  }
}

void main() {
  Client client1 = Client.withTicket("Alice", 28, 201);
  Client client2 = Client.withDefaultTicket("Bob", 35);
  Client client3 = Client.withDefaultTicket("Kate", 22);

  client3
    ..age = 23
    ..ticketNumber = 205;

  client1.displayInfo();
  client2.displayInfo();
  client3.displayInfo();
}
