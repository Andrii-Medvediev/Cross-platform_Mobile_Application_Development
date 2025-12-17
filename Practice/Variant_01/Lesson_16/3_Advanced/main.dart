class Client {
  String name;
  int ticketNumber;
  static int totalClients = 0;
  static const int maxQueueSize = 5;
  static List<Client> queue = [];

  Client(this.name, this.ticketNumber);

  void display() {
    print("Ticket #$ticketNumber - $name");
  }

  static bool addClient(Client client) {
    if (queue.length >= maxQueueSize) {
      print("Cannot add ${client.name}: Queue is full!");
      return false;
    }
    queue.add(client);
    totalClients++;
    print("${client.name} joined the queue (Ticket #${client.ticketNumber})");
    return true;
  }

  static void removeClient() {
    if (queue.isEmpty) {
      print("No clients to serve.");
      return;
    }
    Client served = queue.removeAt(0);
    print("Serving client: ${served.name} (Ticket #${served.ticketNumber})");
  }

  static void displayQueue() {
    print("\nCurrent Queue (${queue.length}/$maxQueueSize):");
    if (queue.isEmpty) {
      print("The queue is empty.");
    } else {
      for (var client in queue) {
        print("- ${client.name} (Ticket #${client.ticketNumber})");
      }
    }
    print("");
  }
}

void main() {
  Client.addClient(Client("Alice", 101));
  Client.addClient(Client("Bob", 102));
  Client.addClient(Client("Charlie", 103));
  Client.addClient(Client("David", 104));
  Client.addClient(Client("Eve", 105));
  Client.addClient(Client("Frank", 106));

  Client.displayQueue();

  Client.removeClient();
  Client.removeClient();

  Client.displayQueue();

  Client.addClient(Client("Grace", 107));
  Client.displayQueue();
}
