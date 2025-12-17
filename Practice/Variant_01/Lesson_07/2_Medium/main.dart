void main() {
  List<int> waitingTimes = [3, 10, 20, 1];
  List<String> statuses = [];

  for (var time in waitingTimes) {
    if (time <= 5) {
      statuses.add("Скоро обслуговування");
    } else if (time <= 15) {
      statuses.add("Очікування середнє");
    } else {
      statuses.add("Очікування довге");
    }
  }

  print(statuses);
}
