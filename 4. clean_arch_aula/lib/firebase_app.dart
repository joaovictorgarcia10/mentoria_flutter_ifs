import 'package:clean_arch_aula/app_widget.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';
import 'package:clean_arch_aula/shared/widgets/button/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

enum FirebaseStatus { loading, error, success }

class FirebaseWidget extends StatefulWidget {
  const FirebaseWidget({Key? key}) : super(key: key);

  @override
  FirebaseWidgetState createState() => FirebaseWidgetState();
}

class FirebaseWidgetState extends State<FirebaseWidget> {
  final firebaseStatus = ValueNotifier<FirebaseStatus>(FirebaseStatus.loading);

  void _initApplication() async {
    try {
      firebaseStatus.value = FirebaseStatus.loading;
      await Future.delayed(const Duration(seconds: 3));
      await Firebase.initializeApp();
      firebaseStatus.value = FirebaseStatus.success;

      // ignore: avoid_print
      print("Firebase Started!");
    } catch (e) {
      firebaseStatus.value = FirebaseStatus.error;
    }
  }

  @override
  void initState() {
    super.initState;
    _initApplication();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: firebaseStatus,
      builder: (_, status, __) {
        if (status == FirebaseStatus.error) {
          return _firebaseErrorWidget(_initApplication);
        } else if (status == FirebaseStatus.success) {
          return const AppWidget();
        } else {
          return const Material(
            color: Colors.black12,
            child: Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        }
      },
    );
  }

  Widget _firebaseErrorWidget(VoidCallback onTap) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Card(
              elevation: 10,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22))),
              child: SizedBox(
                height: 250.0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Falha de Conexão",
                        style: AppTextStyles.title,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        "Tivemos uma falha de conexão e já estamos trabalhando para solucionar este problema, por favor, tente novamente mais tarde.",
                        style: AppTextStyles.bodyText,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30.0),
                      ButtonWidget(
                        title: "Tentar novamente",
                        onTap: onTap,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
