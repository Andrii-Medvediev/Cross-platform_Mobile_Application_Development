void main() {
  const String systemName = "Electronic Queue System";
  const int maxQueueSize = 50;
  const String systemVersion = "2.0";

  final DateTime sessionStart = DateTime.now();
  final String sessionId = "session_${sessionStart.millisecondsSinceEpoch}";

  var currentClients = 0;

  print("System name: $systemName");
  print("Max queue size: $maxQueueSize");
  print("Version: $systemVersion");

  print("\nSession started at: $sessionStart");
  print("Session ID: $sessionId");

  print("\nCurrent clients in queue: $currentClients");
}
