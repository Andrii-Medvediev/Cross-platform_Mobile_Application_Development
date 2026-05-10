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
      print('Відділення "$name" відкрито\n');
    } else {
      print('Відділення "${_instance!.name}" вже працює\n');
    }
    return _instance!;
  }

  void addClient(Client client) {
    clients.add(client);
    print(
      'Додано: ${client.name} | Талон №: ${client.ticketNumber} | Статус: ${statusLabel(client.status)}',
    );
  }

  void showQueue() {
    print('\n=== Поточна черга ===');
    for (var client in clients) {
      print('${client.name} | Талон №: ${client.ticketNumber}');
    }
  }
}

void main() {
  QueueManager manager = QueueManager("Центральне");

  Client ivan = Client("Іван", 103);
  Client olena = Client("Олена", 101);
  Client petro = Client("Петро", 102);

  manager.addClient(ivan);
  manager.addClient(olena);
  manager.addClient(petro);

  manager.showQueue();

  print('\nІван має більший номер ніж Олена: ${ivan > olena}');
  print('Талони однакові: ${ivan == olena}');
}
