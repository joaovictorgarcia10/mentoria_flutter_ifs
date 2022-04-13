import 'package:flutter/material.dart';

class CurtidasPage extends StatelessWidget {
  const CurtidasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Curtidas",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                  child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(),
                    title: const Text("Nome de usuário"),
                    subtitle: const Text("Subtitle"),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () {},
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
