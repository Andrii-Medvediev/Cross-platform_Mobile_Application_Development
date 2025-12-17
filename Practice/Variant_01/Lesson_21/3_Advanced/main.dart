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
      print("Стек: $s");
    }
  }

  void serveNext() {
    try {
      final client = _queue.removeAt(0);
      print("Обслуговується клієнт: $client");
    } catch (e, s) {
      print("Помилка при обслуговуванні: $e");
      print("Стек: $s");
    }
  }

  void insertClientAt(Client client, int index) {
    try {
      _queue.insert(index, client);
      print("Вставлено клієнта $client на позицію $index");
    } catch (e, s) {
      print("Помилка вставки: $e");
      print("Стек: $s");
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
  queue.insertClientAt(Client("Петро"), 1);
  queue.insertClientAt(Client("Марія"), 10);

  queue.showQueue();

  queue.serveNext();
  queue.serveNext();
  queue.serveNext();
  queue.serveNext();
}
