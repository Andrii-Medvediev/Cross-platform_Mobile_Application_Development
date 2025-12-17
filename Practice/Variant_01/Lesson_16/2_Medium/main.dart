class Client {
  String name;
  int ticketNumber;
  static int queueCount = 0;
  static const int maxQueueSize = 5;

  Client(this.name, this.ticketNumber) {
    queueCount++;
  }

  void display() {
    print("Client: $name | Ticket No: $ticketNumber");
  }

  static bool canJoinQueue() {
    return queueCount < maxQueueSize;
  }

  static void displayQueueCount() {
    print("Total clients in queue: $queueCount / $maxQueueSize\n");
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

  print(
    Client.canJoinQueue() ? "New client can join the queue." : "Queue is full.",
  );
}
