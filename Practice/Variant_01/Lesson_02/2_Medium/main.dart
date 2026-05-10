void main() {
  int totalClients = 30;
  double averageServiceTime = 5.5;
  int availableOperators = 4;

  print("Загальна кількість клієнтів: $totalClients");
  print("Середній час обслуговування: $averageServiceTime хвилин");
  print("Доступних операторів: $availableOperators");

  num totalServiceTime = (totalClients * averageServiceTime).toInt();
  num clientsPerOperator = totalClients / availableOperators;

  print("\nЗагальний час обслуговування: $totalServiceTime хвилин");
  print("Клієнтів на оператора: $clientsPerOperator");
}
