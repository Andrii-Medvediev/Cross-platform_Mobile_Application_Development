class Client {
  String name;
  int ticketNumber;
  static int queueCount = 0;

  Client(this.name, this.ticketNumber) {
    queueCount++;
  }

  void display() {
    print("Client: $name | Ticket No: $ticketNumber");
  }

  static void displayQueueCount() {
    print("Total clients in queue: $queueCount\n");
  }
}

void main() {
  Client c1 = Client("Alice", 101);
  Client c2 = Client("Bob", 102);
  Client c3 = Client("Charlie", 103);

  c1.display();
  c2.display();
  c3.display();

  Client.displayQueueCount();
}
