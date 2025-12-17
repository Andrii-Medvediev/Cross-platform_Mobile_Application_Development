import 'dart:async';
import 'dart:math';

Future<void> serveClient(String client) async {
  int delay = 1 + Random().nextInt(3);
  await Future.delayed(Duration(seconds: delay));
  print("Клієнт $client обслугований за $delay секунд");
}

Future<void> main() async {
  List<String> clients = ["Іван", "Василь", "Том"];

  print("Початок обслуговування клієнтів...");
  for (var client in clients) {
    await serveClient(client);
  }
  print("Обслуговування завершено");
}
