void main() {
  String? clientName = null;
  double? waitTime = 12.5;

  int nameLength = clientName?.length ?? 0;
  print("Client name length: $nameLength");

  // ignore: unnecessary_null_comparison
  if (waitTime != null) {
    print("Wait time: ${waitTime} minutes");
  }
}
