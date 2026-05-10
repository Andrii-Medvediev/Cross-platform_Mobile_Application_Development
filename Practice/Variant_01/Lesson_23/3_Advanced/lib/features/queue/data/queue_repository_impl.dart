import '../domain/client_model.dart';
import 'queue_repository.dart';

class QueueRepositoryImpl implements QueueRepository {
  final List<ClientModel> _clients = [
    const ClientModel(id: '1', name: 'Іваненко Іван', status: 'Завершено'),
    const ClientModel(
      id: '2',
      name: 'Петренко Петро',
      status: 'Обслуговується',
    ),
    const ClientModel(id: '3', name: 'Коваленко Олена', status: 'Очікує'),
  ];

  @override
  Future<List<ClientModel>> getClients() async {
    return _clients;
  }

  @override
  Future<void> addClient(ClientModel client) async {
    _clients.add(client);
  }

  @override
  Future<void> removeClient(String clientId) async {
    _clients.removeWhere((client) => client.id == clientId);
  }
}
