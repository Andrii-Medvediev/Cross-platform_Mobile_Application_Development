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
    print("Ім'я: $name, Вік: $age, Номер талону: $ticketNumber");
  }
}

void main() {
  Client client1 = Client.withTicket("Аліна", 28, 201);
  Client client2 = Client.withDefaultTicket("Богдан", 35);
  Client client3 = Client.withDefaultTicket("Катерина", 22);

  client3
    ..age = 23
    ..ticketNumber = 205;

  client1.displayInfo();
  client2.displayInfo();
  client3.displayInfo();
}
