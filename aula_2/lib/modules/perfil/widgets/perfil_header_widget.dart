import 'package:flutter/material.dart';

class PerfilHeaderWidget extends StatelessWidget {
  final String imagePath;
  final String quantidadePublicacoes;
  final String quantidadeSeguidores;
  final String quantidadeSeguindo;

  const PerfilHeaderWidget({
    Key? key,
    required this.imagePath,
    required this.quantidadePublicacoes,
    required this.quantidadeSeguidores,
    required this.quantidadeSeguindo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
