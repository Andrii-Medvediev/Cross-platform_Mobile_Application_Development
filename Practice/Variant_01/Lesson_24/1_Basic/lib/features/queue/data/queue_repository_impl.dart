import 'package:dio/dio.dart';
import '../domain/client_model.dart';
import 'queue_repository.dart';

class QueueRepositoryImpl implements QueueRepository {
  final Dio dio;

  QueueRepositoryImpl({required this.dio});

  @override
  Future<List<ClientModel>> getClients() async {
    final response = await dio.get('/users');
    final List users = response.data['users'];
    return users.map((json) => ClientModel.fromJson(json)).toList();
  }

  @override
  Future<void> addClient(String firstName, String lastName) async {
    await dio.post(
      '/users/add',
      data: {'firstName': firstName, 'lastName': lastName},
    );
  }

  @override
  Future<void> removeClient(int clientId) async {
    await dio.delete('/users/$clientId');
  }
}
