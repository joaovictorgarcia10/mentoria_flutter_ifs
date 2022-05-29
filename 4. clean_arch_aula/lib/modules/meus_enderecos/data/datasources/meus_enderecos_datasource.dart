import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/models/endereco/endereco_model.dart';
import 'package:clean_arch_aula/shared/models/session/session.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class MeusEnderecosDatasource {
  Future<Either<Failure, List<EnderecoModel>>> getListaEnderecos();
  Future<Either<Failure, bool>> deleteEndereco({required int indexEndereco});
}

class MeusEnderecosDatasourceImpl implements MeusEnderecosDatasource {
  @override
  Future<Either<Failure, List<EnderecoModel>>> getListaEnderecos() async {
    await Future.delayed(const Duration(seconds: 3));
    try {
      final userId = Modular.get<Session>().usuario!.userId;

      final response = FirebaseFirestore.instance
          .collection("enderecos")
          .where("userId", isEqualTo: userId);

      final enderecos = await response.get().then((query) =>
          query.docs.map((e) => EnderecoModel.fromFirebase(e)).toList());

      return Right(enderecos);
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.toString()));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteEndereco({required int indexEndereco}) {
    // TODO: implement deleteEndereco
    throw UnimplementedError();
  }
}
