import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/queue/data/queue_repository.dart';
import '../../features/queue/data/queue_repository_impl.dart';
import '../network/dio_client.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<Dio>(() => DioClient.createDio());

  getIt.registerLazySingleton<QueueRepository>(
    () => QueueRepositoryImpl(dio: getIt<Dio>()),
  );
}
