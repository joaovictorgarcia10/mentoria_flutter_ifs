import 'dart:math';

import 'package:clean_arch_aula/modules/home/data/datasources/home_datasource.dart';
import 'package:clean_arch_aula/shared/models/endereco/endereco_model.dart';
import 'package:clean_arch_aula/modules/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource _homeDatasource;
  HomeRepositoryImpl(this._homeDatasource);

  @override
  Future<Either<Failure, EnderecoModel>> buscarEndereco(
      {required String cep}) async {
    final result = await _homeDatasource.buscarEndreco(cep: cep);
    return result;
  }

  @override
  Future<Either<Failure, bool>> saveEndereco(
      {required EnderecoModel endereco}) async {
    final result = await _homeDatasource.saveEndereco(endereco: endereco);
    return result;
  }
}
