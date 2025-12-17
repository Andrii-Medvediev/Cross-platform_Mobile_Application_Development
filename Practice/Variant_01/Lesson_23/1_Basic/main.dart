class Client {
  String name;
  int age = 0;

  Client(this.name, int age) {
    if (age < 1 || age > 110) {
      throw Exception("Неприпустимий вік");
    } else {
      this.age = age;
    }
  }
}

void main() {
  List<String> clientNames = ["Tom", "Alice", "Bob"];
  List<int> clientAges = [-5, 25, 120];

  for (int i = 0; i < clientNames.length; i++) {
    try {
      Client client = Client(clientNames[i], clientAges[i]);
      print("Створено клієнта: ${client.name}, вік: ${client.age}");
    } on Exception catch (e) {
      print(e);
      print("Об’єкт клієнта не створено");
    }
  }

  print("Завершення програми");
}
