void main() {
  int totalClients = 25;
  int servedClients = 8;
  double avgServiceTime = 5.5;
  int maxCapacity = 50;
  int operators = 3;

  int remainingClients = totalClients - servedClients;
  print("Клієнтів залишилось у черзі: $remainingClients");

  double totalServiceTime = servedClients * avgServiceTime;
  print("Загальний час обслуговування: $totalServiceTime хвилин");

  bool isMoreThanHalf = totalClients > (maxCapacity / 2);
  print("Черга заповнена більш ніж наполовину: $isMoreThanHalf");

  bool hasAvailableSpots = totalClients < maxCapacity;
  print("Є вільні місця: $hasAvailableSpots");

  double avgClientsPerOperator = totalClients / operators;
  print("Середня кількість клієнтів на оператора: $avgClientsPerOperator");
}
