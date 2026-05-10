class Client {
  final String name;
  Client(this.name);

  @override
  String toString() => name;
}

class ClientQueue {
  final List<Client> _queue = [];

  void addClient(Client client) {
    _queue.add(client);
    print("Додано клієнта: $client");
  }

  void serveNext() {
    try {
      final client = _queue.removeAt(0);
      print("Обслуговується клієнт: $client");
    } catch (e) {
      print("Помилка: черга порожня!");
    } finally {
      showQueue();
    }
  }

  void showQueue() {
    print(
      "Поточна черга: ${_queue.isEmpty ? '— немає клієнтів —' : _queue.join(', ')}",
    );
  }
}

void main() {
  final queue = ClientQueue();
  queue.addClient(Client("Іван"));
  queue.addClient(Client("Олена"));
  queue.addClient(Client("Петро"));

  print("--- Початок обслуговування ---");
  queue.serveNext();
  queue.serveNext();
  queue.serveNext();
  queue.serveNext();
}
