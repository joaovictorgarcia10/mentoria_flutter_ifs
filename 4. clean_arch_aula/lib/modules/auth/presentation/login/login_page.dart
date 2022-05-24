import 'dart:async';
import 'package:clean_arch_aula/modules/auth/domain/usecases/do_login.dart';
import 'package:clean_arch_aula/modules/auth/presentation/login/bloc/login_bloc.dart';
import 'package:clean_arch_aula/modules/auth/presentation/login/bloc/login_event.dart';
import 'package:clean_arch_aula/shared/widgets/button/button_widget.dart';
import 'package:clean_arch_aula/shared/widgets/loading_modal/loading_modal_widget.dart';
import 'package:clean_arch_aula/shared/widgets/text_form_field/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = Modular.get<LoginBloc>();
  late StreamSubscription subscription;

  bool obscureTextPassword = true;

  TextEditingController emailText = TextEditingController();
  TextEditingController senhaText = TextEditingController();

  @override
  void initState() {
    super.initState();
    subscription = _controller.stream.listen((state) {
      state.maybeWhen(
        success: (user) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Seja bem vindo ${user.nome}!')));
          Modular.to.pushReplacementNamed("/home");
        },
        loading: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            isDismissible: false,
            isScrollControlled: false,
            enableDrag: false,
            builder: (context) => const LoadingModalWidget(),
          );
        },
        failure: (failure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(failure.message.toString())));
        },
        orElse: () {},
      );
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80.0),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                  ),
                  children: [
                    TextSpan(text: "Bem vindo ao\n"),
                    TextSpan(text: "Busca CEP App"),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      controller: emailText,
                      label: "Email",
                      prefixIcon: Icons.email_outlined,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Este campo deve ser preenchido";
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      controller: senhaText,
                      label: "Senha",
                      obscureText: obscureTextPassword,
                      prefixIcon: Icons.lock_outline,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Este campo deve ser preenchido";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: const Text("Esqueci minha senha."),
                  onTap: () {
                    // Modular.to.pushNamed("/esqueceu_senha");
                  },
                ),
              ),
              const SizedBox(height: 60.0),
              ButtonWidget(
                title: "Entrar",
                color: Colors.green,
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _controller.add(
                      DoLoginEvent.login(
                        params: DoLoginParams(
                          email: emailText.text,
                          password: senhaText.text,
                        ),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 25.0),
              ButtonWidget(
                title: "Criar conta",
                color: Colors.transparent,
                onTap: () {
                  // Modular.to.pushNamed("/cadastro");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
