class Client {
  String name;
  int ticketNumber;
  final int minAge = 18;

  Client(this.name, this.ticketNumber);

  void display() {
    print("Клієнт: $name");
    print("Талон №: $ticketNumber");
    print("Мінімальний вік: $minAge\n");
  }
}

class VipClient extends Client {
  String priority = "VIP";

  VipClient(String name, int ticketNumber) : super(name, ticketNumber);

  @override
  void display() {
    super.display();
    print("Пріоритет: $priority\n");
  }
}

void main() {
  Client client1 = Client("Іван", 101);
  Client client2 = Client("Олена", 102);
  VipClient vip = VipClient("Петро", 103);

  client1.display();
  client2.display();
  vip.display();
}
