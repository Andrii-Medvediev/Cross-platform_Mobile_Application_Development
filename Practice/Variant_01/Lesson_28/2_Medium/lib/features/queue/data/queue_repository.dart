import '../domain/client_model.dart';

abstract class QueueRepository {
  Future<List<ClientModel>> getClients();
  Future<ClientModel> getClientById(int id);
  Future<void> removeClient(int clientId);
  Future<List<ClientModel>> getCachedClients();
  Future<void> cacheClients(List<ClientModel> clients);
}
