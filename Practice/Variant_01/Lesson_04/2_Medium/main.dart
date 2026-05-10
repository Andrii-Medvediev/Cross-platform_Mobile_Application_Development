// ignore_for_file: unused_local_variable

void main() {
  int totalClients = 30;
  int servedClients = 12;
  int operators = 4;
  double serviceTime = 6.5;
  int vipClients = 5;

  // ВИПРАВЛЕННЯ 1: Змінено + на - для віднімання
  int remainingClients = totalClients - servedClients;
  print("Клієнтів залишилось: $remainingClients"); // 18

  // ВИПРАВЛЕННЯ 2: Змінено ~/ на / для отримання double
  double clientsPerOperator = totalClients / operators;
  print("Клієнтів на оператора: $clientsPerOperator"); // 7.5

  // ВИПРАВЛЕННЯ 3: Змінено < на > для перевірки наявності VIP
  bool hasVipClients = vipClients > 0;
  print("Є VIP клієнти: $hasVipClients"); // true

  // ВИПРАВЛЕННЯ 4: Змінено || на && та другий < на >
  bool canAcceptMore = remainingClients < 50 && operators > 0;
  print("Можна прийняти більше клієнтів: $canAcceptMore"); // true

  // ВИПРАВЛЕННЯ 5: Змінено =- на -= та значення 7 на 3
  int counter = 10;
  counter -= 3;
  print("Лічильник після декременту: $counter"); // 7
}
