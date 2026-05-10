void main() {
  List<String> clients = ["Іван", "Олена", "Петро", "Марія", "Олег"];

  for (int i = 0; i < clients.length; i++) {
    String status;

    if (i + 1 == 1) {
      status = "На обслуговуванні";
    } else if (i + 1 <= 3) {
      status = "Скоро обслуговування";
    } else {
      status = "Очікування";
    }

    print("Клієнт ${clients[i]}, позиція ${i + 1}: $status");
  }
}
