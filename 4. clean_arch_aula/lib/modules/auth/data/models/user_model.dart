import 'dart:convert';
import 'package:clean_arch_aula/modules/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String nome,
    required String senha,
    required String email,
  }) : super(
          nome: nome,
          senha: senha,
          email: email,
        );

  UserModel copyWith({
    String? nome,
    String? email,
    String? senha,
  }) {
    return UserModel(
      nome: nome ?? this.nome,
      email: email ?? this.email,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nome': nome});
    result.addAll({'email': email});
    result.addAll({'senha': senha});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      senha: map['senha'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'User(nome: $nome, email: $email, senha: $senha)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.nome == nome &&
        other.email == email &&
        other.senha == senha;
  }

  @override
  int get hashCode => nome.hashCode ^ email.hashCode ^ senha.hashCode;
}
