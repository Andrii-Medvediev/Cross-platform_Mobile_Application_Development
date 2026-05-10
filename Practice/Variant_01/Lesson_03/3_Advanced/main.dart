String? getPhone() => "+380991234567";
double? getWaitTime() => 8.5;

void main() {
  const String branchName = "City Service Center";
  const int maxCapacity = 100;

  final DateTime sessionOpened = DateTime.now();
  final String queueId = "queue_${sessionOpened.millisecondsSinceEpoch}";

  var clientsInQueue = 0;
  var queueStatus = "відкрита";

  String clientName = "Олена Коваль";
  int ticketNumber = 15;

  // Значення приходить з функції — Dart не знає чи воно null
  String? phoneNumber = getPhone();
  double? waitTime = getWaitTime();

  // Тепер ?. та ! є доречними
  int? phoneLength = phoneNumber?.length;
  double confirmedWaitTime = waitTime!;

  print("=== Система електронної черги ===");
  print("Відділення: $branchName");
  print("Максимальна місткість: $maxCapacity");
  print("Сесію відкрито: $sessionOpened");
  print("Ідентифікатор черги: $queueId");

  clientsInQueue++;

  print("");
  print("=== Профіль клієнта ===");
  print("Ім'я: $clientName");
  print("Талон: $ticketNumber");
  print("Телефон: $phoneNumber (довжина: $phoneLength)");
  print("Час очікування: $confirmedWaitTime хв");
  print("Клієнтів у черзі: $clientsInQueue");
  print("Статус черги: $queueStatus");

  dynamic clientData;

  print("");
  print("=== Динамічні дані клієнта ===");

  clientData = 2;
  print("Значення: $clientData (тип: ${clientData.runtimeType})");

  clientData = "Потребує допомоги";
  print("Значення: $clientData (тип: ${clientData.runtimeType})");

  clientData = false;
  print("Значення: $clientData (тип: ${clientData.runtimeType})");
}
