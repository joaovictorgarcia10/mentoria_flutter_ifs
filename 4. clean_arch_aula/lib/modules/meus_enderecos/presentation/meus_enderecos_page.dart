import 'dart:async';
import 'package:clean_arch_aula/modules/meus_enderecos/presentation/bloc/meus_enderecos_bloc.dart';
import 'package:clean_arch_aula/modules/meus_enderecos/presentation/bloc/meus_enderecos_event.dart';
import 'package:clean_arch_aula/modules/meus_enderecos/presentation/bloc/meus_enderecos_state.dart';
import 'package:clean_arch_aula/shared/models/endereco/endereco.dart';
import 'package:clean_arch_aula/shared/widgets/error_modal/error_modal_widget.dart';
import 'package:clean_arch_aula/shared/widgets/list_tile/list_tile_widget.dart';
import 'package:clean_arch_aula/shared/widgets/message_card/message_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/widgets/loading_modal/loading_modal_widget.dart';

class MeusEnderecosPage extends StatefulWidget {
  const MeusEnderecosPage({Key? key}) : super(key: key);

  @override
  State<MeusEnderecosPage> createState() => _MeusEnderecosPageState();
}

class _MeusEnderecosPageState extends State<MeusEnderecosPage> {
  final bloc = Modular.get<MeusEnderecosBloc>();
  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    bloc.add(const MeusEnderecosEvent.getListaEnderecos());

    subscription = bloc.stream.listen((state) {
      state.maybeWhen(
        loading: () => showModalBottomSheet(
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
        ),
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
        getListaEnderecosSuccess: (listaEnderecos) {
          Navigator.pop(context);
        },
        orElse: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Endereços'),
      ),
      body: BlocBuilder<MeusEnderecosBloc, MeusEnderecosState>(
        bloc: bloc,
        builder: (context, state) {
          return state.maybeWhen(
            getListaEnderecosSuccess: (listaEnderecos) {
              if (listaEnderecos.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    itemCount: listaEnderecos.length,
                    itemBuilder: (context, index) {
                      Endereco endereco = listaEnderecos[index];
                      return ListTileWidget(
                        leadingIcon: Icons.location_on_outlined,
                        title:
                            "${endereco.logradouro}, bairro ${endereco.bairro}",
                        subtitle: endereco.localidade,
                        trailingIcon: Icons.keyboard_arrow_right_outlined,
                        onTapTrailing: () {},
                      );
                    },
                  ),
                );
              }
              return const Center(
                child: MessageCardWidget(
                  message: "Você ainda não tem nenhum endereço salvo.",
                ),
              );
            },
            orElse: () => Container(),
          );
        },
      ),
    );
  }
}
