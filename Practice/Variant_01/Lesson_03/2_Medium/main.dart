void main() {
  const int minServiceTime = 5;
  const String defaultServiceType = "standard";

  const maxWaitTime = 30;
  final configCreatedAt = DateTime.now();

  var operatingMode = "normal";
  var activeOperators = 3;

  print("Initial Configuration:");
  print("  Min service time: $minServiceTime minutes");
  print("  Max wait time: $maxWaitTime minutes");
  print("  Default service type: $defaultServiceType");
  print("  Mode: $operatingMode");
  print("  Active operators: $activeOperators");
  print("  Configuration created at: $configCreatedAt");

  operatingMode = "priority";
  activeOperators = 5;

  print("\nUpdated Configuration:");
  print("  Mode: $operatingMode");
  print("  Active operators: $activeOperators");
}
