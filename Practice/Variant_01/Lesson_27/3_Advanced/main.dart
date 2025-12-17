import 'dart:async';

void main() {
  List<String> clients = ["Олег", "Марія", "Помилка", "Тарас", "Анна"];

  Stream<String> clientStream = Stream.fromIterable(clients).map((client) {
    if (client == "Помилка") throw "Некоректне ім'я клієнта!";
    return client;
  }).asBroadcastStream();

  int servedCountSubscriber1 = 0;

  StreamSubscription<String>? subscriber1;

  // Підписник 1
  subscriber1 = clientStream.listen(
    (client) async {
      await Future.delayed(Duration(seconds: 1));
      print("Підписник 1 обслуговує клієнта: $client");
      servedCountSubscriber1++;
      if (servedCountSubscriber1 == 2) {
        print("Підписник 1 відписується після 2 клієнтів");
        subscriber1?.cancel();
      }
    },
    onError: (err) => print("Підписник 1 помилка: $err"),
    onDone: () => print("Підписник 1 завершив обслуговування"),
  );

  // Підписник 2
  clientStream.listen(
    (client) async {
      await Future.delayed(Duration(seconds: 1));
      print("Підписник 2 обслуговує клієнта: $client");
    },
    onError: (err) => print("Підписник 2 помилка: $err"),
    onDone: () => print("Підписник 2 завершив обслуговування"),
  );
}
