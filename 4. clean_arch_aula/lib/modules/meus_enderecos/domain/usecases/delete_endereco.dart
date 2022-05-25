import 'package:clean_arch_aula/modules/meus_enderecos/domain/repositories/meus_enderecos_repository.dart';
import 'package:clean_arch_aula/modules/meus_enderecos/presentation/bloc/meus_enderecos_state.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';

class DeleteEndereco
    implements StreamUseCase<MeusEnderecosState, DeleteEnderecoParams> {
  final MeusEnderecosRepository _meusEnderecosRepository;
  DeleteEndereco(this._meusEnderecosRepository);

  @override
  Stream<MeusEnderecosState> call(DeleteEnderecoParams params) async* {
    yield const MeusEnderecosState.loading();

    final result = await _meusEnderecosRepository.deleteEndereco(
        indexEndereco: params.index);

    yield result.fold(
      (l) => MeusEnderecosState.failure(failure: l),
      (r) => const MeusEnderecosState.deleteEnderecoSuccess(),
    );
  }
}

class DeleteEnderecoParams {
  final int index;
  DeleteEnderecoParams({
    required this.index,
  });
}
