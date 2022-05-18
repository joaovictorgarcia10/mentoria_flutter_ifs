import 'package:flutter/material.dart';
import 'package:json_placeholher_example/models/todo_model.dart';
import 'package:json_placeholher_example/repository/get_todo_dio_repository.dart';
import '../repository/get_todo_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetTodoRepository repository = GetTodoDioRepository();
  ValueNotifier todoList = ValueNotifier(<TodoModel>[]);

  void _getAllTodos() async {
    todoList.value.addAll(await repository.getAllTodos());
    print(todoList.value);
  }

  @override
  void initState() {
    print(todoList.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SizedBox(
        child: ValueListenableBuilder(
          valueListenable: todoList,
          builder: (___, __, _) {
            if (todoList.value.isEmpty) {
              return const Center(
                child: Text(
                  "Você não tem nenhuma tarefa",
                ),
              );
            }
            return ListView.builder(
              itemCount: todoList.value.length,
              itemBuilder: (context, index) {
                TodoModel todo = todoList.value[index];

                return ListTile(
                  leading: CircleAvatar(child: Text(todo.id.toString())),
                  title: Text(todo.title),
                  trailing: Checkbox(
                    value: todo.completed,
                    onChanged: (value) {},
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _getAllTodos,
        label: const Text("Baixar Lista de Tarefas"),
      ),
    );
  }
}
