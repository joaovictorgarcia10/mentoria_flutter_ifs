import 'package:clean_arch_aula/shared/models/endereco/endereco_model.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/models/session/session.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

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

  @override
  Future<Either<Failure, bool>> saveEndereco(
      {required EnderecoModel endereco}) async {
    try {
      final response = FirebaseFirestore.instance.collection("enderecos");

      final map = {
        "cep": endereco.cep,
        "logradouro": endereco.logradouro,
        "complemento": endereco.complemento,
        "bairro": endereco.bairro,
        "localidade": endereco.localidade,
        "uf": endereco.uf,
        "ddd": endereco.ddd,
        "documentReference": endereco.documentReference,
        "userId": Modular.get<Session>().usuario!.userId,
      };

      response.add(map);

      return const Right(true);
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.toString()));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
