import 'dart:convert';

class UsuarioModel {
  String? nome;
  String? cpf;
  String? telefone;
  DateTime? dataDeNascimento;

  UsuarioModel({
    this.nome,
    this.cpf,
    this.telefone,
    this.dataDeNascimento,
  });

  UsuarioModel copyWith({
    String? nome,
    String? cpf,
    String? telefone,
    DateTime? dataDeNascimento,
  }) {
    return UsuarioModel(
      nome: nome ?? this.nome,
      cpf: cpf ?? this.cpf,
      telefone: telefone ?? this.telefone,
      dataDeNascimento: dataDeNascimento ?? this.dataDeNascimento,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (nome != null) {
      result.addAll({'nome': nome});
    }
    if (cpf != null) {
      result.addAll({'cpf': cpf});
    }
    if (telefone != null) {
      result.addAll({'telefone': telefone});
    }
    if (dataDeNascimento != null) {
      result.addAll(
          {'dataDeNascimento': dataDeNascimento!.millisecondsSinceEpoch});
    }

    return result;
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      nome: map['nome'],
      cpf: map['cpf'],
      telefone: map['telefone'],
      dataDeNascimento: map['dataDeNascimento'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dataDeNascimento'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UsuarioModel(nome: $nome, cpf: $cpf, telefone: $telefone, dataDeNascimento: $dataDeNascimento)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UsuarioModel &&
        other.nome == nome &&
        other.cpf == cpf &&
        other.telefone == telefone &&
        other.dataDeNascimento == dataDeNascimento;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        cpf.hashCode ^
        telefone.hashCode ^
        dataDeNascimento.hashCode;
  }
}
