Future<String> registerClient(String name, bool hasError) {
  return Future.delayed(Duration(seconds: 1), () {
    if (hasError) throw "Помилка реєстрації: сервер недоступний";
    return "Клієнт $name зареєстрований у черзі";
  });
}

void processClient(String name, bool hasError) {
  registerClient(name, hasError)
      .then((result) {
        print(result);
        return 101;
      })
      .then((ticket) => print("Талон №: $ticket видано"))
      .catchError((err) => print(err), test: (err) => err is String)
      .whenComplete(() => print("Операція завершена\n"));
}

void main() {
  print("Система запущена\n");
  processClient("Іван", false);
  processClient("Петро", true);
}
