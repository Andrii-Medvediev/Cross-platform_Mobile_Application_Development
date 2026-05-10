part of 'client_details_bloc.dart';

abstract class ClientDetailsEvent extends Equatable {
  const ClientDetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadClientDetailsEvent extends ClientDetailsEvent {
  final int clientId;

  const LoadClientDetailsEvent({required this.clientId});

  @override
  List<Object?> get props => [clientId];
}

class RetryLoadClientDetailsEvent extends ClientDetailsEvent {
  final int clientId;

  const RetryLoadClientDetailsEvent({required this.clientId});

  @override
  List<Object?> get props => [clientId];
}
