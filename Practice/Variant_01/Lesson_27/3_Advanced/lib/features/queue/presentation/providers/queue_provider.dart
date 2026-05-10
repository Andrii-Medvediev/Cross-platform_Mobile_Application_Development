import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/queue_repository.dart';
import '../cubit/queue_cubit.dart';
import 'repository_provider.dart';

class QueueNotifier extends StateNotifier<QueueState> {
  final QueueRepository repository;

  QueueNotifier({required this.repository}) : super(const QueueInitialState());

  Future<void> loadClients() async {
    state = const QueueLoadingState();
    try {
      final clients = await repository.getClients();
      state = QueueLoadedState(clients: clients);
    } catch (e) {
      state = QueueErrorState(message: e.toString());
    }
  }
}

final queueProvider = StateNotifierProvider<QueueNotifier, QueueState>((ref) {
  return QueueNotifier(repository: ref.watch(queueRepositoryProvider));
});
