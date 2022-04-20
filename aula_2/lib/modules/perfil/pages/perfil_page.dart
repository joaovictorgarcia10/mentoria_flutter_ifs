import 'package:aula_2/modules/perfil/widgets/perfil_header_widget.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PerfilHeaderWidget(
                imagePath: "assets/images/img3.jpg",
                quantidadePublicacoes: "90",
                quantidadeSeguidores: "2000",
                quantidadeSeguindo: "1000",
              ),
              const SizedBox(height: 30.0),
              const Text(
                "João Victor Garcia",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 5.0),
              const Text(
                "- Flutter Developer",
                style: TextStyle(
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
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Center(
                    child: Text("Editar perfil"),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      childAspectRatio: 3 / 3,
                      crossAxisSpacing: 3.0,
                      mainAxisSpacing: 3.0,
                    ),
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print("Clicou na imagem");
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: (index % 2 == 0)
                                  ? AssetImage("assets/images/post.jpg")
                                  : AssetImage("assets/images/img1.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
