void main() {
  Map<String, int> clients = {
    "Іван": 2,
    "Олена": 10,
    "Петро": 18,
    "Марія": 4,
    "Олег": 25,
  };

  for (var name in clients.keys) {
    int time = clients[name]!;

    if (name == "Петро") continue;

    if (time > 20) {
      print("Цикл зупинено: клієнт $name має час очікування $time хв");
      break;
    }

    String status;

    if (time <= 5) {
      status = "Скоро обслуговування";
    } else if (time <= 15) {
      status = "Очікування середнє";
    } else {
      status = "Очікування довге";
    }

    print("Клієнт $name: $time хв — $status");
  }
}
