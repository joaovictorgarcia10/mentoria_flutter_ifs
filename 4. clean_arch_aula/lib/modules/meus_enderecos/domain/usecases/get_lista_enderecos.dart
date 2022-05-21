import 'package:clean_arch_aula/modules/meus_enderecos/domain/repositories/meus_enderecos_repository.dart';
import 'package:clean_arch_aula/modules/meus_enderecos/presentation/bloc/meus_enderecos_state.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';

class GetListaEnderecos implements StreamUseCase<MeusEnderecosState, NoParams> {
  final MeusEnderecosRepository _meusEnderecosRepository;
  GetListaEnderecos(this._meusEnderecosRepository);

  @override
  Stream<MeusEnderecosState> call([NoParams? params]) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
