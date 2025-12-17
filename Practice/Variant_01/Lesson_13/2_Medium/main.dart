class Employee {
  String name;
  String position;

  Employee(this.name, this.position);

  void display() {
    print("Employee: $name, Position: $position");
  }
}

class Client {
  String name;
  int ticketNumber;
  String priority;
  Employee? assignedEmployee;

  Client(
    this.name,
    this.ticketNumber, {
    this.priority = "Regular",
    this.assignedEmployee,
  });

  void display() {
    print("Ticket #$ticketNumber: $name ($priority)");
    if (assignedEmployee != null) {
      print(
        "Assigned to: ${assignedEmployee!.name}, Position: ${assignedEmployee!.position}",
      );
    }
    print("");
  }
}

class VipClient extends Client {
  VipClient(String name, int ticketNumber, {Employee? assignedEmployee})
    : super(
        name,
        ticketNumber,
        priority: "VIP",
        assignedEmployee: assignedEmployee,
      );
}

void main() {
  Employee emp1 = Employee("John", "Consultant");
  Employee emp2 = Employee("Mary", "Supervisor");

  Client client1 = Client("Alice", 101, assignedEmployee: emp1);
  Client client2 = Client("Bob", 102, assignedEmployee: emp2);
  VipClient vip = VipClient("Charlie", 103, assignedEmployee: emp1);

  client1.display();
  client2.display();
  vip.display();
}
