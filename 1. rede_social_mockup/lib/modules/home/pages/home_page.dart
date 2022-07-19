import 'package:aula_2/modules/home/widgets/post_widget.dart';
import 'package:aula_2/modules/home/widgets/story_widget.dart';
import 'package:aula_2/modules/shared/models/post_model.dart';
import 'package:flutter/material.dart';

import '../controller/home_controller.dart';

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
    controller.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold é o widget esqueleto da nossa página
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: FutureBuilder<List<PostModel>>(
            future: controller.repository.getPosts(),
            builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
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
                          onPressed: () =>
                              Navigator.pushNamed(context, "/settings"),
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

                    // Tratar lista vazia ou nula
                    (snapshot.data != null && snapshot.data!.isNotEmpty)
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return PostWidget(
                                  postImage: snapshot.data![index].imagePath!,
                                );
                              },
                            ),
                          )
                        : const Expanded(
                            child: Center(
                              child: Text("Você ainda tem nenhum post."),
                            ),
                          ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: () {},
                      child: const Text("Erro inesperado, tentar novamente"),
                    ),
                  ),
                );
              } else {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
