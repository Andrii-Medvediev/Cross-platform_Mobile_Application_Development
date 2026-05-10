import '../domain/client_model.dart';

abstract class QueueRepository {
  Future<List<ClientModel>> getClients();
  Future<void> addClient(String firstName, String lastName);
  Future<void> removeClient(int clientId);
}
