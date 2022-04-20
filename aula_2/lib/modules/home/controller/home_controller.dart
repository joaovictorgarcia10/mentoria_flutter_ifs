import 'package:aula_2/modules/shared/models/usuario_model.dart';
import 'package:aula_2/modules/shared/repositories/usuario_repository.dart';

class HomeController {
  final UsuarioRepository repository = UsuarioRepository();

  UsuarioModel? usuarioModel;

  HomeController({this.usuarioModel}) {
    getUsuario();
  }

  void getUsuario() {
    usuarioModel = repository.getUsuario();
  }
}
