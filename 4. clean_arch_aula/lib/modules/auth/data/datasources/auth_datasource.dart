import 'package:clean_arch_aula/modules/auth/data/models/user_model.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthDatasource {
  Future<Either<Failure, UserModel>> doLogin(
      {required String email, required String password});
}

class AuthDatasourceImpl implements AuthDatasource {
  @override
  Future<Either<Failure, UserModel>> doLogin(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 3));
    try {
      var result = UserModel.fromMap(mock);

      if (email == mock["email"]) {
        if (password == mock["senha"]) {
          return Right(result);
        }
        throw NotFoundFailure().message;
      }
      throw NotFoundFailure().message;
    } catch (e) {
      return Left(
        Failure(message: e.toString()),
      );
    }
  }
}

var mock = {
  "name": "Flutter Dev",
  "senha": "123",
  "email": "teste@email.com",
};
