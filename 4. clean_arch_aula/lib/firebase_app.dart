import 'package:clean_arch_aula/app_widget.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';
import 'package:clean_arch_aula/shared/widgets/button/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rxdart/subjects.dart';

enum FirebaseStatus { loading, error, success }

class FirebaseWidget extends StatefulWidget {
  const FirebaseWidget({Key? key}) : super(key: key);

  @override
  FirebaseWidgetState createState() => FirebaseWidgetState();
}

class FirebaseWidgetState extends State<FirebaseWidget> {
  final firebaseStatus =
      BehaviorSubject<FirebaseStatus>.seeded(FirebaseStatus.loading);

  void _initApplication() async {
    try {
      firebaseStatus.sink.add(FirebaseStatus.loading);
      await Future.delayed(const Duration(seconds: 3));
      await Firebase.initializeApp();
      firebaseStatus.sink.add(FirebaseStatus.success);
    } catch (e) {
      firebaseStatus.sink.addError(e);
    }
  }

  @override
  void initState() {
    super.initState;
    _initApplication();
  }

  @override
  void dispose() {
    super.dispose();
    firebaseStatus.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firebaseStatus,
      initialData: FirebaseStatus.loading,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _firebaseErrorWidget(onTap: _initApplication);
        } else if (snapshot.data == FirebaseStatus.success) {
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

  Widget _firebaseErrorWidget({required VoidCallback onTap}) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Material(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Card(
              elevation: 10,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22))),
              child: SizedBox(
                height: 200.0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Tivemos um erro inesperado, tente novamente mais tarde.",
                        style: AppTextStyles.title,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20.0),
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
