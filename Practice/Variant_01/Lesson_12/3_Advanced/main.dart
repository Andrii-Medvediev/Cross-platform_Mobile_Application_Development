class Service {
  final String name;
  final int duration;

  const Service(this.name, this.duration);

  void display() {
    print("Послуга: $name, тривалість: $duration хв.");
  }
}

class Client {
  String name;
  final int ticketNumber;
  Service service;

  Client(this.name, this.ticketNumber, this.service);

  void display() {
    print(
      "Клієнт: $name\n  Талон №: $ticketNumber\n  Послуга: ${service.name}\n  Тривалість: ${service.duration} хв.",
    );
  }
}

void main() {
  const Service haircut = Service("Стрижка", 30);
  const Service manicure = Service("Манікюр", 45);

  const Service haircut2 = Service("Стрижка", 30);
  print(
    "haircut і haircut2 - однаковий об'єкт у пам'яті? ${identical(haircut, haircut2)}\n",
  );

  Client client1 = Client("Tom", 1, haircut);
  Client client2 = Client("Alice", 2, manicure);
  Client client3 = Client("Bob", 3, haircut);

  print("=== Список послуг ===");
  haircut.display();
  manicure.display();

  print("\n=== Список клієнтів ===");
  client1.display();
  client2.display();
  client3.display();
}
