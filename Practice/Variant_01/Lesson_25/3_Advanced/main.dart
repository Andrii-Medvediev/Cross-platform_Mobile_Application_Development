class Client {
  String name;
  int number;

  Client(this.name, this.number);
}

class ClientQueue {
  List<Client> _clients = [];

  void addClient(Client client) {
    _clients.add(client);
  }

  Future<void> serveNextClient() {
    if (_clients.isEmpty) {
      return Future.error("Черга порожня");
    }

    Client client = _clients.removeAt(0);

    return Future.delayed(Duration(seconds: 2), () {
      if (client.name.isEmpty) {
        throw Exception("Некоректне ім'я клієнта");
      }
      print("Обслуговується клієнт ${client.number}: ${client.name}");
    });
  }
}

void main() {
  ClientQueue queue = ClientQueue();

  queue.addClient(Client("Tom", 1));
  queue.addClient(Client("", 2)); // некоректне ім'я
  queue.addClient(Client("Alice", 3));

  Future<void> chain = Future.value();

  for (int i = 0; i < 3; i++) {
    chain = chain.then((_) => queue.serveNextClient()).catchError((err) {
      print("Помилка: $err");
    });
  }

  chain.whenComplete(() {
    print("Усі клієнти обслуговані або пропущені через помилку.");
  });
}
