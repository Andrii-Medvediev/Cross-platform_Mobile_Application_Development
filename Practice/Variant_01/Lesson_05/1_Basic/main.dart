void main() {
  List<String> queue = ["Іван", "Олена", "Богдан", "Андрій", "Катерина"];

  print("Черга: $queue");
  print("Перший клієнт: ${queue.first}");
  print("Всього клієнтів: ${queue.length}");

  queue.removeAt(0);

  print("Оновлена черга: $queue");
}
