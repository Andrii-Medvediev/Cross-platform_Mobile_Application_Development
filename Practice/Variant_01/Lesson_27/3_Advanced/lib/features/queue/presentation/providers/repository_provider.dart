import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/injection.dart';
import '../../data/queue_repository.dart';

final queueRepositoryProvider = Provider<QueueRepository>((ref) {
  return getIt<QueueRepository>();
});
