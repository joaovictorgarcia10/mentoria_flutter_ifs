import 'package:aula_2/modules/shared/mock.dart';
import 'package:aula_2/modules/shared/models/usuario_model.dart';

class UsuarioRepository {
  UsuarioModel getUsuario() {
    final response = UsuarioModel.fromMap(usuarioMock);
    return response;
  }
}
