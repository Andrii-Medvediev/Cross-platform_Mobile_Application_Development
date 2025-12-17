void main() {
  const serviceName = "Queue Processing";
  final processingTime = DateTime.now();

  print("Service: $serviceName");
  print("Processing time: $processingTime");
  print("Client data (dynamic variable):");

  dynamic clientData;

  clientData = 105;
  print("  Value: $clientData, Type: ${clientData.runtimeType}");
  clientData = "John Smith";
  print("  Value: $clientData, Type: ${clientData.runtimeType}");
  clientData = true;
  print("  Value: $clientData, Type: ${clientData.runtimeType}");
  clientData = ["consultation", "documentation"];
  print("  Value: $clientData, Type: ${clientData.runtimeType}");
}
