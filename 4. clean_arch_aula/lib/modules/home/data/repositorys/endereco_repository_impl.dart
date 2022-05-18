import 'package:clean_arch_aula/modules/home/data/datasources/endereco_datasource.dart';
import 'package:clean_arch_aula/modules/home/data/models/endereco_model.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import '../../domain/repositorys/endereco_repository.dart';

class EnderecoRepositoryImpl implements EnderecoRepository {
  final EnderecoDatasource _enderecoDatasource;
  EnderecoRepositoryImpl(this._enderecoDatasource);

  @override
  Future<Either<Failure, EnderecoModel>> call({required String cep}) async {
    final result = await _enderecoDatasource.buscarEndreco(cep: cep);
    return result;
  }
}
