Function createQueue() {
  int counter = 0;
  List<String> servedClients = [];

  return (String name, bool isVip) {
    counter++;
    servedClients.add(name);

    void logEntry(int number, String clientName, String vipLabel) {
      print("Клієнт №$number: $clientName [$vipLabel] — обслуговується");
    }

    if (counter > 3) {
      print("Очікування довше звичайного");
    }

    String vipLabel = isVip ? "VIP" : "звичайний";
    logEntry(counter, name, vipLabel);

    if (counter == servedClients.length) {
      return servedClients;
    }
  };
}

void main() {
  Function serve = createQueue();

  serve("Іван", false);
  serve("Олена", true);
  serve("Петро", false);
  serve("Марія", true);

  List<String> allClients = ["Іван", "Олена", "Петро", "Марія"];

  print("\nОброблено клієнтів: ${allClients.length}");
  print("Список: ${allClients.join(", ")}");
}
