import 'package:aula_2/modules/home/repositories/home_repository.dart';
import 'package:aula_2/modules/shared/models/post_model.dart';

class HomeController {
  final HomeRepository repository = HomeRepository();

  List<PostModel>? postModel;

  HomeController({this.postModel});

  Future<void> getPosts() async {
    List<PostModel> result = await repository.getPosts();
    postModel = result;
  }
}
