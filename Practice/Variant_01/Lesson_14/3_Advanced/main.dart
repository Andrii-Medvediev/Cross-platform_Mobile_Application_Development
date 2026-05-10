Future<String> registerClient(String name, bool hasError) {
  return Future.delayed(Duration(seconds: 1), () {
    if (hasError) throw "Помилка клієнта $name: сервер недоступний";
    return "Клієнт $name зареєстрований у черзі";
  });
}

Future<void> processQueue(List<Map<String, dynamic>> clients) async {
  int ticketNumber = 100;

  for (var client in clients) {
    String name = client["name"];
    bool hasError = client["hasError"];

    try {
      String result = await registerClient(name, hasError);
      ticketNumber++;
      print(result);
      print("Талон №: $ticketNumber видано");
    } catch (e) {
      print(e);
    }

    print("---");
  }

  print("Обробку черги завершено");
}

void main() async {
  print("Система запущена");
  print("Обробка черги...\n");

  await processQueue([
    {"name": "Іван", "hasError": false},
    {"name": "Петро", "hasError": true},
    {"name": "Олена", "hasError": false},
  ]);
}
