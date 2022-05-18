import 'package:json_placeholher_example/models/todo_model.dart';

abstract class GetTodoRepository {
  Future<List<TodoModel>> getAllTodos();
}
