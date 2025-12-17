import 'dart:async';

Future<void> serveClient(String client) {
  return Future.delayed(Duration(seconds: 2), () {
    print("Обслуговується клієнт: $client");
  });
}

void main() {
  List<String> clients = ["Tom", "Alice", "Bob"];

  Future<void> sequence = Future.value(); // початковий Future для ланцюжка

  for (var client in clients) {
    sequence = sequence.then((_) => serveClient(client));
  }

  sequence.then((_) => print("Обслуговування завершено"));
}
