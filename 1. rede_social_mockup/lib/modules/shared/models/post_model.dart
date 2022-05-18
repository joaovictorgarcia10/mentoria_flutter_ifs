import 'dart:convert';

import 'package:aula_2/modules/shared/models/usuario_model.dart';

class PostModel {
  final UsuarioModel? usuario;
  final String? imagePath;

  PostModel({
    required this.usuario,
    this.imagePath,
  });

  PostModel copyWith({
    UsuarioModel? usuario,
    String? imagePath,
  }) {
    return PostModel(
      usuario: usuario ?? this.usuario,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (usuario != null) {
      result.addAll({'usuario': usuario!.toMap()});
    }
    if (imagePath != null) {
      result.addAll({'imagePath': imagePath});
    }

    return result;
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      usuario:
          map['usuario'] != null ? UsuarioModel.fromMap(map['usuario']) : null,
      imagePath: map['imagePath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  String toString() => 'PostModel(usuario: $usuario, imagePath: $imagePath)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModel &&
        other.usuario == usuario &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode => usuario.hashCode ^ imagePath.hashCode;
}
