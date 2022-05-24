import 'package:clean_arch_aula/modules/auth/domain/usecases/do_login.dart';
import 'package:clean_arch_aula/modules/auth/presentation/login/bloc/login_event.dart';
import 'package:clean_arch_aula/modules/auth/presentation/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<DoLoginEvent, DoLoginState> {
  final DoLogin _doLogin;

  LoginBloc(
    this._doLogin,
  ) : super(const DoLoginState.empty());

  @override
  Stream<DoLoginState> mapEventToState(DoLoginEvent event) async* {
    yield* event.when(
      login: (params) => _doLogin(DoLoginParams(
        email: params.email,
        password: params.password,
      )),
    );
  }
}
