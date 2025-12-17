void main() {
  List<String> queue = ["Tom", "Alice", "Bob", "Sam", "Kate"];

  print("Queue: $queue");
  print("First client: ${queue.first}");
  print("Total clients: ${queue.length}");

  queue.removeAt(0);

  print("Updated queue: $queue");
}
