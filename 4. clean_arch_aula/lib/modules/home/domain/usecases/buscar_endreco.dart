import 'package:clean_arch_aula/modules/home/domain/repositories/home_repository.dart';
import 'package:clean_arch_aula/modules/home/presentation/bloc/home_state.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';

class BuscarEndreco implements StreamUseCase<HomeState, BuscarEndrecoParams> {
  final HomeRepository _enderecoRepository;
  BuscarEndreco(this._enderecoRepository);

  @override
  Stream<HomeState> call(BuscarEndrecoParams params) async* {
    yield const HomeState.loading();

    final result = await _enderecoRepository.buscarEndereco(cep: params.cep);

    yield result.fold(
      (l) => HomeState.failure(failure: l),
      (r) => HomeState.buscarEnderecoSuccess(endereco: r),
    );
  }
}

class BuscarEndrecoParams {
  final String cep;
  BuscarEndrecoParams({
    required this.cep,
  });
}
