import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuLateralWidget extends StatefulWidget {
  const MenuLateralWidget({Key? key}) : super(key: key);

  @override
  State<MenuLateralWidget> createState() => _MenuLateralWidgetState();
}

class _MenuLateralWidgetState extends State<MenuLateralWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        maxRadius: 34,
                        backgroundColor: Colors.red,
                      ),
                      const SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Flutter Developer"),
                          SizedBox(height: 5.0),
                          Text("flutter_dev@gmail.com"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                child: ListTile(
                  leading: const Icon(Icons.location_on_outlined),
                  title: const Text("Meus Endereços"),
                  onTap: () {
                    Modular.to.popAndPushNamed("/meus_enderecos");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
