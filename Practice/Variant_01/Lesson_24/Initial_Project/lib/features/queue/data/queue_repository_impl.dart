import '../domain/client_model.dart';
import 'queue_repository.dart';

class QueueRepositoryImpl implements QueueRepository {
  final List<ClientModel> _clients = [
    const ClientModel(
      id: 1,
      firstName: 'Іваненко',
      lastName: 'Іван',
      age: 30,
      email: 'ivan@example.com',
    ),
    const ClientModel(
      id: 2,
      firstName: 'Петренко',
      lastName: 'Петро',
      age: 25,
      email: 'petro@example.com',
    ),
  ];

  @override
  Future<List<ClientModel>> getClients() async {
    return _clients;
  }

  @override
  Future<void> addClient(String firstName, String lastName) async {
    _clients.add(
      ClientModel(
        id: _clients.length + 1,
        firstName: firstName,
        lastName: lastName,
        age: 0,
        email: '',
      ),
    );
  }

  @override
  Future<void> removeClient(int clientId) async {
    _clients.removeWhere((client) => client.id == clientId);
  }
}
