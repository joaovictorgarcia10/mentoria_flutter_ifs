import 'package:clean_arch_aula/modules/home/domain/repositories/home_repository.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';
import 'package:clean_arch_aula/shared/models/endereco/endereco_model.dart';
import 'package:dartz/dartz.dart';

class BuscarEndreco implements UsecaseCore<EnderecoModel, BuscarEndrecoParams> {
  final HomeRepository _enderecoRepository;
  BuscarEndreco(this._enderecoRepository);

  @override
  Future<Either<Failure, EnderecoModel>> call(
      BuscarEndrecoParams params) async {
    final result = await _enderecoRepository.buscarEndereco(cep: params.cep);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}

class BuscarEndrecoParams {
  final String cep;
  BuscarEndrecoParams({
    required this.cep,
  });
}
