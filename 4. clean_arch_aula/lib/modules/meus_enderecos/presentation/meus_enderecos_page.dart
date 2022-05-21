import 'package:flutter/material.dart';

class MeusEnderecosPage extends StatefulWidget {
  const MeusEnderecosPage({Key? key}) : super(key: key);

  @override
  State<MeusEnderecosPage> createState() => _MeusEnderecosPageState();
}

class _MeusEnderecosPageState extends State<MeusEnderecosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Endereços'),
      ),
      body: Container(),
    );
  }
}
