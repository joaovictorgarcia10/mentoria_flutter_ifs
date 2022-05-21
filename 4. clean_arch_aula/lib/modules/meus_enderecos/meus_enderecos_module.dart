import 'package:clean_arch_aula/modules/meus_enderecos/data/datasources/meus_enderecos_datasource.dart';
import 'package:clean_arch_aula/modules/meus_enderecos/data/repositories/meus_enderecos_repository_impl.dart';
import 'package:clean_arch_aula/modules/meus_enderecos/domain/repositories/meus_enderecos_repository.dart';
import 'package:clean_arch_aula/modules/meus_enderecos/domain/usecases/delete_endereco.dart';
import 'package:clean_arch_aula/modules/meus_enderecos/domain/usecases/get_lista_enderecos.dart';
import 'package:clean_arch_aula/modules/home/domain/usecases/save_endereco.dart';
import 'package:clean_arch_aula/modules/meus_enderecos/presentation/bloc/meus_enderecos_bloc.dart';
import 'package:clean_arch_aula/modules/meus_enderecos/presentation/meus_enderecos_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MeusEnderecosModule extends Module {
  @override
  final List<Bind> binds = [
    // Datasources
    Bind((i) => MeusEnderecosDatasourceImpl()),
    //Repository
    Bind((i) => MeusEnderecosRepositoryImpl(i<MeusEnderecosDatasource>())),
    // UseCases
    Bind((i) => GetListaEnderecos(i<MeusEnderecosRepository>())),
    Bind((i) => DeleteEndereco(i<MeusEnderecosRepository>())),

    // Blocs
    Bind((i) => MeusEnderecosBloc(
          i<DeleteEndereco>(),
          i<GetListaEnderecos>(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (context, args) => const MeusEnderecosPage())
  ];
}
