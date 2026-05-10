class QueueException implements Exception {
  final String _message;
  QueueException(this._message);

  String getErrorMessage() => "QueueException: $_message";
}

class Client {
  final String name;
  final int ticketNumber;

  Client(this.name, this.ticketNumber) {
    if (name.trim().isEmpty) {
      throw QueueException("Ім'я клієнта не може бути порожнім");
    }
    if (ticketNumber < 0) {
      throw QueueException(
        "Номер талону не може бути від'ємним: $ticketNumber",
      );
    }
  }

  @override
  String toString() => "$name (талон №$ticketNumber)";
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
    } on RangeError catch (e, s) {
      print("Помилка: черга порожня! $e");
      print("Стек викликів:\n$s");
    } catch (e, s) {
      print("Невідома помилка: $e");
      print("Стек викликів:\n$s");
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

  final clients = [
    ("Іван", 1),
    ("Олена", 2),
    ("", 3),
    ("Петро", -5),
    ("Марія", 4),
  ];

  print("--- Додавання клієнтів ---");
  for (final (name, ticket) in clients) {
    try {
      queue.addClient(Client(name, ticket));
    } on QueueException catch (e) {
      print("Помилка додавання: ${e.getErrorMessage()}");
    }
  }

  queue.showQueue();
  print("--- Початок обслуговування ---");

  queue.serveNext();
  queue.serveNext();
  queue.serveNext();
  queue.serveNext();

  queue.showQueue();
  print("--- Роботу завершено ---");
}
