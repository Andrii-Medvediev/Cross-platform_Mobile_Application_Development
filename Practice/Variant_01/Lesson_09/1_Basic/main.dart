void main() {
  List<String> clients = ["Tom", "Alice", "Bob"];

  for (int i = 0; i < clients.length; i++) {
    int waitingTime = calculateWaitingTime(i);
    printClientInfo(clients[i], waitingTime);
  }
}

int calculateWaitingTime(int clientsBefore) {
  return clientsBefore * 5;
}

void printClientInfo(String name, int waitingTime) {
  print("Client: $name");
  print("Waiting time: $waitingTime minutes\n");
}
