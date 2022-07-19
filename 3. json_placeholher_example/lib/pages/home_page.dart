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
  List<TodoModel> todoList = <TodoModel>[];

  Future<void> _getAllTodos() async {
    todoList.addAll(await repository.getAllTodos());
    debugPrint(todoList.toString());
    setState(() {});
  }

  @override
  void initState() {
    debugPrint(todoList.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas: ${todoList.length}'),
        actions: [
          IconButton(
            onPressed: () {
              todoList = [];
              setState(() {});
            },
            icon: const Icon(Icons.delete_sweep_outlined),
          )
        ],
      ),
      body: SizedBox(
        child: Center(
          child: (todoList.isEmpty)
              ? const Center(
                  child: Text(
                    "Você não tem nenhuma tarefa",
                  ),
                )
              : ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    TodoModel todo = todoList[index];

                    return ListTile(
                      leading: CircleAvatar(child: Text(todo.id.toString())),
                      title: Text(todo.title),
                      trailing: Checkbox(
                        value: todo.completed,
                        onChanged: (value) {},
                      ),
                    );
                  },
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _getAllTodos,
        label: const Text("Baixar Lista de Tarefas"),
      ),
    );
  }
}
