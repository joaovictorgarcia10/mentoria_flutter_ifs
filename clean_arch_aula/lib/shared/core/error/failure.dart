class Failure implements Exception {
  final String? message;

  Failure({this.message});
}

class ServerFailure extends Failure {
  @override
  String get message =>
      "Não foi possível processar seu pedido, tente novamente mais tarde";
}

class NotFoundFailure extends Failure {
  @override
  String get message => "Registro não encontrado";
}

class PassworIncorrectFailure extends Failure {
  @override
  String get message => "Senha incorreta";
}
