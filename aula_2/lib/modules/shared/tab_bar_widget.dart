import 'package:aula_2/modules/curtidas/curtidas_page.dart';
import 'package:aula_2/modules/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with TickerProviderStateMixin {
  late TabController controller;

  final List<Widget> pages = [
    const HomePage(),
    const CurtidasPage(),
    Container(color: Colors.yellow),
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: pages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: pages,
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: const [
          Tab(
            text: "Home",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "Curtidas",
            icon: Icon(Icons.favorite),
          ),
          Tab(
            text: "Meu Perfil",
            icon: Icon(Icons.person),
          ),
        ],
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black.withOpacity(0.5),
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(fontSize: 10),
      ),
    );
  }
}
