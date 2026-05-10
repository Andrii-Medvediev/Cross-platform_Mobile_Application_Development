import '../domain/client_model.dart';

class QueueRepository {
  final List<ClientModel> _clients = [
    const ClientModel(id: '1', name: 'Іваненко Іван', status: 'Очікує'),
    const ClientModel(
      id: '2',
      name: 'Петренко Петро',
      status: 'Обслуговується',
    ),
    const ClientModel(id: '3', name: 'Коваленко Олена', status: 'Очікує'),
  ];

  Future<List<ClientModel>> getClients() async {
    return _clients;
  }

  Future<void> addClient(ClientModel client) async {
    _clients.add(client);
  }

  Future<void> removeClient(String clientId) async {
    _clients.removeWhere((client) => client.id == clientId);
  }
}
