import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_arch_aula/modules/home/domain/usecases/buscar_endreco.dart';
import 'package:clean_arch_aula/modules/home/presentation/bloc/home_event.dart';
import 'package:clean_arch_aula/modules/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BuscarEndreco _buscarEndreco;

  HomeBloc(this._buscarEndreco) : super(const HomeState.empty());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    yield* event.when(
      buscarEndereco: (params) => _buscarEndreco(params),
    );
  }
}
