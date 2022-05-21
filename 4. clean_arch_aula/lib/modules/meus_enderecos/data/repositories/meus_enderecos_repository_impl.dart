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
    // TODO: implement deleteEndereco
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<EnderecoModel>>> getListaEnderecos() {
    // TODO: implement getListaEnderecos
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> saveEndereco(
      {required EnderecoModel endereco}) async {
    final result =
        await _meusEnderecosDatasource.saveEndereco(endereco: endereco);
    return result;
  }
}
