import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/models/endereco/endereco_model.dart';
import 'package:dartz/dartz.dart';

abstract class MeusEnderecosDatasource {
  Future<Either<Failure, List<EnderecoModel>>> getListaEnderecos();
  Future<Either<Failure, bool>> saveEndereco({required EnderecoModel endereco});
  Future<Either<Failure, bool>> deleteEndereco({required int indexEndereco});
}

class MeusEnderecosDatasourceImpl implements MeusEnderecosDatasource {
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
    Future.delayed(const Duration(seconds: 4));
    try {
      return Right(true);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
