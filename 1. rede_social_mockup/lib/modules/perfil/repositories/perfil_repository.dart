import 'package:aula_2/modules/shared/models/usuario_model.dart';

class PerfilRepository {
  Future<UsuarioModel> getUsuario() async {
    return Future.delayed(const Duration(seconds: 3)).then((value) {
      final UsuarioModel response = UsuarioModel.fromMap(usuarioMock);
      return response;
    });
  }
}

final usuarioMock = <String, dynamic>{
  "nome": "João Victor Garcia",
  "descricao": "Flutter Developer",
  "imagePath": "assets/images/img1.jpg",
  "posts": [
    {
      "imagePath": "assets/images/post.jpg",
    },
    {
      "imagePath": "assets/images/img2.jpg",
    },
    {
      "imagePath": "assets/images/img2.jpg",
    },
    {
      "imagePath": "assets/images/img3.jpg",
    },
    {
      "imagePath": "assets/images/post.jpg",
    },
    {
      "imagePath": "assets/images/img2.jpg",
    },
    {
      "imagePath": "assets/images/img3.jpg",
    },
    {
      "imagePath": "assets/images/post.jpg",
    },
    {
      "imagePath": "assets/images/img2.jpg",
    },
    {
      "imagePath": "assets/images/img3.jpg",
    },
  ],
  "seguidores": [],
  "seguindo": [
    {
      "nome": "Leila Buarque",
      "descricao": "Professora do IFS",
      "imagePath": "assets/images/img2.jpg",
      "posts": [],
      "seguidores": [],
      "seguindo": []
    },
    {
      "nome": "Leila Buarque",
      "descricao": "Professora do IFS",
      "imagePath": "assets/images/img2.jpg",
      "posts": [],
      "seguidores": [],
      "seguindo": []
    },
  ]
};
