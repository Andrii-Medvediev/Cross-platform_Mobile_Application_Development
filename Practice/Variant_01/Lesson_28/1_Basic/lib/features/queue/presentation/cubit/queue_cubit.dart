import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/queue_repository.dart';
import '../../domain/client_model.dart';

part 'queue_state.dart';

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

  Future<void> deleteClient(int clientId) async {
    try {
      await repository.removeClient(clientId);
      await loadClients();
    } catch (e) {
      emit(QueueErrorState(message: e.toString()));
    }
  }
}
