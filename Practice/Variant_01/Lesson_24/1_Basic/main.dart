Future notifyClient() {
  return Future.delayed(
    Duration(seconds: 2),
    () => print("Клієнт готовий до обслуговування"),
  );
}

void main() {
  notifyClient();
  print("Перевірка черги...");
}
