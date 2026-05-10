Future<String> registerClient(String name) {
  return Future.delayed(
    Duration(seconds: 2),
    () => "Клієнт $name зареєстрований у черзі",
  );
}

void main() {
  registerClient("Іван").then((result) {
    print(result);
  });

  print("Система працює");
}
