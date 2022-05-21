import 'package:clean_arch_aula/modules/home/domain/repositories/home_repository.dart';
import 'package:clean_arch_aula/modules/home/presentation/bloc/home_state.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';
import 'package:clean_arch_aula/shared/models/endereco/endereco_model.dart';

class SaveEndereco implements StreamUseCase<HomeState, EnderecoModel> {
  final HomeRepository _homeRepository;
  SaveEndereco(this._homeRepository);

  @override
  Stream<HomeState> call(EnderecoModel endereco) async* {
    yield const HomeState.loading();

    final result = await _homeRepository.saveEndereco(endereco: endereco);

    yield result.fold(
      (l) => HomeState.failure(failure: l),
      (r) => const HomeState.saveEnderecoSuccess(),
    );
  }
}
