import 'package:clean_arch_aula/modules/auth/data/models/user_model.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/models/session/session.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class AuthDatasource {
  Future<Either<Failure, UserModel>> doLogin({
    required String email,
    required String password,
  });

  Future<Either<Failure, bool>> createAccount({
    required String email,
    required String password,
  });
}

class AuthDatasourceImpl implements AuthDatasource {
  @override
  Future<Either<Failure, UserModel>> doLogin(
      {required String email, required String password}) async {
    try {
      // Função do Firebase Auth
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Retorno do Nosso Usuário
      if (credential.user != null) {
        final user = UserModel(
          email: credential.user?.email,
          nome: credential.user?.displayName,
          photoUrl: credential.user?.photoURL,
          userId: credential.user?.uid,
        );

        // Salvando sessão de usuário
        Modular.get<Session>().usuario = user;

        return Right(user);
      } else {
        throw ServerFailure().message;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return Left(Failure(message: UserNotFoundFailure().message));
      } else if (e.code == "wrong-password") {
        return Left(Failure(message: IncorrectPasswordFailure().message));
      }
      return Left(Failure(message: ServerFailure().message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> createAccount(
      {required String email, required String password}) async {
    try {
      // Função do Firebase Auth
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // Retorno ok
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return Left(Failure(message: EmailAlreadyInUseFailure().message));
      }
      return Left(Failure(message: ServerFailure().message));
    } catch (e) {
      return Left(Failure(message: ServerFailure().message));
    }
  }
}
