import 'package:clean_arch_aula/shared/models/endereco/endereco_model.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class HomeDatasource {
  Future<Either<Failure, EnderecoModel>> buscarEndreco({required String cep});
  Future<Either<Failure, bool>> saveEndereco({required EnderecoModel endereco});
}

class HomeDatasourceImpl implements HomeDatasource {
  final Dio dio;
  HomeDatasourceImpl({required this.dio});

  @override
  Future<Either<Failure, EnderecoModel>> buscarEndreco(
      {required String cep}) async {
    try {
      final result = await dio.get("https://viacep.com.br/ws/$cep/json/");
      if (result.statusCode == 200 && result.data != null) {
        return Right(EnderecoModel.fromMap(result.data));
      } else {
        throw ServerFailure().message;
      }
    } on DioError catch (_) {
      return Left(Failure(message: NotFoundFailure().message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  // TODO: implementar salvar no firebase
  @override
  Future<Either<Failure, bool>> saveEndereco(
      {required EnderecoModel endereco}) async {
    try {
      await Future.delayed(const Duration(seconds: 4));
      return throw ServerFailure().message;
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
