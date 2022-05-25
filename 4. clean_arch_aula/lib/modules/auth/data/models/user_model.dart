import 'dart:convert';
import 'package:clean_arch_aula/modules/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    String? nome,
    String? email,
    String? photoUrl,
  }) : super(
          nome: nome,
          email: email,
          photoUrl: photoUrl,
        );

  UserModel copyWith({
    String? nome,
    String? email,
    String? photoUrl,
  }) {
    return UserModel(
      nome: nome ?? this.nome,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (nome != null) {
      result.addAll({'nome': nome});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (photoUrl != null) {
      result.addAll({'photoUrl': photoUrl});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      nome: map['nome'],
      email: map['email'],
      photoUrl: map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(nome: $nome, email: $email, photoUrl: $photoUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.nome == nome &&
        other.email == email &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode => nome.hashCode ^ email.hashCode ^ photoUrl.hashCode;
}
