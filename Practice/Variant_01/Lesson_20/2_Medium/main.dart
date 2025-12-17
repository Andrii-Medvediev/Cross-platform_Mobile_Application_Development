enum ServiceType { regular, priority, vip }

class Client {
  final String name;
  final int ticketNumber;
  final ServiceType serviceType;

  Client(this.name, this.ticketNumber, this.serviceType);

  @override
  String toString() =>
      "[$ticketNumber] $name (Service: $serviceType, Index: ${serviceType.index})";
}

class ClientQueue {
  final List<Client> _queue = [];

  void addClient(Client client) {
    _queue.add(client);
    print("Додано клієнта: $client");
  }

  void showQueue() {
    print("\nПоточна черга:");
    if (_queue.isEmpty) {
      print("— немає клієнтів —");
      return;
    }
    List<Client> sortedQueue = List.from(_queue);
    sortedQueue.sort((a, b) => b.serviceType.index - a.serviceType.index);
    for (var client in sortedQueue) {
      print(client);
    }
  }
}

void main() {
  ClientQueue queue = ClientQueue();

  queue.addClient(Client("Іван", 1, ServiceType.regular));
  queue.addClient(Client("Олена", 2, ServiceType.vip));
  queue.addClient(Client("Петро", 3, ServiceType.priority));
  queue.addClient(Client("Марія", 4, ServiceType.vip));

  queue.showQueue();
}
