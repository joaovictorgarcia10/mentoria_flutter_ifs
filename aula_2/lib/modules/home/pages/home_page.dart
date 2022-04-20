import 'package:aula_2/modules/home/controller/home_controller.dart';
import 'package:aula_2/modules/home/widgets/post_widget.dart';
import 'package:aula_2/modules/home/widgets/story_widget.dart';
import 'package:aula_2/modules/shared/models/usuario_model.dart';
import 'package:aula_2/modules/shared/repositories/usuario_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listaDeImagens = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
  ];

  final controller = HomeController();

  @override
  void initState() {
    print(controller.usuarioModel.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold é o widget esqueleto da nossa página
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              // Cabeçalho da Página
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Home Page",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () => Navigator.pushNamed(context, "/settings"),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              // Lista de Storys
              SizedBox(
                height: 100.0,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final imageSelecionada = listaDeImagens[index];
                    return StoryWidget(imagePath: imageSelecionada);
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              // Lista de Posts
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const PostWidget();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
