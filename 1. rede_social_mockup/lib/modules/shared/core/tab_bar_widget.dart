import 'package:aula_2/modules/curtidas/curtidas_page.dart';
import 'package:aula_2/modules/home/pages/home_page.dart';
import 'package:aula_2/modules/perfil/pages/perfil_page.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const CurtidasPage(),
    const PerfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black.withOpacity(0.3),
        animationDuration: const Duration(seconds: 3),
        height: 60,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: _currentIndex,
        onDestinationSelected: (int selectedIndex) {
          setState(() {
            _currentIndex = selectedIndex;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border_outlined),
            selectedIcon: Icon(Icons.favorite),
            label: "Curtidas",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
