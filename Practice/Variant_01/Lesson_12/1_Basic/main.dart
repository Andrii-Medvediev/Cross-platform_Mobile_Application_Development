class Client {
  String name;
  int ticketNumber;
  final int minAge = 18; // константа

  Client(this.name, this.ticketNumber);

  void display() {
    print("Клієнт: $name\nТалон №: $ticketNumber\nМінімальний вік: $minAge\n");
  }
}

void main() {
  Client client1 = Client("Tom", 101);
  Client client2 = Client("Alice", 102);

  client1.display();
  client2.display();
}
