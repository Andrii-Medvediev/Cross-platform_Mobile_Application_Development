void main() {
  int totalClients = 30;
  double averageServiceTime = 5.5;
  int availableOperators = 4;

  print("Total clients: $totalClients");
  print("Average service time: $averageServiceTime minutes");
  print("Available operators: $availableOperators");

  num totalServiceTime = (totalClients * averageServiceTime).toInt();
  num clientsPerOperator = totalClients / availableOperators;

  print("\nTotal service time: $totalServiceTime minutes");
  print("Clients per operator: $clientsPerOperator");
}
