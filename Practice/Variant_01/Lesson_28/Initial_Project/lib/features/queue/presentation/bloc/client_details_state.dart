part of 'client_details_bloc.dart';

abstract class ClientDetailsState extends Equatable {
  const ClientDetailsState();

  @override
  List<Object?> get props => [];
}

class ClientDetailsInitialState extends ClientDetailsState {
  const ClientDetailsInitialState();
}

class ClientDetailsLoadingState extends ClientDetailsState {
  const ClientDetailsLoadingState();
}

class ClientDetailsLoadedState extends ClientDetailsState {
  final ClientModel client;

  const ClientDetailsLoadedState({required this.client});

  @override
  List<Object?> get props => [client];
}

class ClientDetailsErrorState extends ClientDetailsState {
  final String message;

  const ClientDetailsErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
