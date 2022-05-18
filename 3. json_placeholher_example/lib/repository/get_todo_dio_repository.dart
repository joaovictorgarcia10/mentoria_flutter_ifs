import 'package:dio/dio.dart';
import 'package:json_placeholher_example/models/todo_model.dart';
import 'get_todo_repository.dart';

class GetTodoDioRepository implements GetTodoRepository {
  final Dio _dio = Dio();

  @override
  Future<List<TodoModel>> getAllTodos({String? cep}) async {
    try {
      var response =
          await _dio.get("https://jsonplaceholder.typicode.com/todos/$cep");

      if (response.statusCode == 200 && response.data != null) {
        return (response.data as List)
            .map<TodoModel>((item) => TodoModel.fromMap(item))
            .toList();
      } else {
        throw Exception("Erro ao buscar dados");
      }
    } catch (e) {
      return <TodoModel>[];
    }
  }
}
