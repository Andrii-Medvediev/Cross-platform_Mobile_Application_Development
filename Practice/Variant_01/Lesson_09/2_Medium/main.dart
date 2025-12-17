void main() {
  List<int> waitingTimes = [3, 10, 20];

  for (int i = 0; i < waitingTimes.length; i++) {
    String status = getClientStatus(waitingTimes[i]);
    showClient(
      name: "Client ${i + 1}",
      waitingTime: waitingTimes[i],
      priority: waitingTimes[i] < 5,
    );
    print("Status: $status\n");
  }
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

void showClient({
  required String name,
  required int waitingTime,
  bool priority = false,
}) {
  print("Name: $name");
  print("Waiting time: $waitingTime minutes");
  print("Priority: ${priority ? "Yes" : "No"}");
}
