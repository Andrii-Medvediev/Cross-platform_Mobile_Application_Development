void main() {
  const String branchName = "City Service Center";
  const int maxCapacity = 100;

  final DateTime sessionOpened = DateTime.now();
  final String queueId = "queue_${sessionOpened.millisecondsSinceEpoch}";

  var clientsInQueue = 0;
  var queueStatus = "відкрита";

  String clientName = "Олена Коваль";
  int ticketNumber = 15;
  String? phoneNumber;
  double? waitTime;

  print("=== Система електронної черги ===");
  print("Відділення: $branchName");
  print("Максимальна місткість: $maxCapacity");
  print("Сесію відкрито: $sessionOpened");
  print("Ідентифікатор черги: $queueId");

  print("");
  print("=== Реєстрація клієнта ===");
  print("Ім'я: $clientName");
  print("Талон: $ticketNumber");
  print("Телефон: ${phoneNumber ?? "Не вказано"}");
  print("Час очікування: ${waitTime ?? 0.0} хв");

  clientsInQueue++;

  print("");
  print("=== Стан черги ===");
  print("Клієнтів у черзі: $clientsInQueue");
  print("Статус черги: $queueStatus");
}
