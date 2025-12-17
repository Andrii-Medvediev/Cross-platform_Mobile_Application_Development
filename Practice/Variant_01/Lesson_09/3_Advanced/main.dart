void main() {
  List<Map<String, dynamic>> clients = [
    {"name": "Tom", "position": 0},
    {"name": "Alice", "position": 1},
    {"name": "Bob", "position": 4},
  ];

  List<Map<String, dynamic>> processedClients = processQueue(clients);

  for (var client in processedClients) {
    print(client);
  }
}

List<Map<String, dynamic>> processQueue(List<Map<String, dynamic>> clients) {
  List<Map<String, dynamic>> result = [];

  for (var client in clients) {
    int waitingTime = calculateWaitingTime(client["position"]);
    String status = getClientStatus(waitingTime);
    bool priority = waitingTime <= 5 ? true : false;

    result.add({
      "name": client["name"],
      "waitingTime": waitingTime,
      "status": status,
      "priority": priority,
    });
  }

  return result;
}

int calculateWaitingTime(int position) {
  return position * 5;
}

String getClientStatus(int waitingTime) {
  if (waitingTime <= 5) {
    return "Скоро обслуговування";
  } else if (waitingTime <= 15) {
    return "Очікування середнє";
  } else {
    return "Очікування довге";
  }
}
