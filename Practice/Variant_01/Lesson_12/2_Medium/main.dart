class Client {
  final String name;
  final int ticketNumber;
  final String serviceType;

  const Client(this.name, this.ticketNumber, this.serviceType);

  void display() {
    print("Клієнт: $name\nТалон №: $ticketNumber\nТип послуги: $serviceType\n");
  }
}

void main() {
  const client1 = Client("Tom", 101, "Оплата рахунку");
  const client2 = Client("Alice", 102, "Консультація");
  const client3 = Client("Bob", 103, "Видача документа");

  client1.display();
  client2.display();
  client3.display();

  print("client1 і client2 однакові об’єкти? ${identical(client1, client2)}");
  const client4 = Client("Tom", 101, "Оплата рахунку");
  print("client1 і client4 однакові об’єкти? ${identical(client1, client4)}");
}
