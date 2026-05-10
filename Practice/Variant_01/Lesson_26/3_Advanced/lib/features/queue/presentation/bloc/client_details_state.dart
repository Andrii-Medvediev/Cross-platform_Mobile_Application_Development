part of 'client_details_bloc.dart';

abstract class ClientDetailsState {}

class ClientDetailsInitialState extends ClientDetailsState {}

class ClientDetailsLoadingState extends ClientDetailsState {}

class ClientDetailsLoadedState extends ClientDetailsState {
  final ClientModel client;
  ClientDetailsLoadedState({required this.client});
}

class ClientDetailsErrorState extends ClientDetailsState {
  final String message;
  ClientDetailsErrorState({required this.message});
}
