import 'package:clean_arch_aula/modules/home/data/models/endereco_model.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class EnderecoDatasource {
  Future<Either<Failure, EnderecoModel>> buscarEndreco({required String cep});
}

class EnderecoDatasourceImpl implements EnderecoDatasource {
  final _dio = Dio();

  @override
  Future<Either<Failure, EnderecoModel>> buscarEndreco(
      {required String cep}) async {
    final result = await _dio.get("https://viacep.com.br/ws/$cep/json/");

    try {
      if (result.statusCode == 200 && result.data != null) {
        return Right(EnderecoModel.fromMap(result.data));
      } else {
        throw ServerFailure().message;
      }
    } catch (e, stackTrace) {
      print(stackTrace);
      return Left(Failure(message: e.toString()));
    }
  }
}
