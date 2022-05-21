import 'package:clean_arch_aula/modules/home/data/datasources/home_datasource.dart';
import 'package:clean_arch_aula/modules/home/data/repositories/home_repository_impl.dart';
import 'package:clean_arch_aula/modules/home/domain/repositories/home_repository.dart';
import 'package:clean_arch_aula/modules/home/domain/usecases/buscar_endreco.dart';
import 'package:clean_arch_aula/modules/home/presentation/bloc/home_bloc.dart';
import 'package:clean_arch_aula/modules/home/presentation/home_page.dart';
import 'package:clean_arch_aula/modules/home/domain/usecases/save_endereco.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // Datasources
    Bind((i) => HomeDatasourceImpl(dio: Dio())),
    //Repository
    Bind((i) => HomeRepositoryImpl(i<HomeDatasource>())),
    // UseCases
    Bind((i) => BuscarEndreco(i<HomeRepository>())),
    Bind((i) => SaveEndereco(i<HomeRepository>())),

    // Blocs
    Bind((i) => HomeBloc(
          i<BuscarEndreco>(),
          i<SaveEndereco>(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (context, args) => const HomePage()),
  ];
}
