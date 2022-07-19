import 'package:aula_formularios/models/usuario_model.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  final UsuarioModel user;

  const UserPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.user.nome!),
            const SizedBox(height: 5.0),
            Text(widget.user.cpf!),
            const SizedBox(height: 5.0),
            Text(widget.user.telefone!),
            const SizedBox(height: 5.0),
            Text(widget.user.dataDeNascimento.toString()),
            const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}
