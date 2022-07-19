import 'package:aula_2/modules/shared/models/post_model.dart';

class HomeRepository {
  Future<List<PostModel>> getPosts() async {
    return Future.delayed(const Duration(seconds: 3)).then(
      (_) {
        List<PostModel> response = (postsMock)
            .map<PostModel>((item) => PostModel.fromMap(item))
            .toList();

        return response;
      },
    );
  }
}

final postsMock = [
  {
    "usuario": {
      "nome": "Elon Musk",
      "descricao": "Professora do IFS",
      "imagePath": "assets/images/img1.jpg",
      "posts": [],
      "seguidores": [],
      "seguindo": []
    },
    "imagePath": "assets/images/post.jpg",
  },
  {
    "usuario": {
      "nome": "Mark Zuckberg",
      "descricao": "Professora do IFS",
      "imagePath": "assets/images/img2.jpg",
      "posts": [],
      "seguidores": [],
      "seguindo": []
    },
    "imagePath": "assets/images/img2.jpg",
  },
  {
    "usuario": {
      {
        "nome": "Bill Gates",
        "descricao": "Professora do IFS",
        "imagePath": "assets/images/img3.jpg",
        "posts": [],
        "seguidores": [],
        "seguindo": []
      },
    },
    "imagePath": "assets/images/img2.jpg",
  },
  {
    "usuario": {
      {
        "nome": "Robert Martin",
        "descricao": "Professora do IFS",
        "imagePath": "assets/images/img1.jpg",
        "posts": [],
        "seguidores": [],
        "seguindo": []
      },
    },
    "imagePath": "assets/images/img3.jpg",
  },
];
