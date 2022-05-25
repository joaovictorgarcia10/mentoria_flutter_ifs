import 'dart:async';
import 'package:clean_arch_aula/modules/auth/domain/usecases/do_login.dart';
import 'package:clean_arch_aula/modules/auth/presentation/login/bloc/login_bloc.dart';
import 'package:clean_arch_aula/modules/auth/presentation/login/bloc/login_event.dart';
import 'package:clean_arch_aula/shared/utils/validators/app_validadors.dart';
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
  final _bloc = Modular.get<LoginBloc>();
  late StreamSubscription subscription;

  final _formKey = GlobalKey<FormState>();
  bool obscureTextPassword = true;

  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

  @override
  void initState() {
    super.initState();
    subscription = _bloc.stream.listen((state) {
      state.maybeWhen(
        success: (user) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Seja bem vindo ${user.email}!')));
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
    super.dispose();
    subscription.cancel();
    emailText.dispose();
    passwordText.dispose();
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
              const SizedBox(height: 60.0),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                  ),
                  children: [
                    TextSpan(text: "Bem vindo ao\n"),
                    TextSpan(text: "Buscar CEP Brasil."),
                  ],
                ),
              ),
              const SizedBox(height: 80.0),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      controller: emailText,
                      label: "Email",
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) => AppValidadors().emailValidator(text),
                    ),
                    TextFormFieldWidget(
                      controller: passwordText,
                      label: "Senha",
                      obscureText: obscureTextPassword,
                      suffixIcon: obscureTextPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      onTapSuffixIcon: () {
                        setState(() {
                          obscureTextPassword = !obscureTextPassword;
                        });
                      },
                      prefixIcon: Icons.vpn_key_outlined,
                      validator: (text) =>
                          AppValidadors().passwordValidator(text),
                    ),
                  ],
                ),
              ),
              // TODO: Implementar esqueci senha
              // const SizedBox(height: 5.0),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: InkWell(
              //     child: const Text("Esqueci minha senha."),
              //     onTap: () {},
              //   ),
              // ),
              const SizedBox(height: 50.0),
              ButtonWidget(
                title: "Entrar",
                color: Colors.green,
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    _bloc.add(
                      DoLoginEvent.login(
                        params: DoLoginParams(
                          email: emailText.text,
                          password: passwordText.text,
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
                onTap: () => Modular.to.pushNamed("/cadastro"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
