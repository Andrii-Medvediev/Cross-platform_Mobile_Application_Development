void main() {
  greetClient("Tom");
  showStatus("Tom", "waiting");

  greetClient("Alice");
  showStatus("Alice", "being served");

  greetClient("Kate");
  showStatus("Kate", "completed");
}

void greetClient(String name) {
  print("Welcome, $name!");
}

void showStatus(String name, String status) {
  print("Client $name: $status\n");
}
