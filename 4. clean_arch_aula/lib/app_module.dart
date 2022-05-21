import 'package:clean_arch_aula/modules/home/home_module.dart';
import 'package:clean_arch_aula/modules/meus_enderecos/meus_enderecos_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute("/", module: HomeModule()),
    ModuleRoute(
      "/meus_enderecos",
      module: MeusEnderecosModule(),
      transition: TransitionType.rightToLeft,
      duration: const Duration(milliseconds: 300),
    ),
  ];
}
