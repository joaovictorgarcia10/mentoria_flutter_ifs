import 'package:aula_2/modules/perfil/widgets/perfil_header_widget.dart';
import 'package:aula_2/modules/perfil/controller/perfil_controller.dart';
import 'package:aula_2/modules/shared/models/usuario_model.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final controller = PerfilController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            child: FutureBuilder<UsuarioModel>(
              future: controller.repository.getUsuario(),
              builder: (context, AsyncSnapshot<UsuarioModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      PerfilHeaderWidget(
                        nome: snapshot.data?.nome ?? "",
                        descricao: snapshot.data?.descricao ?? "",
                        imagePath: snapshot.data?.imagePath ?? "",
                        quantidadePublicacoes:
                            snapshot.data?.posts?.length.toString() ?? "",
                        quantidadeSeguidores:
                            snapshot.data?.seguidores?.length.toString() ?? "",
                        quantidadeSeguindo:
                            snapshot.data?.seguindo?.length.toString() ?? "",
                      ),

                      // Tratar lista vazia ou nula
                      (snapshot.data?.posts?.length != null &&
                              snapshot.data!.posts!.isNotEmpty)
                          ? Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 150,
                                  childAspectRatio: 3 / 3,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                ),
                                itemCount: snapshot.data?.posts?.length,
                                itemBuilder: (context, index) {
                                  var post = snapshot.data?.posts?[index];
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(post!.imagePath!),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 5,
                                              offset: Offset(2, 2)),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : const Expanded(
                              child: Center(
                                child: Text("Você ainda tem nenhum post."),
                              ),
                            )
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
      ),
    );
  }
}
