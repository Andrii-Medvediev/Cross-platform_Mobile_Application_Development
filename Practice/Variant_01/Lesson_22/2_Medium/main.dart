class ClientParser {
  int parseClientNumber(String input) {
    try {
      return int.parse(input);
    } on FormatException catch (e) {
      print("Помилка формату введення: $e");
      return -1;
    } catch (e) {
      print("Невідомий виняток: $e");
      return -1;
    }
  }
}

void main() {
  ClientParser parser = ClientParser();

  int client1 = parser.parseClientNumber("12");
  print("Номер клієнта: $client1");

  int client2 = parser.parseClientNumber("ABC"); // навмисна помилка
  print("Номер клієнта: $client2");

  print("Парсинг клієнтів завершено");
}
