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
  Future<ClientModel> getClientById(int id) async {
    try {
      final response = await dio.get('/users/$id');
      return ClientModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Помилка отримання клієнта: ${e.message}');
    }
  }
}
