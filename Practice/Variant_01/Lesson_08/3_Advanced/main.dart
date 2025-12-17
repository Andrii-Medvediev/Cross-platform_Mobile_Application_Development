void main() {
  Map<String, List<int>> queues = {
    "VIP": [2, 5, 1],
    "Regular": [8, 12, 15],
    "New": [3, 7],
  };

  for (var queue in queues.entries) {
    String queueType = queue.key;
    List<int> clients = queue.value;
    print("");

    for (int i = 0; i < clients.length; i++) {
      int waitTime = clients[i];
      String status;

      if (queueType == "VIP") {
        status = waitTime > 3
            ? "VIP очікує довше 3 хвилин"
            : "VIP вчасно обслуговується";
      } else if (waitTime <= 5) {
        status = "Скоро обслуговування";
      } else if (waitTime <= 15) {
        status = "Очікування середнє";
      } else {
        status = "Очікування довге";
      }

      print("Черга: $queueType, Клієнт номер ${i + 1}, Статус: $status");
    }
  }
}
