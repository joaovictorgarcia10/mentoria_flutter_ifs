import 'package:clean_arch_aula/modules/home/presentation/bloc/home_state.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';

import '../repositorys/endereco_repository.dart';

class BuscarEndreco implements StreamUseCase<HomeState, BuscarEndrecoParams> {
  final EnderecoRepository _enderecoRepository;
  BuscarEndreco(this._enderecoRepository);

  @override
  Stream<HomeState> call(BuscarEndrecoParams params) async* {
    yield const HomeState.loading();

    final result = await _enderecoRepository(cep: params.cep);

    result.fold(
      (l) => HomeState.failure(failure: l), // FailureState
      (r) => HomeState.success(endereco: r), // SuccessState
    );
  }
}

class BuscarEndrecoParams {
  final String cep;
  BuscarEndrecoParams({
    required this.cep,
  });
}
