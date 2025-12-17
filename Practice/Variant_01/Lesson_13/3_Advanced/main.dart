class Client {
  String name;
  int ticketNumber;
  String priority;
  Employee? assignedEmployee;

  Client(this.name, this.ticketNumber, this.priority);
}

class VipClient extends Client {
  VipClient(String name, int ticketNumber) : super(name, ticketNumber, "VIP");
}

class RegularClient extends Client {
  RegularClient(String name, int ticketNumber)
    : super(name, ticketNumber, "Regular");
}

class Employee {
  String name;
  String position;

  Employee(this.name, this.position);
}

class QueueManager {
  List<Client> clients = [];

  void addClient(Client client) {
    clients.add(client);
    assignEmployee(client);
  }

  void assignEmployee(Client client) {
    if (client.priority == "VIP") {
      client.assignedEmployee = Employee("Mary", "Supervisor");
    } else {
      client.assignedEmployee = Employee("John", "Consultant");
    }
  }

  void displayQueue() {
    for (var client in clients) {
      print(
        "Ticket #${client.ticketNumber}: ${client.name} (${client.priority}) - Assigned to: ${client.assignedEmployee?.name} (${client.assignedEmployee?.position})",
      );
    }
  }
}

void main() {
  QueueManager queue = QueueManager();

  queue.addClient(RegularClient("Alice", 101));
  queue.addClient(VipClient("Bob", 102));
  queue.addClient(RegularClient("Charlie", 103));
  queue.addClient(VipClient("Diana", 104));

  queue.displayQueue();
}
