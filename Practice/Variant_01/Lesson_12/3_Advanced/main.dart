enum ClientStatus { waiting, serving, completed }

class Client {
  String name;
  int ticketNumber;
  ClientStatus status;

  Client(this.name, this.ticketNumber, {this.status = ClientStatus.waiting});

  bool operator >(Client other) => ticketNumber > other.ticketNumber;
  bool operator <(Client other) => ticketNumber < other.ticketNumber;

  @override
  bool operator ==(Object other) =>
      other is Client && ticketNumber == other.ticketNumber;

  @override
  int get hashCode => ticketNumber.hashCode;
}

String statusLabel(ClientStatus status) {
  switch (status) {
    case ClientStatus.waiting:
      return 'очікує';
    case ClientStatus.serving:
      return 'обслуговується';
    case ClientStatus.completed:
      return 'обслужено';
  }
}

class QueueManager {
  String name;
  List<Client> clients = [];
  static QueueManager? _instance;

  QueueManager._internal(this.name);

  factory QueueManager(String name) {
    if (_instance == null) {
      _instance = QueueManager._internal(name);
      print('Відділення "$name" відкрито');
    } else {
      print('Відділення "${_instance!.name}" вже працює');
    }
    return _instance!;
  }

  void addClient(Client client) {
    clients.add(client);
  }

  void sortQueue() {
    for (int i = 0; i < clients.length - 1; i++) {
      for (int j = 0; j < clients.length - i - 1; j++) {
        if (clients[j] > clients[j + 1]) {
          Client temp = clients[j];
          clients[j] = clients[j + 1];
          clients[j + 1] = temp;
        }
      }
    }
  }

  void serveNext() {
    if (clients.isEmpty) {
      print('Черга порожня');
      return;
    }
    Client client = clients.removeAt(0);
    client.status = ClientStatus.serving;
    print(
      'Обслуговується: ${client.name} (талон №${client.ticketNumber}) | Статус: ${statusLabel(client.status)}',
    );
    client.status = ClientStatus.completed;
    print('${client.name} обслужено | Статус: ${statusLabel(client.status)}\n');
  }

  void showQueue() {
    for (var client in clients) {
      print(
        '${client.name} | Талон №: ${client.ticketNumber} | ${statusLabel(client.status)}',
      );
    }
  }

  QueueManager operator +(QueueManager other) {
    QueueManager combined = QueueManager._internal('${name}+${other.name}');
    combined.clients = [...clients, ...other.clients];
    return combined;
  }
}

void main() {
  QueueManager manager1 = QueueManager("Центральне");
  QueueManager manager2 = QueueManager("Центральне");

  manager1.addClient(Client("Іван", 103));
  manager1.addClient(Client("Олена", 101));
  manager2.addClient(Client("Петро", 102));

  QueueManager combined = manager1 + manager2;
  combined.sortQueue();

  print('\n=== Об\'єднана черга (після сортування) ===');
  combined.showQueue();

  print('\n=== Обслуговування ===');
  combined.serveNext();
  combined.serveNext();
}
