void main() {
  String inputTicket = "105";
  String inputTime = "14.5";
  String inputPrice = "250.75";
  String inputRating = "4.87654";

  print("Input data (as strings):");
  print("Ticket: \"$inputTicket\"");
  print("Time: \"$inputTime\"");
  print("Price: \"$inputPrice\"");
  print("Rating: \"$inputRating\"\n");

  int ticketNumber = int.tryParse(inputTicket) ?? 0;
  double registrationTime = double.tryParse(inputTime) ?? 0.0;
  double servicePrice = double.tryParse(inputPrice) ?? 0.0;
  double serviceRating = double.parse(inputRating);

  print("Converted data:");
  print("Ticket number: ${ticketNumber.toString()}");
  print("Registration time: ${registrationTime.toString()} minutes");
  print(
    "Time (exponential): ${registrationTime.toStringAsExponential(2)} minutes",
  );
  print("Service price: \$${servicePrice.toStringAsFixed(2)}");
  print("Service rating: ${serviceRating.toStringAsPrecision(3)}");
}
