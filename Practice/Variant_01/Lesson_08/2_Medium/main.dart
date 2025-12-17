void main() {
  Map<String, int> waitTimes = {"Tom": 3, "Alice": 10, "Bob": 20, "Kate": 7};

  for (var entry in waitTimes.entries) {
    if (entry.key == "Alice") continue;
    if (entry.key == "Bob") break;

    if (entry.value <= 5) {
      print("${entry.key}: Скоро обслуговування");
    } else if (entry.value <= 15) {
      print("${entry.key}: Очікування середнє");
    } else {
      print("${entry.key}: Очікування довге");
    }
  }
}
