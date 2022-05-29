import 'package:clean_arch_aula/modules/home/domain/usecases/buscar_endreco.dart';
import 'package:clean_arch_aula/modules/home/presentation/bloc/home_event.dart';
import 'package:clean_arch_aula/modules/home/presentation/bloc/home_state.dart';
import 'package:clean_arch_aula/modules/home/domain/usecases/save_endereco.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BuscarEndreco _buscarEndreco;
  final SaveEndereco _saveEndereco;

  HomeBloc(
    this._buscarEndreco,
    this._saveEndereco,
  ) : super(const HomeState.empty()) {
    on<HomeEvent>(_onEvent);
  }

  Future<void> _onEvent(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());

    await event.when(
      buscarEndereco: (params) async {
        final result = await _buscarEndreco(params);
        result.fold(
          (l) => emit(HomeState.failure(failure: l)),
          (r) => emit(HomeState.buscarEnderecoSuccess(endereco: r)),
        );
      },
      saveEndereco: (endereco) async {
        final result = await _saveEndereco(endereco);
        result.fold(
          (l) => emit(HomeState.failure(failure: l)),
          (r) => emit(const HomeState.saveEnderecoSuccess()),
        );
      },
    );
  }
}
