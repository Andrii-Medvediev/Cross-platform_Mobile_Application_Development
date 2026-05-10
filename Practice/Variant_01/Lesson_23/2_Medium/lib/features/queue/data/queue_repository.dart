import '../domain/client_model.dart';

abstract class QueueRepository {
  Future<List<ClientModel>> getClients();
  Future<void> addClient(ClientModel client);
  Future<void> removeClient(String clientId);
}
