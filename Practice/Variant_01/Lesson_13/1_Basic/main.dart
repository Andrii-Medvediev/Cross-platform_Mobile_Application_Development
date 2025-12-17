class Client {
  String name;
  int ticketNumber;
  String priority;

  Client(this.name, this.ticketNumber, {this.priority = "Regular"});

  void display() {
    print("Ticket #$ticketNumber: $name ($priority)");
  }
}

class VipClient extends Client {
  VipClient(String name, int ticketNumber)
    : super(name, ticketNumber, priority: "VIP");
}

void main() {
  Client client1 = Client("Alice", 101);
  Client client2 = Client("Bob", 102);
  VipClient vip = VipClient("Charlie", 103);

  client1.display();
  client2.display();
  vip.display();
}
