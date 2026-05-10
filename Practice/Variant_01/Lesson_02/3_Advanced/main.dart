void main() {
  String inputTicket = "105";
  String inputTime = "14.5";
  String inputPrice = "250.75";
  String inputRating = "4.87654";

  print("Вхідні дані (як рядки):");
  print("Квиток: \"$inputTicket\"");
  print("Час: \"$inputTime\"");
  print("Ціна: \"$inputPrice\"");
  print("Рейтинг: \"$inputRating\"\n");

  int ticketNumber = int.tryParse(inputTicket) ?? 0;
  double registrationTime = double.tryParse(inputTime) ?? 0.0;
  double servicePrice = double.tryParse(inputPrice) ?? 0.0;
  double serviceRating = double.parse(inputRating);

  print("Перетворені дані:");
  print("Номер квитка: ${ticketNumber.toString()}");
  print("Час реєстрації: ${registrationTime.toString()} хвилин");
  print(
    "Час (експоненційний): ${registrationTime.toStringAsExponential(2)} хвилин",
  );
  print("Ціна послуги: ${servicePrice.toStringAsFixed(2)} грн");
  print("Рейтинг послуги: ${serviceRating.toStringAsPrecision(3)}");
}
