class Client {
  String name;
  int age;
  int ticketNumber;

  Client(this.name, this.age, this.ticketNumber);

  void displayInfo() {
    print("Талон №$ticketNumber: $name, Вік: $age");
  }
}

class QueueManager {
  List<Client> clients = [];

  void addClient(Function createClient) {
    clients.add(createClient());
  }

  void serveNext() {
    if (clients.isNotEmpty) {
      Client client = clients.removeAt(0);
      print("Обслуговується клієнт:");
      client.displayInfo();
    } else {
      print("Черга порожня!");
    }
  }

  void displayQueue() {
    if (clients.isEmpty) {
      print("Черга порожня!");
    } else {
      print("Поточна черга:");
      for (var client in clients) {
        client.displayInfo();
      }
    }
  }
}

void main() {
  QueueManager queue = QueueManager();

  int ticketCounter = 1;
  Function createClient = (String name, int age) {
    return () {
      Client client = Client(name, age, ticketCounter);
      ticketCounter++;
      return client;
    };
  };

  queue.addClient(createClient("Тарас", 30));
  queue.addClient(createClient("Аліна", 25));
  queue.addClient(() => Client("Богдан", 40, ticketCounter++));

  queue.displayQueue();
  print("");

  queue.serveNext();
  print("");
  queue.displayQueue();
}
