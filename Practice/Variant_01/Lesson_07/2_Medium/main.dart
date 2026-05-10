String getStatus(int waitTime) {
  if (waitTime <= 5) {
    return "Скоро обслуговування";
  } else if (waitTime <= 15) {
    return "Очікування середнє";
  } else {
    return "Очікування довге";
  }
}

void showClient({
  required String name,
  required int waitTime,
  bool isVip = false,
}) {
  String status = getStatus(waitTime);
  String vipLabel = isVip ? "так" : "ні";
  print("Клієнт: $name | Час: $waitTime хв | Статус: $status | VIP: $vipLabel");
}

void processQueue(List<Map<String, dynamic>> clients, Function handler) {
  for (var client in clients) {
    handler(client);
  }
}

void main() {
  List<Map<String, dynamic>> clients = [
    {"name": "Іван", "waitTime": 0, "isVip": false},
    {"name": "Олена", "waitTime": 5, "isVip": true},
    {"name": "Петро", "waitTime": 10, "isVip": false},
  ];

  processQueue(clients, (client) {
    showClient(
      name: client["name"],
      waitTime: client["waitTime"],
      isVip: client["isVip"],
    );
  });
}
