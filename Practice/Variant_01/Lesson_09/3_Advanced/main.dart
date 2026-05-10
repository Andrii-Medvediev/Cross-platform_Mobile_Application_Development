class Service {
  final String name;
  final int duration;

  const Service(this.name, this.duration);
}

class Employee {
  String name;
  String position;

  Employee(this.name, this.position);
}

class Client {
  String name;
  int ticketNumber;
  String priority;
  Employee? assignedEmployee;

  Client(this.name, this.ticketNumber, this.priority);

  void display() {
    print(
      "Талон #$ticketNumber: $name ($priority) — "
      "Призначено: ${assignedEmployee?.name} (${assignedEmployee?.position})",
    );
  }
}

class VipClient extends Client {
  VipClient(String name, int ticketNumber) : super(name, ticketNumber, "VIP");

  @override
  void display() {
    super.display();
  }
}

class RegularClient extends Client {
  RegularClient(String name, int ticketNumber)
    : super(name, ticketNumber, "Звичайний");

  @override
  void display() {
    super.display();
  }
}

class QueueManager {
  List<Client> clients = [];

  final Employee consultant = Employee("Микола", "Консультант");
  final Employee supervisor = Employee("Марія", "Супервайзер");

  void addClient(Client client) {
    clients.add(client);
    assignEmployee(client);
  }

  void assignEmployee(Client client) {
    if (client.priority == "VIP") {
      client.assignedEmployee = supervisor;
    } else {
      client.assignedEmployee = consultant;
    }
  }

  void displayQueue() {
    for (var client in clients) {
      client.display();
    }
  }
}

void main() {
  QueueManager queue = QueueManager();

  queue.addClient(RegularClient("Іван", 101));
  queue.addClient(VipClient("Олена", 102));
  queue.addClient(RegularClient("Петро", 103));
  queue.addClient(VipClient("Марія", 104));

  queue.displayQueue();
}
