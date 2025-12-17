void main() {
  var clients = ["Tom", "Alice", "Bob", "Kate", "John"];

  int totalClients = clients.length;

  for (int i = 0; i < clients.length; i++) {
    if (clients[i].startsWith("B")) continue;
    print("Клієнт ${clients[i]} знаходиться в черзі");
  }

  print("Загальна кількість клієнтів у черзі: $totalClients");
}
