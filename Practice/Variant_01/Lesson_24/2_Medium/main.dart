Future notifyClients(List<String> clients) async {
  for (var client in clients) {
    await Future.delayed(
      Duration(seconds: 1),
      () => print("Клієнт $client отримав сповіщення"),
    );
  }
  print("Всі клієнти отримали сповіщення");
}

void main() {
  List<String> clients = ["Alice", "Bob", "Tom"];
  notifyClients(clients);
}
