void main() {
  List<String> clients = ["Tom", "Alice", "Jonathan", "Kate"];

  void processClients(List<String> clientList, Function handler) {
    for (var client in clientList) {
      handler(client);
    }
  }

  processClients(clients, (client) {
    print("Processing client: $client");

    void log() {
      print("Client $client logged");
    }

    log();

    if (client.length > 4) {
      print("Long name detected");
    }

    print("");
  });
}
