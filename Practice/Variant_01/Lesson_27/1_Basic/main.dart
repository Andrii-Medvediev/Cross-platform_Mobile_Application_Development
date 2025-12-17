void main() {
  List<String> clients = ["Олег", "Марія", "Іван", "Анна"];

  Stream<String> clientStream = Stream.fromIterable(clients);

  clientStream.listen(
    (client) => print("Починаємо обслуговування клієнта: $client"),
    onDone: () => print("Обслуговування завершено"),
  );
}
