class ServiceDesk {
  List<String> clients = [];

  void processClient(int index) {
    try {
      String client = clients[index];
      print("Обслуговується клієнт: $client");
    } on RangeError {
      print("Помилка: клієнта з таким індексом не існує");
    }
  }
}

void main() {
  ServiceDesk desk = ServiceDesk();

  desk.clients.addAll(["Клієнт №1", "Клієнт №2"]);

  desk.processClient(0);
  desk.processClient(1);
  desk.processClient(5); // навмисна помилка

  print("Робота вікна обслуговування завершена");
}
