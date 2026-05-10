class Client {
  String name;
  int ticketNumber;
  static int queueCount = 0;
  static const int maxQueueSize = 10;

  Client(this.name, this.ticketNumber) {
    queueCount++;
  }

  void display() {
    print("=== Клієнт ===");
    print("Ім'я: $name");
    print("Талон №: $ticketNumber\n");
  }

  static bool canJoinQueue() {
    return queueCount < maxQueueSize;
  }
}

void main() {
  Client client1 = Client("Іван", 101);
  Client client2 = Client("Олена", 102);

  client1.display();
  client2.display();

  print("Клієнтів у черзі: ${Client.queueCount}");
  print("Максимум черги: ${Client.maxQueueSize}");
  print("Чи можна приєднатися: ${Client.canJoinQueue() ? 'так' : 'ні'}");
}
