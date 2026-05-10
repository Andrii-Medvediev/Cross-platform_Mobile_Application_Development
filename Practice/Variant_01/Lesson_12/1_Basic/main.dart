enum ClientStatus { waiting, serving, completed }

class QueueManager {
  String name;
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

  void display() {
    print('\n=== Менеджер черги ===');
    print('Відділення: $name');
  }
}

void main() {
  QueueManager manager1 = QueueManager("Центральне");
  QueueManager manager2 = QueueManager("Центральне");

  manager1.display();
  print('\nЦе один об\'єкт: ${identical(manager1, manager2)}');
}
