import 'package:clean_arch_aula/modules/home/data/models/endereco_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../shared/core/error/failure.dart';

abstract class EnderecoRepository {
  Future<Either<Failure, EnderecoModel>> call({required String cep});
}
