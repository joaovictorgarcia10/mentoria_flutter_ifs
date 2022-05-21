import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/models/endereco/endereco_model.dart';
import 'package:dartz/dartz.dart';

abstract class MeusEnderecosRepository {
  Future<Either<Failure, List<EnderecoModel>>> getListaEnderecos();
  Future<Either<Failure, bool>> saveEndereco({required EnderecoModel endereco});
  Future<Either<Failure, bool>> deleteEndereco({required int indexEndereco});
}
