import 'package:json_placeholher_example/models/todo_model.dart';
import 'package:json_placeholher_example/repository/get_todo_repository.dart';

class GetTodoHttpRepository implements GetTodoRepository {
  @override
  Future<List<TodoModel>> getAllTodos() {
    // TODO: implement getAllTodos
    throw UnimplementedError();
  }
}
