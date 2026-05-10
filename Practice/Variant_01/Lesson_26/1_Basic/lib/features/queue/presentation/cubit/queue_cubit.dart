import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/queue_repository.dart';
import 'queue_state.dart';

class QueueCubit extends Cubit<QueueState> {
  final QueueRepository repository;

  QueueCubit({required this.repository}) : super(QueueInitialState());

  Future<void> loadClients() async {
    emit(QueueLoadingState());
    try {
      final clients = await repository.getClients();
      emit(QueueLoadedState(clients: clients));
    } catch (e) {
      emit(QueueErrorState(message: e.toString()));
    }
  }
}
