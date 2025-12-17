class ElectronicQueue {
  List<String> clients = [];

  void callClient(int index) {
    try {
      String client = clients[index];
      print("Викликається клієнт: $client");
    } on RangeError catch (e, s) {
      print("Помилка доступу до клієнта: $e");
      print("Стек викликів:\n$s");
    } catch (e, s) {
      print("Інший виняток: $e");
      print("Стек викликів:\n$s");
    }
  }

  void removeClient(int index) {
    try {
      String removed = clients.removeAt(index);
      print("Клієнт $removed видалений з черги");
    } on RangeError catch (e, s) {
      print("Помилка видалення клієнта: $e");
      print("Стек викликів:\n$s");
    }
  }
}

void main() {
  ElectronicQueue queue = ElectronicQueue();

  queue.clients.addAll(["Клієнт №1", "Клієнт №2"]);

  queue.callClient(0);
  queue.removeClient(0);

  queue.callClient(5); // навмисна помилка
  queue.removeClient(3); // навмисна помилка

  print("Робота електронної черги завершена");
}
