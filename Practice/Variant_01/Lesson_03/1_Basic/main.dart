void main() {
  const String branchName = "City Service Center";
  const int maxCapacity = 100;

  final DateTime sessionOpened = DateTime.now();
  final String queueId = "queue_${sessionOpened.millisecondsSinceEpoch}";

  var clientsInQueue = 0;
  var queueStatus = "відкрита";

  print("=== Система електронної черги ===");
  print("Відділення: $branchName");
  print("Максимальна місткість: $maxCapacity");
  print("");
  print("Сесію відкрито: $sessionOpened");
  print("Ідентифікатор черги: $queueId");
  print("");
  print("Клієнтів у черзі: $clientsInQueue");
  print("Статус черги: $queueStatus");
}
