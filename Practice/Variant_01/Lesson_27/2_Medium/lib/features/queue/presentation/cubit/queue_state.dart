part of 'queue_cubit.dart';

abstract class QueueState extends Equatable {
  const QueueState();

  @override
  List<Object?> get props => [];
}

class QueueInitialState extends QueueState {
  const QueueInitialState();
}

class QueueLoadingState extends QueueState {
  const QueueLoadingState();
}

class QueueLoadedState extends QueueState {
  final List<ClientModel> clients;

  const QueueLoadedState({required this.clients});

  @override
  List<Object?> get props => [clients];
}

class QueueErrorState extends QueueState {
  final String message;

  const QueueErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
