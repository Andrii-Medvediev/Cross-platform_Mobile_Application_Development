import 'dart:async';

Future<void> serveClient(String client) {
  return Future.delayed(Duration(seconds: 2), () {
    if (client.isEmpty) {
      throw Exception("Некоректне ім'я клієнта");
    }
    print("Обслуговується клієнт: $client");
  });
}

void main() {
  List<String> clients = ["Tom", "", "Alice"];

  Future<void> sequence = Future.value();

  for (var client in clients) {
    sequence = sequence.then(
      (_) => serveClient(client).catchError((err) => print("Помилка: $err")),
    );
  }

  sequence.whenComplete(() => print("Всі клієнти обслуговані"));
}
