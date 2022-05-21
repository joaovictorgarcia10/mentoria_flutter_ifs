import 'dart:async';

import 'package:clean_arch_aula/modules/home/data/datasources/home_datasource.dart';
import 'package:clean_arch_aula/modules/home/data/repositories/home_repository_impl.dart';
import 'package:clean_arch_aula/modules/home/domain/repositories/home_repository.dart';
import 'package:clean_arch_aula/modules/home/domain/usecases/buscar_endreco.dart';
import 'package:clean_arch_aula/modules/home/domain/usecases/save_endereco.dart';
import 'package:clean_arch_aula/modules/home/presentation/bloc/home_bloc.dart';
import 'package:clean_arch_aula/modules/home/presentation/bloc/home_event.dart';
import 'package:clean_arch_aula/modules/home/presentation/bloc/home_state.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';
import 'package:clean_arch_aula/shared/utils/masks/app_masks.dart';
import 'package:clean_arch_aula/shared/utils/validators/app_validadors.dart';
import 'package:clean_arch_aula/shared/widgets/button/button_widget.dart';
import 'package:clean_arch_aula/shared/widgets/endereco_card/endereco_card_widget.dart';
import 'package:clean_arch_aula/shared/widgets/endereco_inexistente_card/endereco_inexistente_card_widget.dart';
import 'package:clean_arch_aula/shared/widgets/error_modal/error_modal_widget.dart';
import 'package:clean_arch_aula/shared/widgets/loading_modal/loading_modal_widget.dart';
import 'package:clean_arch_aula/shared/widgets/menu_lateral/menu_lateral_widget.dart';
import 'package:clean_arch_aula/shared/widgets/message_modal/message_modal_widget.dart';
import 'package:clean_arch_aula/shared/widgets/text_form_field/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final bloc = Modular.get<HomeBloc>();

  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = bloc.stream.listen((state) {
      state.maybeWhen(
        saveEnderecoSuccess: () {
          Modular.to.pushNamed("/meus_enderecos");
        },
        loading: () {
          showModalBottomSheet(
            context: context,
            isDismissible: false,
            isScrollControlled: false,
            enableDrag: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.0),
                topRight: Radius.circular(22.0),
              ),
            ),
            builder: (context) => const LoadingModalWidget(),
          );
        },
        failure: (failure) {
          Navigator.pop(context);
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.0),
                topRight: Radius.circular(22.0),
              ),
            ),
            builder: (context) => ErrorModalWidget(message: failure.message),
          );
        },
        orElse: () {},
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateralWidget(),
      appBar: AppBar(title: const Text("Buscar CEP")),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormFieldWidget(
                    controller: textFieldController,
                    label: "CEP:",
                    prefixIcon: Icons.location_on_outlined,
                    inputFormatters: [AppMasks.cepMask],
                    keyboardType: TextInputType.number,
                    validator: (text) => AppValidadors().cepValidator(text),
                  ),
                  const SizedBox(height: 150.0),
                  BlocBuilder<HomeBloc, HomeState>(
                      bloc: bloc,
                      builder: (_, state) {
                        return state.maybeWhen(
                          buscarEnderecoSuccess: (endereco) {
                            Navigator.pop(context);
                            if (endereco.logradouro != null) {
                              return EnderecoCardWidget(
                                endereco: endereco,
                                onPressSalvar: () => showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(22.0),
                                      topRight: Radius.circular(22.0),
                                    ),
                                  ),
                                  builder: (context) {
                                    return MessageModalWidget(
                                        message:
                                            "Quer mesmo salvar este endereço?",
                                        onConfirm: () {
                                          Navigator.pop(context);
                                          bloc.add(HomeEvent.saveEndereco(
                                              model: endereco));
                                        });
                                  },
                                ),
                              );
                            }
                            return const EnderecoInexistenteCardWidget();
                          },
                          orElse: () => const Text(
                            "Aqui você pode fazer a busca de um endereço, apenas informando seu CEP.",
                            style: AppTextStyles.title,
                            textAlign: TextAlign.center,
                          ),
                        );
                      }),
                  const SizedBox(height: 150.0),
                  ButtonWidget(
                    title: "Buscar Endereço",
                    color: Colors.green,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        bloc.add(HomeEvent.buscarEndereco(
                            params: BuscarEndrecoParams(
                                cep: textFieldController.text
                                    .replaceAll("-", ""))));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
