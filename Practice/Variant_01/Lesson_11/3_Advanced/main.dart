class Client {
  String name;
  int age;
  int ticketNumber;

  Client(this.name, this.age, this.ticketNumber);

  void displayInfo() {
    print("Ticket #$ticketNumber: $name, Age: $age");
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
      print("Serving client:");
      client.displayInfo();
    } else {
      print("Queue is empty!");
    }
  }

  void displayQueue() {
    if (clients.isEmpty) {
      print("Queue is empty!");
    } else {
      print("Current queue:");
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

  queue.addClient(createClient("Tom", 30));
  queue.addClient(createClient("Alice", 25));
  queue.addClient(() => Client("Bob", 40, ticketCounter++));

  queue.displayQueue();
  print("");

  queue.serveNext();
  print("");
  queue.displayQueue();
}
