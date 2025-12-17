Future serveClients(List<String> clients) async {
  for (var client in clients) {
    Future.delayed(
      Duration(seconds: 2),
      () => print("Обслуговано клієнта: $client"),
    );
  }
  await Future.delayed(Duration(seconds: clients.length * 2), () {
    print("Черга порожня");
  });
}

void main() {
  List<String> clients = ["Alice", "Bob", "Tom"];
  serveClients(clients);
  print("Програма працює...");
}
