import '../../domain/client_model.dart';

abstract class QueueState {}

class QueueInitialState extends QueueState {}

class QueueLoadingState extends QueueState {}

class QueueLoadedState extends QueueState {
  final List<ClientModel> clients;
  QueueLoadedState({required this.clients});
}

class QueueErrorState extends QueueState {
  final String message;
  QueueErrorState({required this.message});
}
