import 'package:aula_formularios/models/usuario_model.dart';
import 'package:aula_formularios/pages/user_page.dart';
import 'package:aula_formularios/widget/button_widget.dart';
import 'package:aula_formularios/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  UsuarioModel user = UsuarioModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormFieldWidget(
                    label: "Nome do usuario",
                    prefixIcon: const Icon(Icons.person),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[a-zA]"))
                    ],
                    keyboardType: TextInputType.text,
                    validator: (String? text) {
                      if (text == null || text.isEmpty) {
                        return "O campo nome deve ser preenchido";
                      }
                      return null;
                    },
                    onSaved: (String? text) => user = user.copyWith(nome: text),
                  ),
                  TextFormFieldWidget(
                    label: "CPF",
                    prefixIcon: const Icon(Icons.person),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    keyboardType: TextInputType.number,
                    validator: (String? text) {
                      if (text == null || text.isEmpty) {
                        return "O campo CPF deve ser preenchido";
                      }
                      return null;
                    },
                    onSaved: (String? text) => user = user.copyWith(cpf: text),
                  ),
                  TextFormFieldWidget(
                    label: "Telefone",
                    prefixIcon: const Icon(Icons.person),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    keyboardType: TextInputType.number,
                    validator: (String? text) {
                      if (text == null || text.isEmpty) {
                        return "O campo telefone deve ser preenchido";
                      }
                      return null;
                    },
                    onSaved: (String? text) =>
                        user = user.copyWith(telefone: text),
                  ),
                  const SizedBox(height: 10.0),
                  ButtonWidget(
                    color: Colors.transparent,
                    onTap: () async {
                      await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2030))
                          .then((value) {
                        user = user.copyWith(dataDeNascimento: value);
                        setState(() {});
                      });
                    },
                    title: user.dataDeNascimento == null
                        ? "Data de Nascimento"
                        : user.dataDeNascimento.toString(),
                  ),
                  const SizedBox(height: 50.0),
                  ButtonWidget(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserPage(user: user),
                            ));
                      }
                    },
                    title: "Avançar",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
