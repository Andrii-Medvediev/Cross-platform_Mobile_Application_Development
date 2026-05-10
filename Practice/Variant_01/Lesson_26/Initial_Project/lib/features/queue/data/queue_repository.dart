import '../domain/client_model.dart';

abstract class QueueRepository {
  Future<List<ClientModel>> getClients();
  Future<ClientModel> getClientById(int id);
}
