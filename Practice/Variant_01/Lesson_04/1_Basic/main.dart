void main() {
  String clientName = "John Smith";
  int ticketNumber = 42;
  String? email;
  bool isVip = true;

  print("Client name: $clientName");
  print("Ticket number: $ticketNumber");
  print("Email: ${email ?? "Email not provided"}");
  print("VIP status: $isVip");
}
