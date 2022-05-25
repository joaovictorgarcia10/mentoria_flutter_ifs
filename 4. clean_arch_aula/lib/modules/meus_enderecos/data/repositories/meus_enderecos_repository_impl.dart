import 'package:clean_arch_aula/modules/meus_enderecos/data/datasources/meus_enderecos_datasource.dart';
import 'package:clean_arch_aula/modules/meus_enderecos/domain/repositories/meus_enderecos_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_arch_aula/shared/models/endereco/endereco_model.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';

class MeusEnderecosRepositoryImpl implements MeusEnderecosRepository {
  final MeusEnderecosDatasource _meusEnderecosDatasource;
  MeusEnderecosRepositoryImpl(this._meusEnderecosDatasource);

  @override
  Future<Either<Failure, bool>> deleteEndereco({required int indexEndereco}) {
    final result =
        _meusEnderecosDatasource.deleteEndereco(indexEndereco: indexEndereco);
    return result;
  }

  @override
  Future<Either<Failure, List<EnderecoModel>>> getListaEnderecos() {
    final result = _meusEnderecosDatasource.getListaEnderecos();
    return result;
  }
}
