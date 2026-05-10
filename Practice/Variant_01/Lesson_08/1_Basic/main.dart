class Client {
  String name = "";
  int age = 0;
  int ticketNumber = 0;

  void displayInfo() {
    print("Ім'я: $name, Вік: $age, Номер талону: $ticketNumber");
  }
}

void main() {
  Client client1 = Client();

  client1.name = "Тарас";
  client1.age = 30;
  client1.ticketNumber = 101;

  client1.displayInfo();
}
