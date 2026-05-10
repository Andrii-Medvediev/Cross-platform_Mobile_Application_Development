class Service {
  final String name;
  final int duration;

  const Service(this.name, this.duration);

  void display() {
    print("Послуга: $name, тривалість: $duration хв.");
  }
}

class Employee {
  String name;
  String position;

  Employee(this.name, this.position);

  void display() {
    print("Співробітник: $name, посада: $position");
  }
}

class Client {
  String name;
  int ticketNumber;
  final int minAge = 18;
  Service? service;
  Employee? assignedEmployee;

  Client(this.name, this.ticketNumber, {this.service, this.assignedEmployee});

  void display() {
    print(
      "Клієнт: $name | Талон №: $ticketNumber | "
      "Послуга: ${service?.name} (${service?.duration} хв) | "
      "Співробітник: ${assignedEmployee?.name}",
    );
  }
}

void main() {
  const Service haircut = Service("Стрижка", 30);
  const Service manicure = Service("Манікюр", 45);
  const Service haircut2 = Service("Стрижка", 30);

  print(
    "стрижка і стрижка2 — однаковий об'єкт? ${identical(haircut, haircut2)}\n",
  );

  Employee mykola = Employee("Микола", "Консультант");
  Employee maria = Employee("Марія", "Супервайзер");

  Client client1 = Client(
    "Іван",
    101,
    service: haircut,
    assignedEmployee: mykola,
  );
  Client client2 = Client(
    "Олена",
    102,
    service: manicure,
    assignedEmployee: maria,
  );

  client1.display();
  client2.display();
}
