void main() {
  String? clientName = null;
  int ticketNumber = clientName?.length ?? 0;
  print("Ticket: $ticketNumber");
}
