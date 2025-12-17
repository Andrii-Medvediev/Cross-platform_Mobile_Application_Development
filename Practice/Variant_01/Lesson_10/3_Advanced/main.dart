void main() {
  Function clientQueue() {
    int count = 0;
    List<String> clientList = [];

    return (String name, {bool showList = false}) {
      if (showList) {
        print("All served clients: $clientList\n");
        return;
      }

      count++;
      clientList.add(name);
      print("Client #$count: $name");

      if (count > 3) {
        print("Please wait longer");
      }

      print("");
    };
  }

  var queue = clientQueue();

  queue("Tom");
  queue("Alice");
  queue("Kate");
  queue("Jonathan");
  queue("Bob");

  queue("", showList: true);
}
