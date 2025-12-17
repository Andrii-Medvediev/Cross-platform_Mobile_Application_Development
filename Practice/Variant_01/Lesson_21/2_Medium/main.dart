class Client {
  final String name;
  Client(this.name);

  @override
  String toString() => name;
}

class ClientQueue {
  final List<Client> _queue = [];

  void addClient(Client client) {
    try {
      _queue.add(client);
      print("Додано клієнта: $client");
    } catch (e, s) {
      print("Помилка при додаванні: $e");
      print("Стек викликів: $s");
    }
  }

  void serveNext() {
    try {
      final client = _queue.removeAt(0);
      print("Обслуговується клієнт: $client");
    } catch (e, s) {
      print("Помилка: черга порожня! $e");
      print("Стек: $s");
    }
  }

  void showQueue() => print(
    "Поточна черга: ${_queue.isEmpty ? '— немає клієнтів —' : _queue.join(', ')}",
  );
}

void main() {
  final queue = ClientQueue();

  queue.addClient(Client("Іван"));
  queue.addClient(Client("Олена"));
  queue.showQueue();

  queue.serveNext();
  queue.serveNext();
  queue.serveNext();
}
