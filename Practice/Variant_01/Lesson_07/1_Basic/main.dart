int calculateWaitTime(int clientsBefore) => clientsBefore * 5;

void showClient(String name, int waitTime) {
  print("Клієнт: $name, Час очікування: $waitTime хв");
}

void main() {
  List<String> clients = ["Іван", "Олена", "Петро"];

  for (int i = 0; i < clients.length; i++) {
    int waitTime = calculateWaitTime(i);
    showClient(clients[i], waitTime);
  }
}
