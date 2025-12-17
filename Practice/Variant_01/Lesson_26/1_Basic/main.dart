import 'dart:async';

Future<void> checkTicket(int ticketNumber) async {
  await Future.delayed(Duration(seconds: 2));
  print("Квиток №$ticketNumber перевірено");
}

Future<void> main() async {
  List<int> tickets = [101, 102, 103];

  print("Початок перевірки квитків...");
  for (var ticket in tickets) {
    await checkTicket(ticket);
  }
  print("Перевірка квитків завершена");
}
