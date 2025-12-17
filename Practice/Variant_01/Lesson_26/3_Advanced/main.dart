import 'dart:async';
import 'dart:math';

Future<void> serveClient(String client) async {
  try {
    int delay = Random().nextInt(3) + 1; // 1–3 секунди
    await Future.delayed(Duration(seconds: delay));

    // Імітація ймовірності помилки 20%
    if (Random().nextInt(5) == 0) {
      throw "Помилка обслуговування клієнта $client";
    }

    var word = (client == "Олена" || client == "Марія")
        ? "обслугована"
        : "обслугований";
    print("Клієнт $client $word за $delay секунд");
  } catch (e) {
    print("Невдале обслуговування: $e");
  }
}

Future<void> main() async {
  List<String> queue = ["Іван", "Олена", "Петро", "Марія", "Андрій"];

  for (String client in queue) {
    await serveClient(client);
  }

  print("\nОбслуговування черги завершено.");
}
