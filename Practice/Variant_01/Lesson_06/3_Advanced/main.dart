void main() {
  Map<int, String> queue = {1: "Tom", 2: "Alice", 3: "Bob"};

  queue[4] = "Sam";

  for (var entry in queue.entries) {
    print("Ticket ${entry.key}: ${entry.value}");
  }
}
