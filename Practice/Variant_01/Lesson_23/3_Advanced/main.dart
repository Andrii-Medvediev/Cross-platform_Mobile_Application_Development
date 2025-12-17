class AgeException implements Exception {
  String getMessage() => "Неприпустимий вік";
}

class TicketException implements Exception {
  String getMessage() => "Номер квитка повинен бути більше 0";
}

class EmptyQueueException implements Exception {
  String getMessage() => "Черга порожня";
}

class Client {
  String name;
  late int age;
  late int ticketNumber;

  Client(this.name, int age, int ticketNumber) {
    if (age < 1 || age > 110) throw AgeException();
    if (ticketNumber <= 0) throw TicketException();
    this.age = age;
    this.ticketNumber = ticketNumber;
  }
}

class ClientQueue {
  List<Client> clients = [];

  void addClient(Client client) {
    try {
      clients.add(client);
      print(
        "Клієнт ${client.name} доданий до черги з квитком №${client.ticketNumber}",
      );
    } on AgeException catch (e) {
      print("! Помилка додавання клієнта ${client.name}: ${e.getMessage()}");
    } on TicketException catch (e) {
      print("! Помилка додавання клієнта ${client.name}: ${e.getMessage()}");
    }
  }

  void serveNext() {
    try {
      if (clients.isEmpty) throw EmptyQueueException();
      Client served = clients.removeAt(0);
      print(
        "Обслуговано клієнта: ${served.name} (квиток №${served.ticketNumber}, вік ${served.age})",
      );
    } on EmptyQueueException catch (e) {
      print(e.getMessage());
    }
  }
}

void main() {
  ClientQueue queue = ClientQueue();

  List<Map<String, dynamic>> testClients = [
    {"name": "Tom", "age": -5, "ticket": 1},
    {"name": "Alice", "age": 25, "ticket": 5},
    {"name": "Bob", "age": 30, "ticket": 6},
    {"name": "John", "age": 50, "ticket": 0},
  ];

  for (var data in testClients) {
    try {
      Client client = Client(data["name"], data["age"], data["ticket"]);
      queue.addClient(client);
    } on AgeException catch (e) {
      print("Помилка створення клієнта ${data["name"]}: ${e.getMessage()}");
    } on TicketException catch (e) {
      print("Помилка створення клієнта ${data["name"]}: ${e.getMessage()}");
    }
  }

  queue.serveNext();
  queue.serveNext();
  queue.serveNext();
}
