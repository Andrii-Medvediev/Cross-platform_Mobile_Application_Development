import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../domain/client_model.dart';
import 'queue_repository.dart';

class QueueRepositoryImpl implements QueueRepository {
  final Dio dio;
  final Talker talker;
  final Box<ClientModel> box;

  QueueRepositoryImpl({
    required this.dio,
    required this.talker,
    required this.box,
  });

  @override
  Future<List<ClientModel>> getCachedClients() async {
    return box.values.toList();
  }

  @override
  Future<void> cacheClients(List<ClientModel> clients) async {
    await box.clear();
    await box.putAll({for (var client in clients) client.id: client});
    talker.info('Кеш оновлено: ${clients.length} клієнтів');
  }

  @override
  Future<List<ClientModel>> getClients() async {
    talker.debug('Починаємо завантаження списку клієнтів');
    try {
      final response = await dio.get('/users');
      final List users = response.data['users'];
      final clients = users.map((json) => ClientModel.fromJson(json)).toList();
      await cacheClients(clients);
      talker.info('Клієнтів завантажено: ${clients.length}');
      return clients;
    } on DioException catch (e) {
      talker.error('Помилка завантаження клієнтів', e);
      final cached = await getCachedClients();
      if (cached.isNotEmpty) {
        talker.info('Повертаємо кешовані дані: ${cached.length} клієнтів');
        return cached;
      }
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
    talker.debug('Завантажуємо деталі клієнта з id: $id');
    try {
      final response = await dio.get('/users/$id');
      final client = ClientModel.fromJson(response.data);
      talker.info(
        'Деталі клієнта отримано: ${client.firstName} ${client.lastName}',
      );
      return client;
    } on DioException catch (e) {
      talker.error('Помилка отримання клієнта з id: $id', e);
      throw Exception('Помилка отримання клієнта: ${e.message}');
    }
  }

  @override
  Future<void> removeClient(int clientId) async {
    talker.debug('Видаляємо клієнта з id: $clientId');
    try {
      await dio.delete('/users/$clientId');
      talker.info('Клієнта видалено: $clientId');
    } on DioException catch (e) {
      talker.error('Помилка видалення клієнта', e);
      throw Exception('Помилка видалення клієнта: ${e.message}');
    }
  }
}
