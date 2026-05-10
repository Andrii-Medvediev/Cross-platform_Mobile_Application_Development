import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/queue_repository.dart';
import '../../domain/client_model.dart';

part 'client_details_event.dart';
part 'client_details_state.dart';

class ClientDetailsBloc extends Bloc<ClientDetailsEvent, ClientDetailsState> {
  final QueueRepository repository;

  ClientDetailsBloc({required this.repository})
    : super(const ClientDetailsInitialState()) {
    on<LoadClientDetailsEvent>(_onLoadClientDetails);
    on<RetryLoadClientDetailsEvent>(_onRetryLoadClientDetails);
  }

  Future<void> _onLoadClientDetails(
    LoadClientDetailsEvent event,
    Emitter<ClientDetailsState> emit,
  ) async {
    emit(const ClientDetailsLoadingState()); // додати const
    try {
      final client = await repository.getClientById(event.clientId);
      emit(ClientDetailsLoadedState(client: client));
    } catch (e) {
      emit(ClientDetailsErrorState(message: e.toString()));
    }
  }

  Future<void> _onRetryLoadClientDetails(
    RetryLoadClientDetailsEvent event,
    Emitter<ClientDetailsState> emit,
  ) async {
    emit(const ClientDetailsLoadingState());
    try {
      final client = await repository.getClientById(event.clientId);
      emit(ClientDetailsLoadedState(client: client));
    } catch (e) {
      emit(ClientDetailsErrorState(message: e.toString()));
    }
  }
}
