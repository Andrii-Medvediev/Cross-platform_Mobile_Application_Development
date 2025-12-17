void main() {
  int regularClients = 10;
  int vipClients = 5;
  double basePrice = 100.0;
  double vipDiscount = 0.2;
  double tax = 0.1;
  int freeSlots = 3;

  print("=== Price Calculation System ===\n");

  // ВИПРАВЛЕННЯ 1: Додано дужки для правильного обчислення ціни з податком
  double regularTotal = regularClients * (basePrice * (1 + tax));
  print("Regular clients total: \$${regularTotal.toStringAsFixed(2)}");
  print("Expected: \$1100.00\n");

  // ВИПРАВЛЕННЯ 2: Додано дужки для правильного порядку: знижка, податок, множення
  double vipTotal = vipClients * (basePrice * (1 - vipDiscount) * (1 + tax));
  print("VIP clients total: \$${vipTotal.toStringAsFixed(2)}");
  print("Expected: \$440.00\n");

  // ВИПРАВЛЕННЯ 3: Додано дужки для ясності логіки
  bool canAcceptMore = (regularClients + vipClients) < (20 - freeSlots);
  print("Can accept more clients: $canAcceptMore");
  print("Expected: true\n");

  // ВИПРАВЛЕННЯ 4: Додано дужки для правильного обчислення середньої ціни
  double avgPrice = (regularTotal + vipTotal) / (regularClients + vipClients);
  print("Average price per client: \$${avgPrice.toStringAsFixed(2)}");
  print("Expected: \$102.67\n");

  // ВИПРАВЛЕННЯ 5: Додано дужки для зміни порядку логічних операцій
  bool specialOffer =
      (vipClients < 3 || regularClients > 8) && (regularTotal > 500.0);
  print("Eligible for special offer: $specialOffer");
  print("Expected: true (but with different logic!)");
}
