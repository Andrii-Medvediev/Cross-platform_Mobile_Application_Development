class Client {
  final String name;
  final int ticketNumber;

  Client(this.name, this.ticketNumber);

  @override
  String toString() => "$name (талон №$ticketNumber)";
}

class ClientQueue {
  final List<Client> _queue = [];

  void addClient(Client client) {
    try {
      _queue.add(client);
      print("Додано клієнта: $client");
    } catch (e, s) {
      print("Помилка при додаванні клієнта: $e");
      print("Стек викликів:\n$s");
    }
  }

  void serveNext() {
    try {
      final client = _queue.removeAt(0);
      print("Обслуговується клієнт: $client");
    } on RangeError catch (e, s) {
      print("Помилка: черга порожня! $e");
      print("Стек викликів:\n$s");
    } on StateError catch (e, s) {
      print("Помилка стану черги: $e");
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

  queue.addClient(Client("Іван", 1));
  queue.addClient(Client("Олена", 2));
  queue.addClient(Client("Петро", 3));

  queue.showQueue();
  print("--- Початок обслуговування ---");

  queue.serveNext();
  queue.serveNext();
  queue.serveNext();
  queue.serveNext();
}
