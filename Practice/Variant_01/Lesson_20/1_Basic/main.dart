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

void main() {
  Client client1 = Client("Іван", 1, ServiceType.regular);
  Client client2 = Client("Олена", 2, ServiceType.vip);
  Client client3 = Client("Петро", 3, ServiceType.priority);

  print(client1);
  print(client2);
  print(client3);
}
