void main() {
  Map<int, String> queue = {1: "Іван", 2: "Олена", 3: "Богдан"};

  queue[4] = "Андрій";

  for (var entry in queue.entries) {
    print("Талон ${entry.key}: ${entry.value}");
  }
}
