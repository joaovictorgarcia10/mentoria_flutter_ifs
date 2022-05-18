import 'package:flutter/material.dart';

class PerfilHeaderWidget extends StatelessWidget {
  final String imagePath;
  final String quantidadePublicacoes;
  final String quantidadeSeguidores;
  final String quantidadeSeguindo;
  final String nome;
  final String descricao;

  const PerfilHeaderWidget({
    Key? key,
    required this.imagePath,
    required this.quantidadePublicacoes,
    required this.quantidadeSeguidores,
    required this.quantidadeSeguindo,
    required this.nome,
    required this.descricao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              maxRadius: 45.0,
            ),
            const SizedBox(width: 30.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Publicações",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(quantidadePublicacoes),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    children: [
                      const Text(
                        "Seguidores",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(quantidadeSeguidores),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    children: [
                      const Text(
                        "Seguindo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(quantidadeSeguindo),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30.0),
        Text(
          nome,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          descricao,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 30.0),
        InkWell(
          onTap: () {},
          child: Container(
            height: 30.0,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(8.0)),
            child: const Center(
              child: Text("Editar perfil"),
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        const SizedBox(height: 30.0),
      ],
    );
  }
}
