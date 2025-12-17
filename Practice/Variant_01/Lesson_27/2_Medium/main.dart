void main() {
  List<String> clients = ["Олег", "Помилка", "Іван", "Марія"];

  Stream<String> clientStream = Stream.fromIterable(clients).map((client) {
    if (client == "Помилка") throw "Неправильне ім'я клієнта!";
    return client;
  }).asBroadcastStream();

  clientStream.listen(
    (client) => print("Підписник 1 обслуговує клієнта: $client"),
    onError: (err) => print("Підписник 1 помилка: $err"),
    onDone: () => print("Підписник 1: обслуговування завершено"),
  );

  clientStream.listen(
    (client) => print("Підписник 2 обслуговує клієнта: $client"),
    onError: (err) => print("Підписник 2 помилка: $err"),
    onDone: () => print("Підписник 2: обслуговування завершено"),
  );
}
