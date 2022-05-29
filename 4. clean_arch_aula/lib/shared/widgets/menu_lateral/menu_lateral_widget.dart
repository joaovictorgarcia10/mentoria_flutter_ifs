import 'package:clean_arch_aula/shared/models/session/session.dart';
import 'package:clean_arch_aula/shared/widgets/list_tile/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuLateralWidget extends StatefulWidget {
  const MenuLateralWidget({Key? key}) : super(key: key);

  @override
  State<MenuLateralWidget> createState() => _MenuLateralWidgetState();
}

class _MenuLateralWidgetState extends State<MenuLateralWidget> {
  final user = Modular.get<Session>().usuario;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(52.0),
                      ),
                      child: Center(
                          child: Text(
                        user?.email?.substring(0, 1).toUpperCase() ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 26,
                        ),
                      )),
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(user?.nome ?? ""),
                        const SizedBox(height: 5.0),
                        Text(user?.email ?? ""),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              ListTileWidget(
                title: "Meus Endereços",
                leadingIcon: Icons.location_on_outlined,
                onTap: () => Modular.to.popAndPushNamed("/meus_enderecos"),
              ),
              ListTileWidget(
                title: "Sair",
                leadingIcon: Icons.exit_to_app_outlined,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
