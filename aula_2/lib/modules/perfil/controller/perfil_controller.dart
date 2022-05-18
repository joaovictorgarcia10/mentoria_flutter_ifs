import 'package:aula_2/modules/shared/models/usuario_model.dart';
import 'package:aula_2/modules/perfil/repositories/perfil_repository.dart';

class PerfilController {
  final PerfilRepository repository = PerfilRepository();

  UsuarioModel? usuarioModel;
  PerfilController({this.usuarioModel});

  Future<void> getUsuario() async {
    final result = await repository.getUsuario();
    usuarioModel = result;
  }
}
