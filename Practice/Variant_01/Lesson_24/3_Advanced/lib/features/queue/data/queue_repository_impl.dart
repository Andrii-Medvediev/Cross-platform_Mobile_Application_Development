import 'package:dio/dio.dart';
import '../domain/client_model.dart';
import 'queue_repository.dart';

class QueueRepositoryImpl implements QueueRepository {
  final Dio dio;

  QueueRepositoryImpl({required this.dio});

  @override
  Future<List<ClientModel>> getClients() async {
    try {
      final response = await dio.get('/users');
      final List users = response.data['users'];
      return users.map((json) => ClientModel.fromJson(json)).toList();
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          throw Exception('Перевищено час очікування відповіді');
        case DioExceptionType.connectionError:
          throw Exception('Відсутнє підключення до інтернету');
        case DioExceptionType.badResponse:
          throw Exception('Помилка сервера: ${e.response?.statusCode}');
        default:
          throw Exception('Невідома помилка: ${e.message}');
      }
    }
  }

  @override
  Future<void> addClient(String firstName, String lastName) async {
    try {
      await dio.post(
        '/users/add',
        data: {'firstName': firstName, 'lastName': lastName},
      );
    } on DioException catch (e) {
      throw Exception('Помилка додавання клієнта: ${e.message}');
    }
  }

  @override
  Future<void> removeClient(int clientId) async {
    try {
      await dio.delete('/users/$clientId');
    } on DioException catch (e) {
      throw Exception('Помилка видалення клієнта: ${e.message}');
    }
  }
}
