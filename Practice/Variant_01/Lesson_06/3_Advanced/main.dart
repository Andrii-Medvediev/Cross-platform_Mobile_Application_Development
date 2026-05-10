void main() {
  Map<String, List<int>> queues = {
    "VIP": [1, 4, 7],
    "Звичайна": [5, 12, 18],
    "Онлайн": [2, 9],
  };

  for (var type in queues.keys) {
    List<int> times = queues[type]!;

    for (int i = 0; i < times.length; i++) {
      int time = times[i];
      String status;

      switch (time) {
        case <= 5:
          status = "Скоро обслуговування";
          break;
        case <= 15:
          status = "Очікування середнє";
          break;
        default:
          status = time > 20 ? "Дуже довге очікування" : "Очікування довге";
      }

      print("Черга $type, клієнт №${i + 1}: $time хв — $status");
    }
  }
}
