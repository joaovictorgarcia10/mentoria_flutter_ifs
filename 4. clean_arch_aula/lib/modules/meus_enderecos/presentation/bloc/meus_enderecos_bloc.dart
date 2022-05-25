import 'package:clean_arch_aula/modules/meus_enderecos/domain/usecases/delete_endereco.dart';
import 'package:clean_arch_aula/modules/meus_enderecos/domain/usecases/get_lista_enderecos.dart';
import 'package:clean_arch_aula/modules/meus_enderecos/presentation/bloc/meus_enderecos_event.dart';
import 'package:clean_arch_aula/modules/meus_enderecos/presentation/bloc/meus_enderecos_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeusEnderecosBloc extends Bloc<MeusEnderecosEvent, MeusEnderecosState> {
  final DeleteEndereco _deleteEndereco;
  final GetListaEnderecos _getListaEnderecos;

  MeusEnderecosBloc(
    this._deleteEndereco,
    this._getListaEnderecos,
  ) : super(const MeusEnderecosState.empty());

  @override
  Stream<MeusEnderecosState> mapEventToState(MeusEnderecosEvent event) async* {
    yield* event.when(
      getListaEnderecos: _getListaEnderecos,
      deleteEndereco: _deleteEndereco,
    );
  }
}
