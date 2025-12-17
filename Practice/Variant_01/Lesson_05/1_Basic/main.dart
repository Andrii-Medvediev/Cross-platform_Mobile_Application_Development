void main() {
  int totalClients = 25;
  int servedClients = 8;
  double avgServiceTime = 5.5;
  int maxCapacity = 50;
  int operators = 3;

  int remainingClients = totalClients - servedClients;
  print("Remaining clients in queue: $remainingClients");

  double totalServiceTime = servedClients * avgServiceTime;
  print("Total service time: $totalServiceTime minutes");

  bool isMoreThanHalf = totalClients > (maxCapacity / 2);
  print("Queue is more than half full: $isMoreThanHalf");

  bool hasAvailableSpots = totalClients < maxCapacity;
  print("There are available spots: $hasAvailableSpots");

  double avgClientsPerOperator = totalClients / operators;
  print("Average clients per operator: $avgClientsPerOperator");
}
