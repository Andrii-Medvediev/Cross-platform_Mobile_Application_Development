part of 'client_details_bloc.dart';

abstract class ClientDetailsEvent {}

class LoadClientDetailsEvent extends ClientDetailsEvent {
  final int clientId;
  LoadClientDetailsEvent({required this.clientId});
}

class RetryLoadClientDetailsEvent extends ClientDetailsEvent {
  final int clientId;
  RetryLoadClientDetailsEvent({required this.clientId});
}
