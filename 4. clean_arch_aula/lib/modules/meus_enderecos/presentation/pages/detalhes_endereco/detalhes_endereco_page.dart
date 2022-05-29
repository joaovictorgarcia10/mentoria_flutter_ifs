import 'package:clean_arch_aula/shared/models/endereco/endereco_model.dart';
import 'package:clean_arch_aula/shared/widgets/button/button_widget.dart';
import 'package:clean_arch_aula/shared/widgets/endereco_card/endereco_card_widget.dart';
import 'package:flutter/material.dart';

class DetalhesEnderecoPage extends StatefulWidget {
  final EnderecoModel endereco;

  const DetalhesEnderecoPage({
    Key? key,
    required this.endereco,
  }) : super(key: key);

  @override
  State<DetalhesEnderecoPage> createState() => _DetalhesEnderecoPageState();
}

class _DetalhesEnderecoPageState extends State<DetalhesEnderecoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Endereço'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              EnderecoCardWidget(endereco: widget.endereco),
              const SizedBox(height: 50.0),
              ButtonWidget(
                title: "Ver no Mapa",
                onTap: () {},
                color: Colors.green,
              ),
              const SizedBox(height: 20.0),
              ButtonWidget(
                title: "Apagar Endereço",
                onTap: () {},
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
