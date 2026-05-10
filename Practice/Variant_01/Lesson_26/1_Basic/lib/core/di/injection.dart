import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../features/queue/data/queue_repository.dart';
import '../../features/queue/data/queue_repository_impl.dart';
import '../../features/queue/presentation/cubit/queue_cubit.dart';
import '../network/dio_client.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<Talker>(
    () => Talker(
      settings: TalkerSettings(useConsoleLogs: true, enabled: true),
      logger: TalkerLogger(settings: TalkerLoggerSettings(enableColors: false)),
    ),
  );

  getIt.registerLazySingleton<TalkerRouteObserver>(
    () => TalkerRouteObserver(getIt<Talker>()),
  );

  getIt.registerLazySingleton<Dio>(
    () => DioClient.createDio(talker: getIt<Talker>()),
  );

  getIt.registerLazySingleton<QueueRepository>(
    () => QueueRepositoryImpl(dio: getIt<Dio>(), talker: getIt<Talker>()),
  );

  getIt.registerFactory<QueueCubit>(
    () => QueueCubit(repository: getIt<QueueRepository>()),
  );
}
