import 'package:get_it/get_it.dart';
import '../../features/queue/data/queue_repository.dart';
import '../../features/queue/data/queue_repository_impl.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<QueueRepository>(() => QueueRepositoryImpl());
}
