import 'package:aula_2/modules/home/pages/home_page.dart';
import 'package:aula_2/modules/shared/tab_bar_widget.dart';
import 'package:flutter/material.dart';

import 'modules/settings/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TabBarWidget(),
      routes: {
        "/settings": (_) => const SettingsPage(),
      },
    );
  }
}
