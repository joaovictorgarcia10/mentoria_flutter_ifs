import 'package:clean_arch_aula/modules/auth/domain/usecases/create_account.dart';
import 'package:clean_arch_aula/modules/auth/presentation/cadastro/bloc/cadastro_event.dart';
import 'package:clean_arch_aula/modules/auth/presentation/cadastro/bloc/cadastro_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CadastroBloc extends Bloc<CadastroEvent, CadastroState> {
  final CreateAccount _createAccount;

  CadastroBloc(
    this._createAccount,
  ) : super(const CadastroState.empty());

  @override
  Stream<CadastroState> mapEventToState(CadastroEvent event) async* {
    yield* event.when(createAccount: (params) => _createAccount(params));
  }
}
